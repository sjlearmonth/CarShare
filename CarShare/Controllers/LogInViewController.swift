//
//  LogInViewController.swift
//  CarShare
//
//  Created by Stephen Learmonth on 07/09/2020.
//  Copyright © 2020 Stephen Learmonth. All rights reserved.
//

import UIKit

protocol AuthenticationControllerProtocol {
    func checkFormStatus()
}
class LogInViewController: UIViewController {

    // MARK: - Properties
    
    private var viewModel = LogInViewModel()
    
    private let clouds: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Clouds")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let emailTextField = CustomTextField(placeholder: "Email")

    private let passwordTextField: CustomTextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private lazy var emailContainerView = InputContainerView(image:#imageLiteral(resourceName: "Envelope"), textField: emailTextField)

    private lazy var passwordContainerView = InputContainerView(image: #imageLiteral(resourceName: "Lock"), textField: passwordTextField)

    private let forgotPassword: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot Password?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12.0)
        button.backgroundColor = .clear
        button.setTitleColor(.white, for: .normal)
        button.setHeight(height: 20.0)
        button.isEnabled = true
        button.addTarget(self, action: #selector(handleForgotPassword), for: .touchUpInside)
        return button
    }()
    
    private let logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 5.0
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .systemGray
        button.setTitleColor(.white, for: .normal)
        button.setHeight(height: 50.0)
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleLogIn), for: .touchUpInside)
        return button
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGradientLayer()
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func handleLogIn() {
        
    }
    
    @objc func handleForgotPassword() {
        
    }
    
    @objc func textDidChange(sender: UITextField) {
        
        if sender == emailTextField {
            viewModel.email = sender.text
        } else {
            viewModel.password = sender.text
        }
        
        checkFormStatus()
    }
    
    // MARK: Helper Functions
    private func configureUI() {
        
        view.addSubview(clouds)
        clouds.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 300)
                
        let stackView = UIStackView(arrangedSubviews: [emailContainerView,
                                                       passwordContainerView])
        stackView.axis = .vertical
        stackView.spacing = 16
        
        view.addSubview(stackView)
        stackView.anchor(top: clouds.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                     paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(forgotPassword)
        forgotPassword.anchor(top: stackView.bottomAnchor, right: view.rightAnchor, paddingTop: 12, paddingRight: 32)
        
        view.addSubview(logInButton)
        logInButton.anchor(top: forgotPassword.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                           paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}

extension LogInViewController: AuthenticationControllerProtocol {
    func checkFormStatus() {
        if viewModel.formIsValid {
            logInButton.isEnabled = true
            logInButton.backgroundColor = .systemBlue
        } else {
            logInButton.isEnabled = false
            logInButton.backgroundColor = .systemGray
        }
    }
}
