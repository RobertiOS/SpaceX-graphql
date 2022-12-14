//
//  MainListCoordinator.swift
//  FruitsGraphQL
//
//  Created by Robert on 11/22/22.
//

import UIKit

final class MainListCoordinator<R: AppRouter> {
    let router: R
    private var primaryViewController: UIViewController {
        let viewModel = MainListViewModel<R>()
        viewModel.router = router
        return MainListViewController(viewModel: viewModel)
    }

    init(router: R) {
        self.router = router
    }
}

extension MainListCoordinator: Coordinator {
    func start() {
        router.navigationController.pushViewController(primaryViewController, animated: true)
    }
}
