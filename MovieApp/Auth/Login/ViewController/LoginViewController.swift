//
//  LoginViewController.swift
//  MovieApp
//
//  Created by Kenan on 08.01.25.
//

import UIKit

class LoginViewController: BaseViewController {
    private var viewModel: LoginViewModel
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    private lazy var emailField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.layer.shadowColor = UIColor.gray.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowOpacity = 0.2
        textField.layer.shadowRadius = 4
        textField.delegate = self
        textField.anchorSize(.init(width: 0, height: 48))
        return textField
    }()

    private lazy var passwordField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.layer.shadowColor = UIColor.gray.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowOpacity = 0.2
        textField.layer.shadowRadius = 4
        textField.delegate = self
        textField.isSecureTextEntry = true
        textField.anchorSize(.init(width: 0, height: 48))
        return textField
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.addArrangedSubview(emailField)
        stackView.addArrangedSubview(passwordField)
        return stackView
    }()

    private lazy var loginButton: ReasubleButton = {
        ReasubleButton(title: "Login", color: .blue, onAction: { [weak self] in
            self?.loginButtonClicked()
        })
    }()

    private lazy var signUpButton: ReasubleButton = {
        ReasubleButton(title: "Sign Up", color: .clear, onAction: { [weak self] in
            self?.signUpButtonClicked()
        })
    }()



    private lazy var buttonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(signUpButton)
        return stackView
    }()

    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func configureView() {
        super.configureView()
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        view.addSubview(stackView)
        view.addSubview(buttonStack)
    }

    override func configureConstraint() {
        super.configureConstraint()
        
        stackView.centerInSuperview(yConstant: -40)
        stackView.anchor(
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            trailing: view.safeAreaLayoutGuide.trailingAnchor,
            padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        )

        buttonStack.anchor(
            top: stackView.bottomAnchor,
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            trailing: view.safeAreaLayoutGuide.trailingAnchor,
            padding: UIEdgeInsets(top: 32, left: 16, bottom: 0, right: 16)
        )
    }
    override func configureTargets() {
        super.configureTargets()
        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
    }

    @objc
    private func loginButtonClicked() {
        var isError = false

        if let email = emailField.text, email.isEmpty {
            emailField.setErrorBorder()
            isError = true
        } else {
            emailField.clearErrorBorder()
        }

        if let password = passwordField.text, password.isEmpty {
            passwordField.setErrorBorder()
            isError = true
        } else {
            passwordField.clearErrorBorder()
        }

        if let email = emailField.text, !isValidEmail(email) {
            emailField.setErrorBorder()
            showCustomAlert(title: "Error", message: "Please enter a valid email")
            return
        } else {
            emailField.clearErrorBorder()
        }

        if let password = passwordField.text, !isValidPassword(password) {
            passwordField.setErrorBorder()
            showCustomAlert(title: "Error", message: "Password must be at least 8 characters long and include: - Uppercase - Lowercase - Number - Special Character")
            return
        } else {
            passwordField.clearErrorBorder()
        }

        if isError {
            showCustomAlert(title: "Error", message: "Please fix the highlighted fields")
            return
        }

        print("Validation successful!")
    }


    @objc
    private func signUpButtonClicked() {
        viewModel.showRegister()
    }
}
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if textField == emailField {
            if text.isEmpty || !isValidEmail(text) {
                emailField.setErrorBorder()
            } else {
                emailField.clearErrorBorder()
            }
        }
        
        if textField == passwordField {
            if text.isEmpty || !isValidPassword(text) {
                passwordField.setErrorBorder()
            } else {
                passwordField.clearErrorBorder() 
            }
        }
    }
}
