//
//  LoginViewController.swift
//  BankeyApp
//
//  Created by Gabriela Souza Batista on 17/09/22.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView()
    let singInButton = UIButton(type: .system)
    
    // error message if the user dont put any text at the textfield
    let errorMessageLabel = UILabel()
    
    // Adding titles
    let titleAppBankeyLabel = UILabel()
    let subtitleAppBankeyLabel = UILabel()
    
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
        
        
        //styling the TITLE and subtitle
        titleAppBankeyLabel.translatesAutoresizingMaskIntoConstraints = false
        titleAppBankeyLabel.textAlignment = .center
        titleAppBankeyLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleAppBankeyLabel.adjustsFontForContentSizeCategory = true
        titleAppBankeyLabel.text = "Bankey"
        
        subtitleAppBankeyLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleAppBankeyLabel.textAlignment = .center
        subtitleAppBankeyLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        subtitleAppBankeyLabel.adjustsFontForContentSizeCategory = true
        subtitleAppBankeyLabel.numberOfLines = 0
        subtitleAppBankeyLabel.text = "All your need in a Bankey"
    }
    
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(singInButton)
        view.addSubview(errorMessageLabel)
        view.addSubview(titleAppBankeyLabel)
        view.addSubview(subtitleAppBankeyLabel)
        
        // this sets isActive to true for all constraints contained within
        //LOGINVIEW: layout the login usernama&password
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        // BUTTON: layout the sing-in button
        
        NSLayoutConstraint.activate([
            singInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            singInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            singInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            
        ])
        // ERROR MESSAGE: layout the error message
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: singInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // Title: layout the title
        NSLayoutConstraint.activate([
            subtitleAppBankeyLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleAppBankeyLabel.bottomAnchor, multiplier: 3),
            titleAppBankeyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
        // Subtitle: layout the subview
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleAppBankeyLabel.bottomAnchor, multiplier: 3),
            subtitleAppBankeyLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            subtitleAppBankeyLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor)
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
            return
        }
        
        if username == "Kevin" && password == "Welcome"{
            singInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect username or password")
        }
    }
    
    //withMessage: is an argument parameter/labels who makes ur code legible
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
