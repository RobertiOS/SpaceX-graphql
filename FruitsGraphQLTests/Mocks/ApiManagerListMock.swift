//
//  ApiManagerListMock.swift
//  FruitsGraphQLTests
//
//  Created by Robert on 11/30/22.
//

import Foundation
import Combine
import Apollo

@testable import FruitsGraphQL

final class ListApiManagerMock: ApiManagerListRepresentable {
    func loadData(cursor: ApolloAPI.GraphQLNullable<String>) -> Future<FruitsGraphQL.LaunchListQuery.Data.Launches, Error> {
        let response = MockGraphQLQuery.launches.responseObject!
        let store = ApolloStore(cache: InMemoryNormalizedCache())
        return Future { promise in
            let client = ApolloClient(networkTransport: MockNetworkTransport(body: response), store: store)
            client.fetch(query: LaunchListQuery()) { result in
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
