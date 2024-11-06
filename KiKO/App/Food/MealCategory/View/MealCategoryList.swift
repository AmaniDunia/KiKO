//
//  MealCategoryList.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 04.11.24.
//

import SwiftUI
import SwiftData

struct MealCategoryList: View {
    var frameHeight: CGFloat = 56
    var body: some View {
        
        if mealCategories.isEmpty {
            List($vm.mealCategories) { $category in
                MealCategoryRow(category: $category)
                    .frame(height: frameHeight)
            }
            .listStyle(.plain)
        } else {
            List(mealCategories) { category in
                Text(category.name)
            }
            .navigationBarTitle("Kategorien")
        }
        
        if mealCategories.isEmpty {
            Text("Found \(vm.mealCategoriesFromCoda.count) categories")
            Button("Update All Categories") {
                vm.updateMealCategories()
            }
            Button("Save Selected Categories in Swift Data") {
                vm.saveSelectedCategories(modelContext: modelContext)
            }
        }
    }
    // MARK: - VIEW PROPERTIES
    @State private var vm = MealCategoryVM()
    
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \MealCategory.name) var mealCategories: [MealCategory]
}
#Preview {
    MealCategoryList()
        .modelContainer(for: MealCategory.self, inMemory: true)
        .fontDesign(.serif)
}
