//
//  RegisterViewController.swift
//  SwiftArquiteturas
//
//  Created by Igor Fortti on 24/02/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    lazy var registerView: RegisterView = {
        let view = RegisterView(frame: .zero)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = registerView
        title = "Registro"
    }
    

}
