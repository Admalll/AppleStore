//
//  OnboardInfo.swift
//  AppleStore
//
//  Created by Vlad on 14.07.2021.
//

import Foundation

enum Pages: CaseIterable {
    case pageZero
    case pageOne
    case pageTwo
    
    var title: String {
        switch self {
        case .pageZero:
            return "Track Your Cycle"
        case .pageOne:
            return "Plan Your Pregnant"
        case .pageTwo:
            return "Daily Health Insight"
        }
    }
    
    var description: String {
        switch self {
        case .pageZero:
            return "Manage irregular period and learn to improve your period."
        case .pageOne:
            return "Favorable days are important. Vestibulum rutrum quam vitae fringilla tincidunt."
        case .pageTwo:
            return "Personal health insight. Vestibulum rutrum quam vitae fringilla tincidunt."
        }
    }
    
    var index: Int {
        switch self {
        case .pageZero:
            return 0
        case .pageOne:
            return 1
        case .pageTwo:
            return 2
        }
    }
    
    var imageName: String {
        switch self {
        case .pageZero:
            return "firstImage"
        case .pageOne:
            return "secondImage"
        case .pageTwo:
            return "thirdImage"
        }
    }
}
