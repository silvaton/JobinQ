//
//  SignUpView.swift
//  JobinQ
//
//  Created by Ton Silva on 13/5/22.
//

import UIKit
import SnapKit

class SignUpView: UIView {
    
    // MARK: - Init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = AppColors.backgroundColor
        addViews()
        addConstraints()
        layoutCustomization()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Variables and Constants
    private lazy var screenStackView = makeStackView()
    private lazy var textFieldStackView = makeStackView()
    
    private lazy var appTitleLabel = makeLabel(
        font: DSSettings.Font.appTitle,
        text: "signup_app_title".localized,
        color: AppColors.primaryColor)
    
    private lazy var signUpInstructionsLabel = makeLabel(
        font: DSSettings.Font.bigFontRegular,
        text: "signup_instructions_label".localized)
    
    lazy var signUpButton = makeButton(
        title: "signup_button_title".localized,
        titleColor: AppColors.secondaryColor,
        backgroundColor: AppColors.signupButtonColor)
    
    lazy var signUpEmailTextField = makeBasicTextField(
        placeholder: "signup_email_button_placeholder".localized,
        keyboardType: .emailAddress)
    
    lazy var signUpPasswordTextField = makeBasicTextField(
        placeholder: "signup_password_button_placeholder".localized)
    
    lazy var signUpConfirmPasswordTextField = makeBasicTextField(
        placeholder: "signup_confirm_password_button_placeholder".localized)
    
    
    // MARK: - Layout Functions
    
    private func addViews() {
        addSubview(screenStackView)
        
        screenStackView.addSubview(appTitleLabel)
        screenStackView.addSubview(signUpInstructionsLabel)
        screenStackView.addSubview(textFieldStackView)
        screenStackView.addSubview(signUpButton)
        
        textFieldStackView.addArrangedSubview(signUpEmailTextField)
        textFieldStackView.addArrangedSubview(signUpPasswordTextField)
        textFieldStackView.addArrangedSubview(signUpConfirmPasswordTextField)
    }
    
    private func addConstraints() {
        screenStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        appTitleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(screenStackView)
            make.bottom.equalTo(signUpInstructionsLabel.snp.top).inset(-DSSettings.Margin.large.rawValue)
        }
        
        signUpInstructionsLabel.snp.makeConstraints { make in
            make.bottom.equalTo(textFieldStackView.snp.top).inset(-DSSettings.Margin.large.rawValue)
            make.leading.equalTo(screenStackView).offset(DSSettings.Margin.large.rawValue)
            make.trailing.equalTo(screenStackView).offset(-DSSettings.Margin.large.rawValue)
        }
        
        textFieldStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(screenStackView).offset(DSSettings.Margin.extralarge.rawValue)
            make.trailing.equalTo(screenStackView).offset(-DSSettings.Margin.extralarge.rawValue)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(textFieldStackView.snp.bottom).inset(-DSSettings.Margin.large.rawValue)
            make.width.equalTo(DSSettings.ButtonSize.xxlarge.rawValue)
        }
    }
    
    // MARK: - Makers
    
    private func makeStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = DSSettings.Layout.mediumSpacing.rawValue
        return stackView
    }
    
    private func makeLabel(
        font: UIFont = DSSettings.Font.mediumFontRegular,
        text: String = "",
        color: UIColor = AppColors.secondaryColor,
        textAlignment: NSTextAlignment = .center
    ) -> UILabel{
        let label = UILabel()
        label.font = font
        label.text = text
        label.textColor = color
        label.textAlignment = textAlignment
        label.adjustsFontSizeToFitWidth = true
        return label
    }
    
    private func makeButton(
        title: String = "",
        titleColor: UIColor = .white,
        backgroundColor: UIColor = AppColors.primaryColor
    ) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.titleLabel?.font = DSSettings.Font.bigFontRegular
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.layer.cornerRadius = DSSettings.RoundedCorner.medium.rawValue
        button.isUserInteractionEnabled = true
        return button
    }
    
    private func makeBasicTextField(
        placeholder: String = "",
        keyboardType: UIKeyboardType = .default
    ) -> UITextField {
        let textField = UITextField()
        textField.isUserInteractionEnabled = true
        textField.font = DSSettings.Font.mediumFontBold
        textField.textColor = AppColors.secondaryColor
        textField.autocapitalizationType = .none
        textField.attributedPlaceholder = NSAttributedString(
        string: placeholder,
        attributes: [NSAttributedString.Key.foregroundColor: AppColors.placeholderColor]
        )
        textField.backgroundColor = .white
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.keyboardType = keyboardType
        return textField
    }
    
    private func layoutCustomization() {
        signUpPasswordTextField.isSecureTextEntry = true
        signUpConfirmPasswordTextField.isSecureTextEntry = true
    }
}

