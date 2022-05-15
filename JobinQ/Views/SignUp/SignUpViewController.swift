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
        setupTextFields()
        setupTaps()
        setupObservables()
    }
    
    private func setupTaps() {
        self.hideKeyboardWhenTappedAround()
        self.contentView.signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
    }
    private func setupTextFields() {
        (contentView.signUpEmailTextField.rx.text.orEmpty <-> self.viewModel.userEmail).disposed(by: disposeBag)
        (contentView.signUpPasswordTextField.rx.text.orEmpty <-> self.viewModel.userPassword).disposed(by: disposeBag)
        (contentView.signUpConfirmPasswordTextField.rx.text.orEmpty <-> self.viewModel.userConfirmPassword).disposed(by: disposeBag)
    }
    
    @objc func didTapSignUpButton() {
        self.viewModel.signUpRequest()
    }
    
    private func setupObservables() {
        
        //Error on Creating Account
        viewModel.errorOnCreatingAccount
            .asDriver(onErrorJustReturn: "Erro Desconhecido")
            .drive(onNext: {[weak self] err in
                guard let self = self else { return }
                self.showAlert(title: "Error on Creating Account", message: err)
            }).disposed(by: disposeBag)
        
        
        //Success on Creating Account
        viewModel.successOnCreatingAccount
            .asObserver()
            .subscribe(onNext: {
                self.showAlert(title: "Congratulations", message: "Success on Creating Account")
            }).disposed(by: disposeBag)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.dismiss(animated: true)
        }))
        present(alert, animated: true)
    }
}
