//
//  LoginViewController.swift
//  SwiftArquiteturas
//
//  Created by Igor Fortti on 24/02/23.
//

import UIKit

class LoginViewController: UIViewController {
    let presenter: LoginPresenter = LoginPresenter()
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
    }
    
    @IBAction func openButtonTap(_ sender: Any) {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            let userModel = UserModel(email: email, password: password)
            presenter.login(userModel: userModel)
        }
    }
    
    @IBAction func registerButtonTap(_ sender: Any) {
    }
}

extension LoginViewController: LoginPresenterDelegate {
    func goHome() {
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "homeViewController") as? HomeViewController
        homeVC?.modalPresentationStyle = .fullScreen
        self.present(homeVC ?? UIViewController(), animated: true)
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
    
    
}
