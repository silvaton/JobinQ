//
//  LoginViewController.swift
//  JobinQ
//
//  Created by Ton Silva on 4/5/22.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa
import RxBiBinding


class LoginViewController: UIViewController {

    //MARK: - Variables and Constants
    var contentView = LoginView()
    var viewModel = AppViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: - LifeCyle
    public override func loadView() {
        self.view = contentView
    }
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setupTaps()
        setupObservables()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupObservables() {
        (contentView.loginEmailTextField.rx.text.orEmpty <-> self.viewModel.userEmail).disposed(by: disposeBag)
        (contentView.loginPasswordTextField.rx.text.orEmpty <-> self.viewModel.userPassword).disposed(by: disposeBag)
    }
    
    private func setupTaps() {
        self.hideKeyboardWhenTappedAround()
        
        self.contentView.loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        self.contentView.signupButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
    }
    
    @objc func didTapSignUpButton() {
        let signUpViewController = SignUpViewController()
        navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    @objc func didTapLoginButton() {
        print(viewModel.userEmail.value)
        print(viewModel.userPassword.value)
    }
}
