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
    
    init(
        id: String = UUID().uuidString,
        name: String,
        imageName: String = "",
        family: String = ""
    ) {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.family = family
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

// MARK: - DTO - Data Transfer Object -

// MARK: - MealCategoryDTO
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
struct MealCategoryByCoda: Codable, Identifiable {
    let id: String
    let name: String
    let values: MealCategoryDTO
}
// MARK: - MealCategoryApiResponse
struct MealCategoryApiResponse: Codable {
    let items: [MealCategoryByCoda]
}

// MARK: - Samples -

// MARK: - MealCategoryDTO
extension MealCategoryDTO {
    static var example01: Self {
        .init(
            id: "MealCategoryValues-01-Breakfast",
            name: "Gemüse",
            imageName: "nil",
            family: "[]"
        )
    }
    static var example02: Self {
        .init(
            id: "MealCategoryValues-02-Döner",
            name: "Obst",
            imageName: "nil",
            family: "[]"
        )
    }
}
// MARK: - MealCategoryByCoda
extension MealCategoryByCoda {
    static var example01: Self {
        .init(
            id: "MealCategory-01-Breakfast",
            name: "Breakfast",
            values: .example01
        )
    }
    static var example02: Self {
        .init(
            id: "MealCategory-02-Döner",
            name: "Döner",
            values: .example02
        )
    }
}
// MARK: - MealCategoryApiResponse
extension MealCategoryApiResponse {
    static var example01: Self {
        .init(items: [.example01, .example02])
    }
}
