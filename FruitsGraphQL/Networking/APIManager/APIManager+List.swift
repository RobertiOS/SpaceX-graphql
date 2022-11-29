//
//  APIManager+List.swift
//  FruitsGraphQL
//
//  Created by Robert on 11/29/22.
//

import Foundation
import Combine

protocol ApiManagerListRepresentable: AnyObject {
    func loadData(cursor: String?) -> Future<LaunchListQuery.Data.Launch, Error>
}

extension APIManager: ApiManagerListRepresentable {
    func loadData(cursor: String?) -> Future<LaunchListQuery.Data.Launch, Error> {
        return Future { [weak self] promise in
            self?.activeRequest = self?.apolloClient.fetch(query: LaunchListQuery(after: cursor)) { result in
                self?.activeRequest = nil
                switch result {
                case .success(let data):
                    guard let launches = data.data?.launches else { return }
                    promise(.success(launches))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
    }
}
