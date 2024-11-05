//
//  FoodHelper.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 04.11.24.
//

import Foundation


// MARK: - Season enum
enum Season: String, Codable, CaseIterable, Identifiable {
    var id: Self { self }
    
    case spring = "Frühling"
    case summer = "Sommer"
    case autumn = "Herbst"
    case winter = "Winter"
    case allSeason = "Ganzjährig"
}
