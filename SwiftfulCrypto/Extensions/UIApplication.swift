//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by wizz on 4/20/22.
//

import SwiftUI

extension UIApplication {
    
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
