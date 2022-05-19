//
//  LoginRepository.swift
//  JobinQ
//
//  Created by Ton Silva on 15/5/22.
//

import FirebaseAuth

final class LoginRepository {
    
    // user login"
    static func signin(request: SignInRequest, completion: @escaping (_ success: Bool, _ errorMessage:Error?) ->Void) {
        FirebaseAuth.Auth.auth().signIn(withEmail: request.userEmail!, password: request.userPassword!) { authResult, error in
            guard self != nil else { return }
            
            guard error == nil else {
                completion(false,error)
                debugPrint(error)
                return
            }
            completion(true,nil)
            return
        }
    }
    
    // create a new account:
    static func signup(request: SignInRequest, completion: @escaping (_ success: Bool, _ errorMessage: Error?)-> Void) {
        FirebaseAuth.Auth.auth().createUser(withEmail: request.userEmail!, password: request.userPassword!) { authResult, error in
            
            guard self != nil else { return }
            
            guard error == nil else {
                completion(false, error)
                debugPrint(error)
                return
            }
            completion(true, nil)
            return
        }
    }
}
