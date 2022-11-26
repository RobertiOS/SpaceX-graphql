//
//  MainListViewModel.swift
//  FruitsGraphQL
//
//  Created by Robert on 11/22/22.
//

import Foundation
import Apollo
import Combine

protocol MainListViewModelRepresentable: AnyObject {
    var launchesListSubject: PassthroughSubject<[Launch], Error> { get set }
}

final class MainListViewModel: MainListViewModelRepresentable {
   
    let apolloCLient: ApolloClient
    var launchesListSubject = PassthroughSubject<[Launch], Error>()
    var launches = [Launch]() {
        didSet {
            launchesListSubject.send(launches)
        }
    }
    
    init(apolloCLient: ApolloClient = APIManager.shared.apolloClient) {
        self.apolloCLient = apolloCLient
        loadData()
    }
    
    func loadData() {
        apolloCLient.fetch(query: LaunchListQuery()) { [weak self] result in
            switch result {
            case .success(let data):
                guard let launches = data.data?.launches.launches.compactMap({ $0 }) else { return }
                self?.launches.append(contentsOf: launches)
            case .failure(let error):
                self?.launchesListSubject.send(completion: .failure(error))
            }
        }
    }
    
}
