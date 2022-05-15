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
}

public class AppViewModel: AppViewModelType {
    
    var userEmail = BehaviorRelay<String>(value: "")
    var userPassword = BehaviorRelay<String>(value: "")
    var userConfirmPassword = BehaviorRelay<String>(value: "")
}
