//
//  extension MealCategory.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 04.11.24.
//

import Foundation
import SwiftData

// MARK: -- EXTENSION MEALCATEGORY --

extension MealCategory {
    
    @ModelActor
    actor BackgroundActor {
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
        
        // MARK: - GET MealCategoriesFromCoda
    }
}
