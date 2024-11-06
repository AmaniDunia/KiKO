//
//  Recipe.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 06.11.24.
//

import Foundation
import SwiftData
import UIKit

@Model
class Recipe {
    @Attribute(.unique) var id: String
    var details: String
    var image: Data?
    var level: Int
    var preparationTime: Int
    var durationTime: Int
    var meal: Meal?
    var season: Season?
    var ingredients: [Ingredient]
    var steps: [String]
    
    init(
        id: String,
        details: String,
        image: Data? = nil,
        level: Int,
        preparationTime: Int,
        durationTime: Int,
        meal: Meal? = nil,
        season: Season? = nil,
        ingredients: [Ingredient],
        steps: [String]
    ) {
        self.id = id
        self.details = details
        self.image = image
        self.level = level
        self.preparationTime = preparationTime
        self.durationTime = durationTime
        self.meal = meal
        self.season = season
        self.ingredients = ingredients
        self.steps = steps
    }
}

extension Recipe {
    var viewImage: UIImage {
        if let image {
            return UIImage(data: image)
            ?? UIImage(resource: .mango)
        } else {
            return UIImage(resource: .mango)
        }
    }
}
