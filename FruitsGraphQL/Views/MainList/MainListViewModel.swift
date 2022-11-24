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
    
    let apolloCLient: ApolloClient
    let foodListSubject = PassthroughSubject<[AllFruitsQuery.Data.Fruit], Error>()
    
    init(apolloCLient: ApolloClient = APIManager.shared.apolloClient) {
        self.apolloCLient = apolloCLient
        loadData()
    }
    
    func loadData() {
        apolloCLient.fetch(query: AllFruitsQuery()) { [weak self] result in
            switch result {
            case .success(let data):
                guard let fruits = data.data?.fruits?.compactMap({ $0 }) else { return }
                self?.foodListSubject.send(fruits)
            case .failure(let error):
                self?.foodListSubject.send(completion: .failure(error))
            }
        }
    }
    
}
