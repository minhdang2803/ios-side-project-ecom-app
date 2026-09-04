//
//  LoginViewController.swift
//  EcomApp
//
//  Created by Le Minh Dang on 22/4/26.
//

import UIKit

class LoginViewController: BaseViewController<LoginViewModel> {

    private lazy var backButton: UIButton = {
        var buttonConfig = UIButton.Configuration.plain()
        let attributedString = AttributedString("Back")
        buttonConfig.attributedTitle = attributedString
        let backButton = UIButton(configuration: buttonConfig, primaryAction: .none)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        return backButton
    }()

    private lazy var headerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_logo")
        imageView.frame = CGRect(x: 0, y: 0, width: 44, height: 52)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var titleText: UILabel = {
        let text = UILabel()
        text.text = "Log in"
        text.textColor = .black
        text.font = UIFont.roboto(size: 22, weight: .medium)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text

    }()

    private lazy var emailTextField: CustomTextField = {
        let tf = CustomTextField(placeHolder: "email", leadingIcon: UIImage.message)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()


    private lazy var passwordTextField: CustomTextField = {
        let tf = CustomTextField(placeHolder: "Password", leadingIcon: UIImage.icLock)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private lazy var forgotPasswordTextButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.baseForegroundColor = .black
        var attributeContainer = AttributeContainer()
        attributeContainer.font = UIFont.roboto(size: 14, weight: .regular)
        let labeledText = AttributedString("Forgot password", attributes: attributeContainer)
        config.attributedTitle = labeledText
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var loginWithFacebook = {
        let button = UIButton()
        button.setImage(UIImage(named: "fb"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var loginWithGoogle = {
        let button = UIButton()
        button.setImage(UIImage(named: "google"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var providers = {
        let row = UIStackView(arrangedSubviews: [loginWithFacebook, loginWithGoogle])
        row.translatesAutoresizingMaskIntoConstraints = false
        row.spacing = 0
        row.distribution = .equalSpacing
        row.axis = .horizontal
        return row
    }()

    override func setupAttributes() {
        view.backgroundColor = .systemBackground
    }

    func setUpAppBar() {
        let leftBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }

    private lazy var loginButton: some UIView = {
        let button = CustomButtonUIView(text: "Log in", trailingIcon: nil, backgroundColor: .systemOrange, textColor: .white)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var orDivider: some UIView = {
        // Divider
        let leftDivider = UIView()
        leftDivider.backgroundColor = .black
        let rightDivider = UIView()
        rightDivider.backgroundColor = .black
        // Text Label
        let orText = UILabel()
        orText.text = "Or"
        orText.font = UIFont.roboto(size: 12, weight: .medium)
        orText.textColor = .black
        // Row
        let orDivider = UIStackView(arrangedSubviews: [leftDivider, orText, rightDivider])
        orDivider.spacing = CGFloat(18.8)
        orDivider.axis = .horizontal
        orDivider.alignment = .center
        orDivider.distribution = .fill
        leftDivider.snp.makeConstraints {
            make in
            make.height.equalTo(1)
        }
        rightDivider.snp.makeConstraints {
            make in
            make.height.equalTo(1)
            make.width.equalTo(leftDivider.snp.width)
        }
        // Set priority
        orText.setContentHuggingPriority(.required, for: .horizontal)
        leftDivider.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
        rightDivider.setContentHuggingPriority(.defaultLow, for: .horizontal)
        orDivider.translatesAutoresizingMaskIntoConstraints = false
        return orDivider
    }()

    /// Add subviews and setup AutoLayout constraints
    override func setupLayout() {
        // Set up background color
        self.view.backgroundColor = UIColor(hex: "#FBFBFD")
        // Set up App Bar action
        self.setUpAppBar()
        // Setup actions
        self.setUpActions()
        // Set up layouts
        self.view.addSubview(headerImage)
        headerImage.snp.makeConstraints {
            make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(55)
            make.centerX.equalToSuperview()
        }

        self.view.addSubview(titleText)
        titleText.snp.makeConstraints {
            make in
            make.top.equalTo(headerImage.snp.bottom).offset(38)
            make.centerX.equalToSuperview()
        }
        self.view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints {
            make in
            make.top.equalTo(titleText.snp.bottom).offset(33)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        self.view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints {
            make in
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        self.view.addSubview(forgotPasswordTextButton)
        forgotPasswordTextButton.snp.makeConstraints {
            make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(18)
            make.trailing.equalToSuperview().inset(20)
        }
        self.view.addSubview(loginButton)
        loginButton.snp.makeConstraints {
            make in
            make.top.equalTo(forgotPasswordTextButton.snp.bottom).offset(17)
            make.trailing.leading.equalToSuperview().inset(85)
        }
        self.view.addSubview(orDivider)
        orDivider.snp.makeConstraints {
            make in
            make.top.equalTo(loginButton.snp.bottom).offset(43)
            make.trailing.leading.equalToSuperview().inset(70.5)
        }
        self.view.addSubview(providers)
        providers.snp.makeConstraints{
            make in
            make.leading.trailing.equalToSuperview().inset(110)
            make.top.equalTo(orDivider.snp.bottom).offset(20)
        }
    }


    /// Bind ViewModel inputs and outputs using RxSwift
    override func bindViewModel() {
        // Implementation in subclasses
    }
}

extension LoginViewController {
    func setUpActions() {
        backButton.rx.tap.subscribe(onNext: {
            [weak self] in
            self?.viewModel.onBack()
        }).disposed(by: disposeBag)
        loginWithGoogle.rx.tap.subscribe(onNext: {
            [weak self] in
            self?.viewModel.onLoginWithGoogle()
        }).disposed(by: disposeBag)
        loginWithFacebook.rx.tap.subscribe(onNext: {
            [weak self] in
            self?.viewModel.onLoginWithFacebook()
        }).disposed(by: disposeBag)
    }
}
#Preview {
    LoginViewController(viewModel: LoginViewModel())
}
