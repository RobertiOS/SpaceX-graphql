//
//  MainListViewModel.swift
//  FruitsGraphQL
//
//  Created by Robert on 11/22/22.
//

import Foundation
import Apollo
import Combine
import OrderedCollections
import SpaceXGQL

protocol MainListViewModelRepresentable: AnyObject {
    var launchesListSubject: PassthroughSubject<[LaunchDetails], Error> { get set }
    func loadMoreLaunches()
    func search(text: String?)
    func presentDetailView(index: Int)
}

final class MainListViewModel<R: AppRouter> {
    private let apiManager: ApiManagerListRepresentable
    var launchesListSubject = PassthroughSubject<[LaunchDetails], Error>()
    private var lastConnection: LaunchListQuery.Data.Launches?
    private var subscriptions = Set<AnyCancellable>()
    private var launches = [LaunchDetails]() {
        didSet {
            var set = OrderedSet<LaunchDetails>()
            set.append(contentsOf: launches)
            launchesListSubject.send(Array(set))
        }
    }
    
    weak var router: R?

    init(apimanager: ApiManagerListRepresentable = APIManager()) {
        self.apiManager = apimanager
        loadMoreLaunches()
    }

}

extension MainListViewModel: MainListViewModelRepresentable {
    func loadMoreLaunches() {
        guard let lastConnection = lastConnection else {
            loadData(from: nil)
            return
        }

        guard lastConnection.hasMore else { return }
        loadData(from: .some(lastConnection.cursor))
    }

    func loadData(from cursor: GraphQLNullable<String>) {
        apiManager.loadData(cursor: cursor).sink { [weak self] completion in
            switch completion {
            case .failure(let error):
                self?.launchesListSubject.send(completion: .failure(error))
            case .finished:
                self?.launchesListSubject.send(completion: .finished)
            }
        } receiveValue: { [weak self] lastConnection in
            let launches = lastConnection.launches.compactMap({ $0?.fragments.launchDetails })
            self?.launches.append(contentsOf: launches)
            self?.lastConnection = lastConnection
        }.store(in: &subscriptions)

    }

    func search(text: String?) {
        guard let text = text,
        !text.isEmpty else {
            launchesListSubject.send(launches)
            return
        }

        let launches = launches.filter { launch in
            launch.site?.localizedCaseInsensitiveContains(text) ?? false
        }

        launchesListSubject.send(launches)
    }
    
    func presentDetailView(index: Int) {
        let id = launches[index].id
        router?.present(route: .detail(launchID: id))
    }
}
