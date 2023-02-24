//
//  RegisterViewController.swift
//  SwiftArquiteturas
//
//  Created by Igor Fortti on 24/02/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var presenter: RegisterPresenter = RegisterPresenter()
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
    }
    
    @IBAction func registerButtonTap(_ sender: Any) {
        if let email = emailTextField.text,
           let password = passwordTextField.text,
           let confirmPassword = confirmPasswordTextField.text {
               if password != confirmPassword {
                   showMessage(title: "Erro", message: "Senhas não conferem")
               } else {
                   let userModel = UserModel(email: email, password: password)
                   presenter.register(userModel: userModel)
               }
           }
    }
    
    @IBAction func openButtonTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

extension RegisterViewController: RegisterPresenterDelegate {
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
    
    func goHome() {
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "homeViewController") as? HomeViewController
        homeVC?.modalPresentationStyle = .fullScreen
        self.present(homeVC ?? UIViewController(), animated: true)
    }
    
    
}
