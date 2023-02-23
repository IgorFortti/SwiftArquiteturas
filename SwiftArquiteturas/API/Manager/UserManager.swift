//
//  UserManager.swift
//  SwiftArquiteturas
//
//  Created by Igor Fortti on 23/02/23.
//
// A classe manager é quem vai fazer a ponte entre a origem da chamada e a classe Business.
// Os métodos register e login estão com o completion diferente para visualizacao das formas que podem ser usadas.
import Foundation

protocol UserManagerProtocol {
    func register(email: String, password: String,
                  successHandler: @escaping(UserModel) -> Void,
                  failureHandler: @escaping(Error?) -> Void)
    
    func login(email: String, password: String,
               successHandler: @escaping(UserModel) -> Void,
               failureHandler: @escaping(Error?) -> Void)
}

class UserManager: UserManagerProtocol {
    let business: UserBusinessProtocol
// Método que inicializará a classe UserManeger quando for instanciada.
    init(business: UserBusinessProtocol) {
        self.business = business
    }
    
    func login(email: String, password: String,
               successHandler: @escaping (UserModel) -> Void,
               failureHandler: @escaping (Error?) -> Void) {
        business.login(email: email, password: password) { result in
            switch result {
            case .success(let userModel):
                successHandler(userModel)
            case .failure(let error):
                failureHandler(error)
            }
        }
    }
    
    func register(email: String, password: String,
                  successHandler: @escaping (UserModel) -> Void,
                  failureHandler: @escaping (Error?) -> Void) {
        business.register(email: email, password: password) { result in
            switch result {
            case .success(let userModel):
                successHandler(userModel)
            case .failure(let error):
                failureHandler(error)
            }
        }
    }
    
}
