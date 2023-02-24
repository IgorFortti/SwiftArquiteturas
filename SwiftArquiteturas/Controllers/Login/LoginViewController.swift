//
//  LoginViewController.swift
//  SwiftArquiteturas
//
//  Created by Igor Fortti on 24/02/23.
//

import UIKit

class LoginViewController: UIViewController {
    //MARK: - Clousures
    var onRegisterTap: (() -> Void)?
    var onLoginSuccess: (() -> Void)?
    //MARK: - Properts
    
    lazy var loginView: LoginView = {
        let view = LoginView(frame: .zero)
        view.onRegisterTap = {[weak self] in
            self?.onRegisterTap?()
        }
        view.onOpenTap = {[weak self] email, password in
            
        }
        return view
    }()
    
    //MARK: OVERRIDES
    override func loadView() {
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        
    }
    
    private func openTap(_ email: String, _ password: String) {
        let manager = UserManager(business: UserBusiness())
        manager.login(email: email, password: password) { [weak self] userModel in
            self?.onLoginSuccess?()
        } failureHandler: { error in
            self.showMessage("Erro", error?.localizedDescription ?? "")
        }

    }
    
    func showMessage(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
        
    }

}
