//
//  SignUpViewController.swift
//  SpeedoTransfer
//
//  Created by David Sameh on 07/09/2024.
//

import Foundation

import UIKit

class SignUpViewController: UIViewController {
    let nameTextField = CustomTextField(placeholder: "Full Name")
    let emailTextField = CustomTextField(placeholder: "Email")
    let passwordTextField = CustomTextField(placeholder: "Password")
    let confirmPasswordTextField = CustomTextField(placeholder: "Confirm Password")
    let signUpButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addKeyboardObservers()
    }

    private func setupViews() {
        view.backgroundColor = .appBackground
        setupTextFieldListeners()
        setupButton()
        
        let stackView = UIStackView(arrangedSubviews: [nameTextField, emailTextField, passwordTextField, confirmPasswordTextField, signUpButton])
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func setupTextFieldListeners() {
        [emailTextField, passwordTextField, confirmPasswordTextField].forEach {
            $0.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        }
    }

    private func setupButton() {
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.backgroundColor = .appRed
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.layer.cornerRadius = 8
        signUpButton.isEnabled = false
        signUpButton.alpha = 0.5
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
    }

    @objc func signUpTapped() {
        let profileVC = ProfileCompletionViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }

    @objc func editingChanged(_ textField: UITextField) {
        let isFormValid = emailTextField.text?.isEmpty == false &&
                          passwordTextField.text?.isEmpty == false &&
                          confirmPasswordTextField.text == passwordTextField.text &&
                          passwordTextField.text?.isValidPassword() == true
        
        signUpButton.isEnabled = isFormValid
        signUpButton.alpha = isFormValid ? 1.0 : 0.5
    }

    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        if view.frame.origin.y == 0 {
            view.frame.origin.y -= keyboardSize.height / 3
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }
}

