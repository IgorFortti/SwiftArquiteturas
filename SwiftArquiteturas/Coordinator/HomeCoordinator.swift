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
        viewController.modalPresentationStyle = .fullScreen
        self.navigationController.present(viewController, animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
}
