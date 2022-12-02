//
//  ApiManagerListMock.swift
//  FruitsGraphQLTests
//
//  Created by Robert on 11/30/22.
//

import Foundation
import Combine

@testable import FruitsGraphQL

final class ListApiManagerMock: ApiManagerListRepresentable {
    func loadData(cursor: ApolloAPI.GraphQLNullable<String>) -> Future<FruitsGraphQL.LaunchListQuery.Data.Launches, Error> {
        return Future { promise in
            
        }
    }
}
