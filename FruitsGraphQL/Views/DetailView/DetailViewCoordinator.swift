//
//  DetailViewModelCoordinator.swift
//  FruitsGraphQL
//
//  Created by Robert on 11/28/22.
//

import UIKit

final class DetailViewCoordinator<R: AppRouter>: Coordinator {
    var viewController: UIViewController {
        return DetailViewController(nibName: "DetailViewController", bundle: nil)
    }
    
    init(router: R) {
        self.router = router
    }
    
    let router: R
    
    func start() {
        router.navigationController.pushViewController(viewController, animated: true)
    }
    
}
