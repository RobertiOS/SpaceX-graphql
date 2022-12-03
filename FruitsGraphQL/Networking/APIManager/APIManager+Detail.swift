//
//  APIManager+Detail.swift
//  FruitsGraphQL
//
//  Created by Robert on 11/29/22.
//

import Foundation
import Combine
import Apollo
import SpaceXGQL

protocol ApiManagerDetailRepresentable: AnyObject {
    func loadDetails(launchId: ID) -> Future<LaunchDetails, Error>
}

extension APIManager: ApiManagerDetailRepresentable {
    func loadDetails(launchId: ID) -> Future<LaunchDetails, Error> {
        return Future { [weak self] promise in
            self?.activeRequest = self?.apolloClient.fetch(query: LaunchListQuery(launchId: launchId)) { result in
                self?.activeRequest = nil
                switch result {
                case .success(let graphqlResult):
                    if let launch = graphqlResult.data?.launch?.fragments.launchDetails {
                        promise(.success(launch))
                    }
                    // TODO: process graph ql errors
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
    }
}
