//
//  MealCategoryVM.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 04.11.24.
//

import Foundation
import SwiftData

@Observable
class MealCategoryVM {
    
    /// **mealCategoryByCoda**
    /// This Array comes from the API
    var mealCategoriesByCoda: [MealCategoryFromCoda] { repo.mealCategories }

    /// **errorForAlert**
    /// Displays Errors connected with the API
    var errorForAlert: ErrorForAlert? { repo.errorForAlert }
    
    // MARK: - METHODS -
    
    /// updateDataInDatabase
    @MainActor
    func updateDataInDatabase(modelContext: ModelContext) {
        let categories: [MealCategoryFromCoda] = mealCategoriesByCoda
        for codaCategory in categories {
            let category = MealCategory(mealCategory: codaCategory.values)
            modelContext.insert(category)
            print("Inserted: \(category.name)")
        }
    }
    
    /// **NOT NEEDED WITH A SHRED REPO**
    init(repo: SharedRepository) {
        self.repo = repo
    }
    
    /// MealCategory Repository
    private var repo: SharedRepository = .shared
}
