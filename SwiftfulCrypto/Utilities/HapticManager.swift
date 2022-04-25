//
//  HapticManager.swift
//  SwiftfulCrypto
//
//  Created by wizz on 4/25/22.
//

import SwiftUI

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType){
        generator.notificationOccurred(type)
    }
}
