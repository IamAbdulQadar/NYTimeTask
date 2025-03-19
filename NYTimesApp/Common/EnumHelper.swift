//
//  EnumHelper.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 16/03/2025.
//

import Foundation

enum PathType: String, CaseIterable, Identifiable {
    var id: String {
        return self.rawValue
    }
    case viewed
    case shared

    func title() -> String {
        switch self {
        case .viewed:
            return "Viewed"
        case .shared:
            return "Shared"
        }
    }
}

enum Period: String, CaseIterable, Identifiable {
    var id: String {
        return self.rawValue
    }

    case day = "1"
    case week = "7"
    case month = "30"

    func title() -> String{
        switch self {
        case .day:
            return "Day"
        case .week:
            return "Week"
        case .month:
            return "Month"
        }
    }
}
