//
//  ViewController.swift
//  Bankey
//
//  Created by Gabriela Souza Batista on 24/08/22.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView()
    let singInButton = UIButton(type: .system)
    // error message if the user dont put any text at the textfield
    let errorMessageLabel = UILabel()
    
    //computede properties to login and password
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
extension LoginViewController {
    private func style() {
        // translate autoResizingMaskIntConstraints = false: takes any control or element of view in your view controller and makes it ready autolayout
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        //styling the uibutton
        singInButton.translatesAutoresizingMaskIntoConstraints = false
        singInButton.configuration = .filled()
        singInButton.configuration?.imagePadding = 8 // indicator spacing
        singInButton.setTitle("Sign In", for: [])
        singInButton.addTarget(self, action: #selector(singInTapped), for: .primaryActionTriggered)
        
        
        //styling the error message
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(singInButton)
        view.addSubview(errorMessageLabel)
        
        // this sets isActive to true for all constraints contained within
        //LOGINVIEW: laying out the login usernama&password
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        // BUTTON: laying out the sing-in button
        
        NSLayoutConstraint.activate([
            singInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
                                              singInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
                                              singInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
                                             
        ])
        // ERROR MESSAGE: laying out the error message
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: singInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

// MARK: Actions
extension LoginViewController {
    // do the logic of what happens when someone clicks de button
    @objc func singInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    private func login() {
        guard let username = username, let password = password else {
            
            //set a message to myself
            assertionFailure("Username and password should never be nil")
            return
        }
        if username.isEmpty || password.isEmpty  {
            configureView(withMessage: "Username or Password cannot be empty")
        }
    }
    
    //withMessage: is an argument parameter/labels who makes ur code legible
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
