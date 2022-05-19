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
    var viewModel = LoginSignUpViewModel()
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
        setupTextFields()
        setupObservables()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupTextFields() {
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
        self.viewModel.loginRequest()
    }
    
    private func setupObservables() {
        
        //Login error
        viewModel.errorOnValidatingUser
            .asDriver(onErrorJustReturn: "unknow_error".localized)
            .drive(onNext: {[weak self] err in
                guard let self = self else { return }
                self.showAlert(title: "error_on_login".localized, message: err)
            }).disposed(by: disposeBag)
        
        //Success on Login
        viewModel.successOnValidatingUser
            .asObserver()
            .subscribe(onNext: {
                self.showAlert(
                    title: "login_success_alert_title".localized,
                    message: "login_success_alert_message".localized)
            }).disposed(by: disposeBag)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _  in
            self.dismiss(animated: true)
        }))
        present(alert, animated: true)
    }
}
