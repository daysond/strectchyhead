//
//  NewsItem.swift
//  StretchMyHead
//
//  Created by Dayson Dong on 2019-06-11.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

import Foundation
import UIKit

struct NewsItem {
    var category: NewsCategory
    var headline: String
    var categoryColor: UIColor {
        
        switch category {
        case .World:
            return .red
        case .Americas:
            return .blue
        case .Europe:
            return .green
        case .MiddleEast:
            return .yellow
        case .Africa:
            return .orange
        case .AsiaPacific:
            return .purple
        }
        
    }
}

enum NewsCategory:String {
    case World = "World"
    case Europe = "Europe"
    case Americas = "Americas"
    case MiddleEast = "Middle East"
    case Africa = "Africa"
    case AsiaPacific = "Asia Pacific"
}
