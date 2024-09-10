//
//  SignInViewController.swift
//  SpeedoTransfer
//
//  Created by David Sameh on 07/09/2024.
//

import Foundation

import UIKit

class SignInViewController: UIViewController {
    let emailTextField = CustomTextField(placeholder: "Email")
    let passwordTextField = CustomTextField(placeholder: "Password")
    let signInButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addKeyboardObservers()
    }

    private func setupViews() {
        view.backgroundColor = .appBackground
        setupTextFieldListeners()
        setupButton()
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, signInButton])
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func setupTextFieldListeners() {
        [emailTextField, passwordTextField].forEach {
            $0.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        }
    }

    private func setupButton() {
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.backgroundColor = .appRed
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.layer.cornerRadius = 8
        signInButton.isEnabled = false
        signInButton.alpha = 0.5
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
    }

    @objc func signInTapped() {
        // Implement sign-in logic or navigate to the main part of your app
    }

    @objc func editingChanged(_ textField: UITextField) {
        let isFormValid = emailTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false
        signInButton.isEnabled = isFormValid
        signInButton.alpha = isFormValid ? 1.0 : 0.5
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
