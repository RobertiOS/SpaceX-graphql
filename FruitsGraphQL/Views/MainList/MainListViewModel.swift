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

protocol MainListViewModelRepresentable: AnyObject {
    var launchesListSubject: PassthroughSubject<[Launch], Error> { get set }
    func loadMoreLaunches()
    func search(text: String?)
}

final class MainListViewModel: MainListViewModelRepresentable {
   
    private let apolloCLient: ApolloClient
    var launchesListSubject = PassthroughSubject<[Launch], Error>()
    private var lastConnection: LaunchListQuery.Data.Launch?
    private var activeRequest: Apollo.Cancellable?
    private var launches = [Launch]() {
        didSet {
            var set = OrderedSet<Launch>()
            set.append(contentsOf: launches)
            launchesListSubject.send(Array(set))
        }
    }
    
    init(apolloCLient: ApolloClient = APIManager.shared.apolloClient) {
        self.apolloCLient = apolloCLient
        loadMoreLaunches()
    }
    
    func loadMoreLaunches() {
        guard let lastConnection = lastConnection else {
            loadData(from: nil)
            return
        }
        
        guard lastConnection.hasMore else { return }
        loadData(from: lastConnection.cursor)
    }
    
    func loadData(from cursor: String?) {
        apolloCLient.fetch(query: LaunchListQuery(after: cursor)) { [weak self] result in
            self?.activeRequest = nil
            switch result {
            case .success(let data):
                guard let launches = data.data?.launches.launches.compactMap({ $0 }) else { return }
                self?.launches.append(contentsOf: launches)
                self?.lastConnection = data.data?.launches
            case .failure(let error):
                self?.launchesListSubject.send(completion: .failure(error))
            }
        }
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
    
}
