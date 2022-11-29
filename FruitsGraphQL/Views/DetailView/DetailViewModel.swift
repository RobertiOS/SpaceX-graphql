//
//  DetailViewModel.swift
//  FruitsGraphQL
//
//  Created by Robert on 11/28/22.
//

import Foundation
import Apollo
import Combine

protocol DetailViewModelRepresentable: AnyObject {
    var launchSubject: PassthroughSubject<LaunchDetail, Error> { get set}
    func loadDetails()
}

final class DetailViewModel {
    let apolloClient: ApolloClient
    let launchId: GraphQLID
    var launchSubject: PassthroughSubject<LaunchDetail, Error> = .init()

//    init(apolloCLient: ApolloClient = APIManager.shared.apolloClient, launchID: GraphQLID) {
//        self.launchId = launchID
//        self.apolloClient = apolloCLient
//        loadDetails()
//    }
}

extension DetailViewModel: DetailViewModelRepresentable {
    func loadDetails() {
        apolloClient.fetch(query: LaunchQuery(launchId: launchId)) { [unowned self]result in
            switch result {
            case .success(let graphqlResult):
                if let launch = graphqlResult.data?.launch {
                    launchSubject.send(launch)
                }
                //TODO: process graph ql errors
            case .failure(let error):
                launchSubject.send(completion: .failure(error))
            }
        }
    }
}
