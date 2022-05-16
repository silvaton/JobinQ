//
//  AppViewModel.swift
//  JobinQ
//
//  Created by Ton Silva on 13/5/22.
//

import UIKit
import RxSwift
import RxRelay

protocol AppViewModelType {
    
    var userEmail: BehaviorRelay<String> { get }
    var userPassword: BehaviorRelay<String> { get }
    var userConfirmPassword: BehaviorRelay<String> { get }
    var successOnValidatingUser: PublishSubject<Void> { get }
    var successOnCreatingAccount: PublishSubject<Void> { get }
    var errorOnValidatingUser: PublishSubject<String> { get }
    var errorOnCreatingAccount: PublishSubject<String> { get }
    var isAllFieldsValid: Observable<Bool> { get }
}

public class AppViewModel: AppViewModelType {
    var userEmail = BehaviorRelay<String>(value: "")
    var userPassword = BehaviorRelay<String>(value: "")
    var userConfirmPassword = BehaviorRelay<String>(value: "")
    
    var successOnValidatingUser = PublishSubject<Void>()
    var successOnCreatingAccount = PublishSubject<Void>()
    var errorOnValidatingUser = PublishSubject<String>()
    var errorOnCreatingAccount = PublishSubject<String>()
    
    let repository =  LoginRepository()
    
    //MARK: - Validations
    
    var isAllFieldsValid: Observable<Bool> {
        return Observable.combineLatest(userEmail.asObservable(), userPassword.asObservable(), userConfirmPassword.asObservable()) { email,password,confirmPassword in
            email.isValidEmail() && !password.isEmpty && password == confirmPassword && password.isValidPassword()
        }
    }
    
    //MARK: - Requests
    
    func loginRequest() {
        var request = SignInRequest()
        request.userEmail = userEmail.value
        request.userPassword = userPassword.value
        repository.signin(request: request) { success, errorMessage in
            if success == true {
                self.successOnValidatingUser.onNext(())
            } else {
                self.errorOnValidatingUser.onNext(errorMessage?.localizedDescription ?? "")
                print(errorMessage?.localizedDescription)
            }
        }
    }
    
    func signUpRequest() {
        var request = SignInRequest()
        request.userEmail = userEmail.value
        request.userPassword = userPassword.value
        repository.signup(request: request) { success,error  in
            if success == true {
                self.successOnCreatingAccount.onNext(())
            } else {
                self.errorOnCreatingAccount.onNext(error?.localizedDescription ?? "")
            }
        }
    }
    
    
}
