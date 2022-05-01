//
//  String.swift
//  SwiftfulCrypto
//
//  Created by wizz on 5/1/22.
//

import Foundation


extension String {
    
    var removingHTMLOccurances: String{
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression,range: nil)
    }
}
