//
//  MealCategory.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 04.11.24.
//

import Foundation
import SwiftData

// MARK: - MODEL - MealCategory -
@Model
class MealCategory {
    @Attribute(.unique) var id: String
    var name: String
    var imageName: String
    var family: String
    var isSelected: Bool
    
    init(
        id: String = UUID().uuidString,
        name: String,
        imageName: String = "",
        family: String = "",
        isSelected: Bool = false
    ) {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.family = family
        self.isSelected = isSelected
    }
    
    convenience init(mealCategory: MealCategoryDTO) {
        self.init(
            id: mealCategory.id,
            name: mealCategory.name,
            imageName: mealCategory.imageName,
            family: mealCategory.family
        )
    }
}

// MARK: - DTO - Data Transfer Object

// MARK: - MealCategoryDTO
///
struct MealCategoryDTO: Codable, Identifiable {
    let id: String
    let name: String
    let imageName: String
    let family: String

    // MARK: CodingKeys
    enum CodingKeys: String, CodingKey {
        case id = "c-qqMaJvjG8k"
        case name = "c-uaxaNkySv-"
        case imageName = "c-OXRq5FPxPd"
        case family = "c-zFUUDtXP4Z"
    }
}
// MARK: - MealCategoryByCoda
///
struct MealCategoryFromCoda: Codable, Identifiable {
    let id: String
    let name: String
    let values: MealCategoryDTO
}
// MARK: - MealCategoryApiResponse
///
struct MealCategoryApiResponse: Codable {
    let items: [MealCategoryFromCoda]
}


