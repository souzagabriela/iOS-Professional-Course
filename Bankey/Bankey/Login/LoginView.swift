//
//  LoginView.swift
//  Bankey
//
//  Created by Gabriela Souza Batista on 24/08/22.
//

import Foundation
import UIKit

// creating new views
class LoginView: UIView {
    
    let stackView = UIStackView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // separeted methods
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    }
    
    // default size: the default size a controls wants to be
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: 375, height: 50)
//    }
}

// using extensions to pull out chunks of functionality and grouped them
extension LoginView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Username"
        
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
        
        layer.cornerRadius = 5
        clipsToBounds = true
        
    // protocol-delegate: textfield is going to send us messages throught its protocols
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // adding constraints
    func layout() {
        // adding the texfield to the stack view (vertical mode)
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)
        
        addSubview(stackView)
//        addSubview(usernameTextField) -> because we're adding above we dont need to call addsubview username etc
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        dividerView.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
}

// MARK: - UITextFieldDelegate

extension LoginView: UITextFieldDelegate {
    
    // basically your saying: your textfield should return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        
        return true
    }
    
    // basically your saying: your textfield should editing
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        // if not empty it can return if not it cannot return
        if textField.text != "" {
            return true
        } else {
            return false
        }
    }
    
    // basically your saying: your textfield did editing
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
    }
    
}
