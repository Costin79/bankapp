//
//  ViewController.swift
//  Bankey
//
//  Created by costin popescu on 8/22/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    let titleBankey = UILabel()
    let textUnderTitle = UILabel()
    
    
    let loginView = LoginView()
    // The UIButton with a type parameter creates a default button type. There are four default button types.
    let signinBtn = UIButton(type: .system)
    let errMessageLabel = UILabel()
    
    // These computed properties get the user name and password out of their respective text fields.
    // They return optionals because .text returns a string optional.
    var userName: String? { return loginView.userNameTextField.text }
    var password: String? { return loginView.password.text }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    
    private func style(){
        
        // Title and the text under the title styling.
        titleBankey.translatesAutoresizingMaskIntoConstraints = false
        titleBankey.textAlignment = .center
        titleBankey.text = "Bankey"
        titleBankey.font = .boldSystemFont(ofSize: 30)
        
        textUnderTitle.translatesAutoresizingMaskIntoConstraints = false
        textUnderTitle.textAlignment = .center
        textUnderTitle.font = .systemFont(ofSize: 20)
        textUnderTitle.numberOfLines = 0
        textUnderTitle.text = "Your premium source for all things banking!"
        
        
        
        textUnderTitle.translatesAutoresizingMaskIntoConstraints = false
        
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        //Sign in button styling.
        signinBtn.translatesAutoresizingMaskIntoConstraints = false
        signinBtn.configuration = .filled() // The paranthesis mean the .filled function got called
        signinBtn.configuration?.imagePadding = 8 // for indicator spacing
        signinBtn.setTitle("Sign in", for: [])
        // Sign in button action listener.
        signinBtn.addTarget(self, action: #selector(signInClicked), for: .primaryActionTriggered)
        
        // Error label styling.
        errMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errMessageLabel.textAlignment = .center
        errMessageLabel.textColor = .systemRed
        errMessageLabel.numberOfLines = 0
        errMessageLabel.isHidden = true
    }
    
    private func layout(){
        view.addSubview(titleBankey)
        view.addSubview(textUnderTitle)
        view.addSubview(loginView)
        view.addSubview(signinBtn)
        view.addSubview(errMessageLabel)
        
        NSLayoutConstraint.activate([
            // Login view constraints
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            // Login button constraints
            signinBtn.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signinBtn.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signinBtn.trailingAnchor, multiplier: 1),
            // Error message label constraints.
            errMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signinBtn.bottomAnchor, multiplier: 3),
            errMessageLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: errMessageLabel.trailingAnchor, multiplier: 1)
            
        ])
        
        // The constraints for the title and the text above the log in view.
        // Could have been put in the same array but made a new one cuz the one above is getting too big.
        NSLayoutConstraint.activate([
            textUnderTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: textUnderTitle.bottomAnchor, multiplier: 2),
            textUnderTitle.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 5),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: textUnderTitle.trailingAnchor, multiplier: 5),
            
            titleBankey.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textUnderTitle.topAnchor.constraint(equalToSystemSpacingBelow: titleBankey.bottomAnchor, multiplier: 3)
        ])
    }
}

// MARK: Action Listeners
extension LoginViewController {
    
    // The function that gets triggered by the sign in buttonevent listener.
    @objc func signInClicked(sender: UIButton){
        
        // Assume that the errMessageLabel is visible so make it hidden.
        errMessageLabel.isHidden = true
        // The login() function is bellow.
        login()
    }
    
    func login() {
        
        // Unwrap the string optionals returned by the computed properties userName and password.
        guard let userName = userName, let password = password else {
            // assertionFailure seems to be a way to write a error message without using print.
            // Only appears in debug builds, so it gets compiled out in production builds.
            assertionFailure("userName and/or password are nil")
            return
        }
        
        if userName.isEmpty || password.isEmpty
        {
            // This function is bellow.
            configureView(withMessage: "Username / password cannot be blank")
           // return
        }
        else if userName == "Kevin" && password == "1234"
        {
            // This makes the spining indicator comme up on the sign in button.
            signinBtn.configuration?.showsActivityIndicator = true
        }
        else
        {
            configureView(withMessage: "Incorect user name / password")
        }
    }
    
    private func configureView (withMessage message: String){
        errMessageLabel.isHidden = false
        errMessageLabel.text = message
    }
    
}
