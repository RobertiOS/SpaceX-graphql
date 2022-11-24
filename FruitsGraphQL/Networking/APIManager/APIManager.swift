//
//  APIManager.swift
//  FruitsGraphQL
//
//  Created by Robert on 11/23/22.
//

import Foundation
import Apollo

final class APIManager {
    static let shared = APIManager()
    let apolloClient = ApolloClient(url: URL(string: "https://fruits-api.netlify.app/graphql")!)
}
