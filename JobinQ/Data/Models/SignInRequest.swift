//
//  SignInRequest.swift
//  JobinQ
//
//  Created by Ton Silva on 15/5/22.
//

struct SignInRequest: Codable {
    
    //MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case userEmail = "user_email"
        case userPassword = "user_password"
    }
    
    //MARK: - Variables
    var userEmail: String?
    var userPassword: String?
}
