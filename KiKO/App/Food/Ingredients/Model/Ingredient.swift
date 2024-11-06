//
//  Ingredient.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 04.11.24.
//

import Foundation
import SwiftData

// MARK: - MODEL Ingredient -
///
@Model
class Ingredient {
    @Attribute(.unique) var id: String
    var name: String
    var details: String
    var image: String
    var isLocal: Bool
    var season: Season.RawValue
    var category: MealCategory?
    var family: String
    var unit: UnitForSize?
    var size: String
    var isLiked: Bool
    var isDisliked: Bool
    var isSelectedForAction: Bool
    var isSelectedForRecipe: Bool
    
    init(
        id: String,
        name: String,
        details: String,
        image: String,
        isLocal: Bool,
        season: Season.RawValue,
        category: MealCategory? = nil,
        family: String,
        unit: UnitForSize? = nil,
        size: String = "",
        isLiked: Bool = false,
        isDisliked: Bool = false,
        isSelectedForAction: Bool = false,
        isSelectedForRecipe: Bool = false
    ) {
        self.id = id
        self.name = name
        self.details = details
        self.image = image
        self.isLocal = isLocal
        self.season = season
        self.category = category
        self.family = family
        self.unit = unit
        self.size = size
        self.isLiked = isLiked
        self.isDisliked = isDisliked
        self.isSelectedForAction = isSelectedForAction
        self.isSelectedForRecipe = isSelectedForRecipe
    }
    
    convenience init(ingredient: IngredientDTO) {
        self.init(
            id: ingredient.id,
            name: ingredient.name,
            details: ingredient.details,
            image: ingredient.image,
            isLocal: ingredient.isLocal,
            season: ingredient.season,
            family: ingredient.family
        )
    }
}

// MARK: - IngredientDTO
///
struct IngredientDTO: Codable, Identifiable {
    let id: String
    let name: String
    var details: String
    var image: String
    var isLocal: Bool
    var season: String
    var category: String
    var family: String
    // MARK: - CodingKeys
    ///
    enum CodingKeys: String, CodingKey {
        case id = "c-ejYFwmmvd7"
        case name = "c-s8qfla1HxK"
        case details = "c-N8vOrbXQ_1"
        case image = "c-S4w1zyX1tW"
        case isLocal = "c-VFsBdjXYji"
        case season = "c-uPQKdND6xh"
        case category = "c-jRP7_DApkw"
        case family = "c-MGofXGmWWd"
    }
}
// MARK: - IngredientCodaResponse
///
struct IngredientCodaResponse: Codable {
    let items: [IngredientFromCoda]
}
// MARK: - IngredientCoda
///
struct IngredientFromCoda: Codable, Identifiable {
    let id: String
    let name: String
    let values: IngredientDTO
}


// MARK: - EXTENSION - Ingredient -
extension Ingredient {
    @ModelActor
    // MARK: - BackgroundActor
    ///
    actor BackgroundActor {
        
        // MARK: - IngredientDTO
        ///
        struct IngredientDTO: Codable, Identifiable {
            let id: String
            let name: String
            var details: String
            var image: String
            var isLocal: Bool
            var season: String
            var category: String
            var family: String
            // MARK: - CodingKeys
            ///
            enum CodingKeys: String, CodingKey {
                case id = "c-ejYFwmmvd7"
                case name = "c-s8qfla1HxK"
                case details = "c-N8vOrbXQ_1"
                case image = "c-S4w1zyX1tW"
                case isLocal = "c-VFsBdjXYji"
                case season = "c-uPQKdND6xh"
                case category = "c-jRP7_DApkw"
                case family = "c-MGofXGmWWd"
            }
        }
        // MARK: - IngredientCodaResponse
        ///
        struct IngredientCodaResponse: Codable {
            let items: [IngredientCoda]
        }
        // MARK: - IngredientCoda
        ///
        struct IngredientCoda: Codable, Identifiable {
            let id: String
            let name: String
            let values: IngredientDTO
        }
        // MARK: - GET Inngredients
        ///
        func getIngredients() async throws -> [IngredientCoda] {
            
            return []
        }
    }
}

