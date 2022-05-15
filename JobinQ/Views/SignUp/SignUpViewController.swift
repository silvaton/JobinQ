//
//  SignUpViewController.swift
//  JobinQ
//
//  Created by Ton Silva on 13/5/22.
//

import UIKit
import RxSwift
import RxBiBinding

class SignUpViewController: UIViewController {
    
    //MARK: - Variable and Constants
    var contentView = SignUpView()
    var disposeBag = DisposeBag()
    var viewModel = AppViewModel()
    
    override func loadView() {
        self.view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.barTintColor = AppColors.backgroundColor
        setupObservables()
        setupTaps()
    }
    
    private func setupTaps() {
        self.hideKeyboardWhenTappedAround()
        self.contentView.signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
    }
    private func setupObservables() {
        (contentView.signUpEmailTextField.rx.text.orEmpty <-> self.viewModel.userEmail).disposed(by: disposeBag)
        (contentView.signUpPasswordTextField.rx.text.orEmpty <-> self.viewModel.userPassword).disposed(by: disposeBag)
        (contentView.signUpConfirmPasswordTextField.rx.text.orEmpty <-> self.viewModel.userConfirmPassword).disposed(by: disposeBag)
    }
    
    @objc func didTapSignUpButton() {
        print(self.viewModel.userEmail.value)
        print(self.viewModel.userPassword.value)
        print(self.viewModel.userConfirmPassword.value)
    }
}
