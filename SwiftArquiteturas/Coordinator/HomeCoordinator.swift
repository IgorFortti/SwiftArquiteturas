//
//  HomeCoordinator.swift
//  SwiftArquiteturas
//
//  Created by Igor Fortti on 24/02/23.
//

import Foundation

import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    func start() {
        let viewController = HomeViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
}
