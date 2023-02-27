//
//  HomeView.swift
//  SwiftArquiteturas
//
//  Created by Igor Fortti on 27/02/23.
//

import UIKit

class HomeView: UIView {
    
    lazy var labelWelcome: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bem vindo ao App login VIP"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemMint
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addElements() {
        addSubview(labelWelcome)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            labelWelcome.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelWelcome.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
