//
//  LoginView.swift
//  Bankey
//
//  Created by costin popescu on 8/22/22.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    let stackView = UIStackView()
    let userNameTextField = UITextField()
    let password = UITextField()
    // The divider between the userNameTextView and the password text fields.
    let divider = UIView()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) failed at UIView LoginView")
    }
    
}

// Keep the style and layout separate teacher's solution.
extension LoginView {
    
    func style(){
        
        // The LoginView styles.
        self.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
        // The stackView container styles.
        // Enable auto-layout, set its axis to vertical, and set the spacing between the elements within it.
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        
        // The userNameTextField styles.
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.placeholder = "User name"
        // Set the userNameTextField as the delegate so the userNameTextField can send us messages about
        // its state through its protocol. The protocol its implemented in the extension bellow.
        userNameTextField.delegate = self
        
        // The password styles.
        password.translatesAutoresizingMaskIntoConstraints = false
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        // Set its delegate. It implements the same delegate methods as the userNameTextField.
        password.delegate = self
        
        // The divider styles.
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = .secondarySystemFill
    }
    
    func layout() {
        
        // Add the eleements taht go into the stackView container.
        stackView.addArrangedSubview(userNameTextField)
        stackView.addArrangedSubview(divider)
        stackView.addArrangedSubview(password)
        
        // Add the stackView to LoginView.
        addSubview(stackView)
        
        // You only need to add constraints to the stackView.
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            divider.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        // *** This is another way to add constraints. It sets the height of the divider to constant 1.
        // I like the array more. In the array is the last constraint.
        //divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        // Round the corners of the stackView.
        // First grab the CALayer of the entire LoginView.
        layer.cornerRadius = 15
        // Exclude any other backgroud of the CALayer.
        clipsToBounds = true
        
    }
}

// MARK: - UITextFieldDelegate protocol implementation.
extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextField.endEditing(true)
        password.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
