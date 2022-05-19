//
//  LoginView.swift
//  JobinQ
//
//  Created by Ton Silva on 6/5/22.
//

import SnapKit
import UIKit

public class LoginView: UIView {
    
    //MARK: - Init
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
    private lazy var appTitle = makeLabel(
        font: DSSettings.Font.appTitle,
        text: "login_app_title".localized,
        color: AppColors.primaryColor)
    private lazy var welcomeLabel = makeLabel(
        font: DSSettings.Font.bigFontRegular,
        text: "login_welcome_label".localized)
    private lazy var orLabel = makeLabel(
        font:DSSettings.Font.mediumFontRegular,
        text: "login_or_label".localized)
     lazy var loginButton = makeButton(
        title: "login_button_title".localized,
        titleColor: AppColors.secondaryColor,
        backgroundColor: AppColors.loginButtonColor)
     lazy var signupButton = makeButton(
        title: "login_signup_button_title".localized,
        titleColor: AppColors.secondaryColor,
        backgroundColor: AppColors.signupButtonColor)
    
    lazy var loginEmailTextField = makeBasicTextField(
        placeholder: "login_email_button_placeholder".localized,
        keyboardType: .emailAddress)
    lazy var loginPasswordTextField = makeBasicTextField(
        placeholder: "login_password_button_placeholder".localized)
    
    private lazy var buttonsStackView = makeStackView(spacing: DSSettings.Layout.smallSpacing.rawValue)
    private lazy var textFieldsStackView = makeStackView()
    
    
    //MARK: - Layout Functions
    private func addViews() {
        addSubview(screenStackView)
        
        screenStackView.addSubview(appTitle)
        screenStackView.addSubview(welcomeLabel)
        screenStackView.addSubview(textFieldsStackView)
        screenStackView.addSubview(buttonsStackView)
        
        textFieldsStackView.addArrangedSubview(loginEmailTextField)
        textFieldsStackView.addArrangedSubview(loginPasswordTextField)
        
        buttonsStackView.addArrangedSubview(loginButton)
        buttonsStackView.addArrangedSubview(orLabel)
        buttonsStackView.addArrangedSubview(signupButton)
    }
    
    private func addConstraints() {
        screenStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        appTitle.snp.makeConstraints { make in
            make.centerX.equalTo(screenStackView)
            make.bottom.equalTo(welcomeLabel.snp.top).inset(-DSSettings.Margin.xlarge.rawValue)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.leading.equalTo(screenStackView).offset(DSSettings.Margin.medium.rawValue)
            make.trailing.equalTo(screenStackView).offset(-DSSettings.Margin.medium.rawValue)
            make.bottom.equalTo(textFieldsStackView.snp.top).inset(-DSSettings.Margin.large.rawValue)
        }
        
        textFieldsStackView.snp.makeConstraints { make in
            make.centerY.equalTo(screenStackView)
            make.leading.equalTo(screenStackView).offset(DSSettings.Margin.extralarge.rawValue)
            make.trailing.equalTo(screenStackView).offset(-DSSettings.Margin.extralarge.rawValue)
        }
        
        buttonsStackView.snp.makeConstraints { make in
            make.centerX.equalTo(screenStackView)
            make.top.equalTo(textFieldsStackView.snp.bottom).inset(-DSSettings.Margin.large.rawValue)
        }
        loginButton.snp.makeConstraints { make in
            make.width.equalTo(DSSettings.ButtonSize.xxlarge.rawValue)
        }
        
        signupButton.snp.makeConstraints { make in
            make.width.equalTo(DSSettings.ButtonSize.xxlarge.rawValue)
        }
        
    }
    
    //MARK: - Makers
    private func makeStackView(
        spacing: CGFloat = DSSettings.Layout.mediumSpacing.rawValue
    ) -> UIStackView {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = spacing
        return stackView
    }
    
    private func makeLabel(
        font: UIFont = DSSettings.Font.mediumFontRegular,
        text: String = "",
        color: UIColor = AppColors.secondaryColor,
        textAlignment: NSTextAlignment = .center
    ) -> UILabel {
        let label = UILabel ()
        label.textColor = color
        label.font = font
        label.text = text
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = textAlignment
        return label
    }
    
    private func makeImageView(
        imageName:String,
        contentMode: ContentMode = .scaleToFill
    ) -> UIImageView{
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = contentMode
        return imageView
    }
    
    private func makeButton(
        title: String = "",
        titleColor: UIColor = .white,
        backgroundColor: UIColor = AppColors.primaryColor
    ) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.font = DSSettings.Font.bigFontRegular
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = DSSettings.RoundedCorner.medium.rawValue
        button.isUserInteractionEnabled = true
        return button
    }
    
    private func makeBasicTextField (
        placeholder:String = "",
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
        loginPasswordTextField.isSecureTextEntry = true
    }
}


