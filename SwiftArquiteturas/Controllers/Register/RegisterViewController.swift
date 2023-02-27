//
//  RegisterViewController.swift
//  SwiftArquiteturas
//
//  Created by Igor Fortti on 24/02/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //MARK: - Closures
    var onRegisterSuccess: (() -> Void)?
    
    //MARK: - Properts
    lazy var registerView: RegisterView = {
        let view = RegisterView(frame: .zero)
        view.onRegisterTap = {[weak self] email, password in
            self?.registerTap(email, password)
        }
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = registerView
        title = "Registro"
    }
    
    //MARK: - Actions
    private func registerTap(_ email: String, _ password: String) {
        let userViewModel = UserViewModel()
        userViewModel.setUserFromApi(email, password) {[weak self] result in
            switch result {
                
            case .success(_):
                self?.onRegisterSuccess?()
            case .failure(let error):
                self?.showMessage("Erro", error.localizedDescription)
            }
        }
    }
    
    func showMessage(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
        
    }
}
