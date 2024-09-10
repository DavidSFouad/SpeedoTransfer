//
//  AppStyles.swift
//  SpeedoTransfer
//
//  Created by David Sameh on 07/09/2024.
//

import Foundation

import UIKit

// Color extension
extension UIColor {
    static let appRed = UIColor(red: 1.00, green: 0.43, blue: 0.35, alpha: 1.00)
    static let appBackground = UIColor(red: 1.00, green: 0.93, blue: 0.93, alpha: 1.00)
}

// Font extension
extension UIFont {
    static func appFont(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .medium)
    }
}

// Custom TextField
class CustomTextField: UITextField {
    init(placeholder: String) {
        super.init(frame: .zero)
        self.borderStyle = .none
        self.font = UIFont.appFont(size: 16)
        self.placeholder = placeholder
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.setLeftPaddingPoints(10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
    