//
//  Router.swift
//  FruitsGraphQL
//
//  Created by Robert on 11/22/22.
//

import UIKit

protocol Router: AnyObject {
    associatedtype Route
    var navigationController: UINavigationController { get set }
    func exit()
    func present(route: Route)
}

protocol AppRouter: Router where Route == AppTransition {
}


