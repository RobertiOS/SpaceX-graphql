//
//  DetailViewModelCoordinator.swift
//  FruitsGraphQL
//
//  Created by Robert on 11/28/22.
//

import UIKit
import Apollo

final class DetailViewCoordinator<R: AppRouter>: Coordinator {
    var viewController: UIViewController {
        let viewModel = DetailViewModel(launchID: launchID)
        return DetailViewController(viewModel: viewModel)
    }
    
    init(router: R, launchID: ID) {
        self.router = router
        self.launchID = launchID
    }
    
    let router: R
    let launchID: ID
    func start() {
        router.navigationController.pushViewController(viewController, animated: true)
    }
    
}
