//
//  LogInViewController.swift
//  MovieApp
//
//  Created by admin on 01.04.2023..
//

import Foundation
import UIKit
import MovieAppData

class LogInViewController: UIViewController {
    
    private var signInLabel: UILabel!
    private var emailLabel: UILabel!
    private var passwordLabel: UILabel!
    private var emailTextField: UITextField!
    private var passwordTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let backgroundColor = UIColor(red: 0.043, green: 0.145, blue: 0.247, alpha: 1.0)
        let labelColor = UIColor(red: 0.3, green: 0.7, blue: 0.9, alpha: 1.0)
        let labelFont = UIFont(name: "ProximaNova-Semibold", size: 36)
        
        
        view.backgroundColor = backgroundColor
        
        let signInLabel = UILabel()
        signInLabel.text = "Sign in"
        signInLabel.textColor = UIColor.white
        signInLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        signInLabel.textAlignment = .center
        signInLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signInLabel)
        
        
        let emailLabel = UILabel()
        emailLabel.text = "Email address"
        emailLabel.textColor = UIColor.white
        emailLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailLabel)
        
        let passwordLabel = UILabel()
        passwordLabel.text = "Password"
        passwordLabel.textColor = UIColor.white
        passwordLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordLabel)
        
        let emailTextField = UITextField()
        emailTextField.placeholder = "ex. Matt@iosCourse.com"
        emailTextField.text = ""
        emailTextField.backgroundColor = UIColor(red: 0.075, green: 0.224, blue: 0.388, alpha: 1.0)
        emailTextField.textColor = UIColor.white
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor(red: 0.082, green: 0.302, blue: 0.522, alpha: 1.0).cgColor
        emailTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        emailTextField.layer.cornerRadius = 10
        emailTextField.borderStyle = .roundedRect
        emailTextField.frame.size.height = 48
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailTextField)
        
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Enter your password"
        passwordTextField.backgroundColor = UIColor(red: 0.075, green: 0.224, blue: 0.388, alpha: 1.0)
        passwordTextField.textColor = labelColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor(red: 0.082, green: 0.302, blue: 0.522, alpha: 1.0).cgColor
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.frame.size.height = 48
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        let signInButton = UIButton(type: .system)
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.setTitleColor(UIColor.white, for: .normal)
        signInButton.backgroundColor = UIColor(red: 0.3, green: 0.7, blue: 0.9, alpha: 1.0)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        signInButton.layer.cornerRadius = 10
        signInButton.frame.size.height = 40
        view.addSubview(signInButton)
        
        signInLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 100)
        signInLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        
        emailLabel.autoPinEdge(.top, to: .bottom, of: signInLabel, withOffset: 48)
        emailLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        
        
        
        emailTextField.autoPinEdge(.top, to: .bottom, of: emailLabel, withOffset: 8)
        emailTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        emailTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
        emailTextField.autoPinEdge(.bottom, to: .top, of: passwordLabel)
        
        passwordLabel.autoPinEdge(.top, to: .bottom, of: emailTextField, withOffset: 24)
        passwordLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        
        passwordTextField.autoAlignAxis(toSuperviewAxis: .vertical)
        
        passwordTextField.autoPinEdge(.top, to: .bottom, of: passwordLabel, withOffset: 8)
        passwordTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        passwordTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
        
        signInButton.autoPinEdge(.top, to: .bottom, of: passwordTextField, withOffset: 48)
        signInButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 32)
        signInButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 32)
        
    }
}
