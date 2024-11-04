//
//  MealCategorySamples.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 04.11.24.
//

import Foundation
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
