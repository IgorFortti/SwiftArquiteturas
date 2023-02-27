//
//  HomeViewController.swift
//  SwiftArquiteturas
//
//  Created by Igor Fortti on 24/02/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var homeView: HomeView = {
        let view = HomeView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
    }
}
