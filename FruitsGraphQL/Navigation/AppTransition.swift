//
//  AppTransition.swift
//  FruitsGraphQL
//
//  Created by Robert on 11/23/22.
//

import Foundation
import Apollo

enum AppTransition {
    case mainList
    case detail(launchID: GraphQLID)

    func coordinaorFor<R: AppRouter>(appRouter: R) -> Coordinator {
        switch self {
        case .mainList:
            return MainListCoordinator(router: appRouter)
        case .detail(let id):
            return DetailViewCoordinator(router: appRouter, launchID: id)
        }
    }

    var transitionName: String {
        switch self {
        case .mainList:
            return "Main list"
        case .detail:
            return "Detail view"
        }
    }
}
