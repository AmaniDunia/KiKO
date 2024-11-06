//
//  IngredientVM.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 05.11.24.
//

import Foundation
import SwiftData

@Observable
class IngredientVM {
    
    /// **Ingredients**
    ///
    var ingredients: [Ingredient] = []
    
    /// **selectedIngredient**
    ///
    var selectedIngredient: Ingredient?
    
    /// **selectedIngredientsForAction**
    ///
    var selectedIngredientsForAction: [Ingredient] = []
    
    /// **getIngredients**
    ///
    func getIngredients() {
        repo.getIngredients()
        for ingredient in repo.ingredients {
            if !ingredients.contains(ingredient) {
                ingredients = repo.ingredients
            }
        }
    }
    
    /// **selectIngredient**
    ///
    func selectIngredient(_ ingredient: Ingredient) {
        selectedIngredient = ingredient
    }
    
    /// **selectedIngredientsList**
    func makeListFromSelectedIngredients() {
        for ingredient in ingredients {
            if ingredient.isSelectedForAction {
                if !selectedIngredientsForAction.contains(ingredient) {
                    selectedIngredientsForAction.append(ingredient)
                } else {
                    print("Ingredient already in list")
                }
            }
        }
    }
    
    /// **selectIngredientForAction**
    ///
    func selectIngredientForAction(_ ingredient: Ingredient) {
        ingredient.isSelectedForAction = true
    }
    
    /// **unSelectIngredient**
    ///
    func unSelectIngredient() {
        selectedIngredient = nil
    }
    
    /// **saveSelectedIngredients**
    ///
    func saveSelectedIngredientsInSwiftData(modelContext: ModelContext) {
        for ingredient in ingredients {
            if ingredient.isSelectedForAction {
                modelContext.insert(ingredient)
                ingredient.isSelectedForAction = false
            }
        }
    }
    
    /// **IngredintsByCoda**
    /// This Array comes from the API
    ///
    /// **NO MORE NEED FOR THIS**
    private var ingredientsFromCoda: [IngredientFromCoda] { repo.ingredientsFromCoda }
    
    /// MealCategory Repository
    private var repo: SharedRepository = .shared
}
