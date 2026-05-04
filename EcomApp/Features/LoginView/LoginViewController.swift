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
        text.font = UIFont.systemFont(ofSize: 22, weight: .medium)
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
        attributeContainer.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        let labeledText = AttributedString("Forgot password", attributes: attributeContainer)
        config.attributedTitle = labeledText
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func setupAttributes() {
        view.backgroundColor = .systemBackground
    }

    func setUpAppBar() {
        let leftBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem

    }

    func setUpActions() {
        backButton.rx.tap.subscribe(onNext: {
            [weak self] in
            self?.viewModel.onBack()
        }).disposed(by: disposeBag)
    }

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
    }

    /// Bind ViewModel inputs and outputs using RxSwift
    override func bindViewModel() {
        // Implementation in subclasses
    }
}

#Preview {
    LoginViewController(viewModel: LoginViewModel())
}
