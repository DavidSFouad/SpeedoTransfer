//
//  ProfileCompletionViewController.swift
//  SpeedoTransfer
//
//  Created by David Sameh on 07/09/2024.
//

import Foundation

import UIKit

class ProfileCompletionViewController: UIViewController {
    let countryTextField = CustomTextField(placeholder: "Select your country")
    let dobTextField = CustomTextField(placeholder: "Date of Birth")
    let continueButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addKeyboardObservers()
    }
    
    private func setupViews() {
        view.backgroundColor = .appBackground
        setupButton()
        
        let stackView = UIStackView(arrangedSubviews: [countryTextField, dobTextField, continueButton])
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
     
}
