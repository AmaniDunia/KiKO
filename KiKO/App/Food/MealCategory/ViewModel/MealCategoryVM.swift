//
//  MealCategoryVM.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 04.11.24.
//
import Combine
import Foundation
import SwiftData

@Observable
class MealCategoryVM {
    
    var mealCategoriesFromCoda: [MealCategoryFromCoda] { repo.mealCategoriesFromCoda }
    
    var mealCategories: [MealCategory] = []

    /// **errorForAlert**
    /// Displays Errors connected with the API
    var errorForAlert: ErrorForAlert? { repo.errorForAlert }
    
    // MARK: - METHODS -
    func saveSelectedCategories(modelContext: ModelContext) {
        mealCategories.forEach { mealcategory in
            if mealcategory.isSelected {
                modelContext.insert(mealcategory)
            }
        }
    }
    
    func updateMealCategories() {
        let mealCategoriesFromCoda: [MealCategoryFromCoda] = mealCategoriesFromCoda
        for mealCategoryFromCoda in mealCategoriesFromCoda {
            let mealCategory = MealCategory(mealCategory: mealCategoryFromCoda.values)
            mealCategories.append(mealCategory)
        }
    }
    
    /// updateDataInDatabase
    @MainActor
    func saveAllCategoriesInSwiftData(modelContext: ModelContext) {
        let categories: [MealCategoryFromCoda] = mealCategoriesFromCoda
        for codaCategory in categories {
            let category = MealCategory(mealCategory: codaCategory.values)
            modelContext.insert(category)
            print("Inserted: \(category.name)")
        }
    }
    
    /// **NOT NEEDED WITH A SHRED REPO**
    
    /// MealCategory Repository
    private var repo: SharedRepository = .shared
    
    /// **mealCategoryByCoda**
    /// This Array comes from the API
    
}
