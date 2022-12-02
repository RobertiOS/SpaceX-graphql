//
//  MockNetworkTransport.swift
//  FruitsGraphQLTests
//
//  Created by Robert on 11/30/22.
//

import Foundation
import Apollo

final class MockNetworkTransport: NetworkTransport {

    enum NetworkError: Error {
        case networkFailure
    }

    private final class MockTask: Cancellable {
        func cancel() { }
    }

    let simulateNetworkFailure: Bool
    let body: JSONObject

    init(body: JSONObject, simulateNetworkFailure: Bool = false) {
        self.body = body
        self.simulateNetworkFailure = simulateNetworkFailure
    }

    func send(operation: Operation,
                         completionHandler: @escaping (_ response: GraphQLResponse?, _ error: Error?) -> Void) -> Cancellable {

        DispatchQueue.global(qos: .default).async {

            if self.simulateNetworkFailure {
                completionHandler(nil, NetworkError.networkFailure)
                return
            }

            completionHandler(GraphQLResponse(operation: operation,
                                              body: self.body), nil)
        }

        return MockTask()
    }
}
