//
//  FoodHelper.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 04.11.24.
//

import Foundation

enum Meal: String, Codable, CaseIterable, Identifiable {
    var id: Self { self }
    
    case breakfast = "Frühstück"
    case lunch = "Mittagessen"
    case dinner = "Abendbrot"
    case snack = "Snack"
    case dessert = "Dessert"
    
    var titel: String {
        switch self {
        case .breakfast: "Frühstück"
        case .lunch:     "Mittagessen"
        case .dinner:    "Abendbrot"
        case .snack:     "Snack"
        case .dessert:   "Dessert"
        }
    }
}

/// **Season enum**
///
enum Season: String, Codable, CaseIterable, Identifiable {
    var id: Self { self }

    case spring = "Frühling"
    case summer = "Sommer"
    case autumn = "Herbst"
    case winter = "Winter"
    case allSeason = "Ganzjährig"
}

/// **UnitForSize enum**
///
enum UnitForSize: String, Codable, CaseIterable, Identifiable {
    var id: Self { self }
    
    case g    = "gramm"
    case kg   = "kilogramm"
    case l    = "liter"
    case ml   = "milliliter"
    case cl   = "centiliter"
    case St   = "Stück"
    case TL   = "Teelöffel"
    case EL   = "Esslöffel"
    case bund = "Bund"
    
    var title: String {
        switch self {
        case .g   : "gramm"
        case .kg  : "kilogramm"
        case .l   : "liter"
        case .ml  : "milliliter"
        case .cl  : "centiliter"
        case .St  : "Stück"
        case .TL  : "Teelöffel"
        case .EL  : "Esslöffel"
        case .bund: "Bund"
        }
    }

}
