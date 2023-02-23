//
//  UserModel.swift
//  SwiftArquiteturas
//
//  Created by Igor Fortti on 23/02/23.
//

import Foundation

struct UserModel: Codable {
//    Com as propriedades sendo constantes, será necessário o uso do init para inicializar a classe atribuindo valor para as propriedades abaixo.
    let email: String
    let password: String
    
//    Inicializador para utilizar os valores vazios, sem precisar utilizar optional.
    init() {
        self.email = String()
        self.password = String()
    }
    
//    Inicializador para atribuir valores para as propriedades da classe.
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
