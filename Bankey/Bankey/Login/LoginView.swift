//
//  LoginView.swift
//  Bankey
//
//  Created by costin popescu on 8/22/22.
//

import Foundation
import UIKit

class LoginView: UIView{
    
    let userNameTextField = UITextField()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) failed at UIView LoginView")
    }
    
    override var intrinsicContentSize: CGSize{
        return CGSize(width: 200, height: 200)
    }
}

// Keep the style and layout separate teacher's solution.
extension LoginView {
    
    func style(){
        // The LoginView container styles
        self.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .orange
        
        // The userNameTextField styles.
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.placeholder = "User name"
        // Set the userNameTextField as the delegate so the userNameTextField can send us messages about
        // its state through its protocol. The protocol its implemented in the extension bellow.
        userNameTextField.delegate = self
    }
    
    func layout() {
        
    }
}

// MARK: - UITextFieldDelegate protocol implementation.
extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else{
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
