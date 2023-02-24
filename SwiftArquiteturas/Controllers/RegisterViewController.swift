//
//  RegisterViewController.swift
//  SwiftArquiteturas
//
//  Created by Igor Fortti on 24/02/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerButtonTap(_ sender: Any) {
        if let email = emailTextField.text,
           let password = passwordTextField.text,
           let confirmPassword = confirmPasswordTextField.text {
            if password != confirmPassword {
                self.showMessage(title: "Erro", message: "Senhas diferentes")
                return
            }
            let manager = UserManager(business: UserBusiness())
            manager.register(email: email, password: password) { userModel in
                self.openHomeView()
            } failureHandler: { error in
                self.showMessage(title: "Erro", message: error?.localizedDescription ?? "")
            }
            
        }
    }
    
    @IBAction func openButtonTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func openHomeView() {
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "homeViewController") as? HomeViewController
        homeVC?.modalPresentationStyle = .fullScreen
        self.present(homeVC ?? UIViewController(), animated: true)
    }
    
    


}
