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
    var mealCategoriesByCoda: [MealCategoryByCoda] { repo.mealCategories }

    /// **errorForAlert**
    /// Displays Errors connected with the API
    var errorForAlert: ErrorForAlert? { repo.errorForAlert }
    
    // MARK: - METHODS -
    
    // MARK: updateDataInDatabase
    @MainActor
    func updateDataInDatabase(modelContext: ModelContext) {
        let categories: [MealCategoryByCoda] = mealCategoriesByCoda
        for codaCategory in categories {
            let category = MealCategory(mealCategory: codaCategory.values)
            modelContext.insert(category)
        }
    }
    
    // MARK: - INIT -
    /// Uses Depandecy Injection
    init(repo: MealCategoryRepo) {
        self.repo = repo
    }
    
    // MARK: - PRIVATE -
    
    /// MealCategory Repository
    private var repo: MealCategoryRepo
}
