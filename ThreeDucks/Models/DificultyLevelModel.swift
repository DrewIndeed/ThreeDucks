//
//  DificultyLevelModel.swift
//  ThreeDucks
//
//  Created by Andrew Le Nguyen on 13/08/2022.
//

import SwiftUI

enum DifficultyLevel: String, Identifiable, CaseIterable, Comparable, Codable {
    // difficulty levels
    case easy = "Easy"
    case normal = "Normal"
    case hard = "Hard"
    
    // colors of level buttons
    var color: Color {
        switch self {
        case .hard:
            return Color.red
        case .normal:
            return Color.blue
        case .easy:
            return Color.green
        }
    }
    
    var id: String {rawValue}
    
    static func < (lhs: DifficultyLevel, rhs: DifficultyLevel) -> Bool {
        switch (lhs, rhs) {
        case (.easy, .normal), (.easy, .hard), (.normal, .hard):
            return true
        default:
            return false
        }
    }
}
