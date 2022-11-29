//
//  AppCoordinator.swift
//  FruitsGraphQL
//
//  Created by Robert on 11/22/22.
//

import UIKit

final class AppCoordinator {
    var navigationController = UINavigationController()

}

extension AppCoordinator: Coordinator {
    func start() {
        present(route: .mainList)
    }
}

extension AppCoordinator: AppRouter {
    func present(route: AppTransition) {
        debugPrint("Presenting route: \(route.transitionName)")
        let coordinator = route.coordinaorFor(appRouter: self)
        coordinator.start()
    }

    func exit() {
        navigationController.popToRootViewController(animated: true)
        present(route: .mainList)
    }

}
