//
//  UserProvider.swift
//  SwiftArquiteturas
//
//  Created by Igor Fortti on 23/02/23.
//
// É através do provider que chamaremos as Api e nos comunicaremos com elas. O provider pode também se comunicar com um banco de dados local, dependo da utilizacao ou não desse banco de dados pela aplicacao.
import Foundation
import FirebaseAuth

protocol UserProviderProtocol {
    func login(parameters: [AnyHashable: Any], completionHandler: @escaping(Result<UserModel, Error>) -> Void)
    func register(parameters: [AnyHashable: Any], completionHandler: @escaping(Result<UserModel, Error>) -> Void)
}


class UserProvider: UserProviderProtocol {
    lazy var auth = Auth.auth()
    
    func login(parameters: [AnyHashable : Any], completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        let body: NSDictionary = parameters[Constants.ParametersKeys.body] as? NSDictionary ?? [:]
        let userModel = body[Constants.ParametersKeys.userModel] as? UserModel
        
        self.auth.signIn(withEmail: userModel?.email ?? "", password: userModel?.password ?? "") { (result, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success(userModel ?? UserModel()))
            }
        }
    }
    
    func register(parameters: [AnyHashable : Any], completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        let body: NSDictionary = parameters[Constants.ParametersKeys.body] as? NSDictionary ?? [:]
        let userModel = body[Constants.ParametersKeys.userModel] as? UserModel
        
        self.auth.createUser(withEmail: userModel?.email ?? "", password: userModel?.password ?? "") { (result, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success(userModel ?? UserModel()))
            }
        }
    }
    

}
