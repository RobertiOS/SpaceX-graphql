//
//  APIManager.swift
//  FruitsGraphQL
//
//  Created by Robert on 11/23/22.
//

import Foundation
import Apollo

final class APIManager {
    // swiftlint:disable:next force_unwrapping
    let apolloClient = ApolloClient(url: URL(string: "https://apollo-fullstack-tutorial.herokuapp.com/graphql/graphql")!)
    var activeRequest: Apollo.Cancellable?
}
