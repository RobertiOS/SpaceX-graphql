//
//  MainListViewModel.swift
//  FruitsGraphQL
//
//  Created by Robert on 11/22/22.
//

import Foundation
import Apollo
import Combine

final class MainListViewModel {
    typealias Launch = LaunchListQuery.Data.Launch.Launch
    let apolloCLient: ApolloClient
    let foodListSubject = PassthroughSubject<[Launch], Error>()
    
    init(apolloCLient: ApolloClient = APIManager.shared.apolloClient) {
        self.apolloCLient = apolloCLient
        loadData()
    }
    
    func loadData() {
        apolloCLient.fetch(query: LaunchListQuery()) { [weak self] result in
            switch result {
            case .success(let data):
                guard let launches = data.data?.launches.launches.compactMap({ $0 }) else { return }
                self?.foodListSubject.send(launches)
            case .failure(let error):
                self?.foodListSubject.send(completion: .failure(error))
            }
        }
    }
    
}
