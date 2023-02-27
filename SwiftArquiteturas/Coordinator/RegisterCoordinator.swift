//
//  RegisterCoordinator.swift
//  SwiftArquiteturas
//
//  Created by Igor Fortti on 24/02/23.
//

import Foundation

import UIKit

class RegisterCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    func start() {
        let viewController = RegisterViewController()
        viewController.onRegisterSuccess = {
            let coodinator = HomeCoordinator(navigationController: self.navigationController)
            coodinator.start()
        }
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
}

