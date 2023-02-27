//
//  HomeView.swift
//  SwiftArquiteturas
//
//  Created by Igor Fortti on 27/02/23.
//

import UIKit

class HomeView: UIView {
    
    lazy var homeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bem vindo a Home"
        label.font = UIFont.systemFont(ofSize: 20, weight: .black)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray
        addElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addElements() {
        addSubview(homeLabel)
        
        NSLayoutConstraint.activate([
            homeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            homeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
