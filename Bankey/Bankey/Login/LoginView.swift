//
//  LoginView.swift
//  Bankey
//
//  Created by costin popescu on 8/22/22.
//

import Foundation
import UIKit

class LoginView: UIView{
    
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
        
    }
    
    func layout() {
        
    }
}
