//
//  UIResponder + Extension.swift
//  CustomTextField
//
//  Created by Evgeny on 18.04.2021.
//

import Foundation
import SwiftUI

//returns current first responder
extension UIResponder {

    ///Returns current first responder
    static var currentFirstResponder: UIResponder? {
        _currentFirstResponder = nil
        UIApplication.shared.sendAction(#selector(UIResponder.findFirstResponder(_:)), to: nil, from: nil, for: nil)
        return _currentFirstResponder
    }

    private static weak var _currentFirstResponder: UIResponder?

    @objc private func findFirstResponder(_ sender: Any) {
        UIResponder._currentFirstResponder = self
    }
}
