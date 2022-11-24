//
//  AppTransition.swift
//  FruitsGraphQL
//
//  Created by Robert on 11/23/22.
//

import Foundation

enum AppTransition {
    case mainList

    func coordinaorFor<R: AppRouter>(appRouter: R) -> Coordinator {
        switch self {
        case .mainList:
            return MainListCoordinator(router: appRouter)
        }
    }

    var transitionName: String {
        switch self {
        case .mainList:
            return "Main list"
        }
    }
}
