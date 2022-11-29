//
//  AppTransition.swift
//  FruitsGraphQL
//
//  Created by Robert on 11/23/22.
//

import Foundation

enum AppTransition {
    case mainList
    case detail

    func coordinaorFor<R: AppRouter>(appRouter: R) -> Coordinator {
        switch self {
        case .mainList:
            return MainListCoordinator(router: appRouter)
        case .detail:
            return DetailViewCoordinator(router: appRouter)
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
