//
//  MealCategoryList.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 04.11.24.
//

import SwiftUI
import SwiftData

struct MealCategoryList: View {
    
    @State var vm = MealCategoryVM(repo: MealCategoryRepo.shared)
    var frameHeight: CGFloat = 56
    var body: some View {
        
        List(mealCategories) { categorie in
            MealCategoryRow(category: categorie)
                .frame(height: frameHeight)
        }
        .listStyle(.plain)
        .navigationBarTitle("Kategorien")
        
        if mealCategories.isEmpty {
            Text("Found \(vm.mealCategoriesByCoda.count) categories")
            Button("Save All Categories in Swift Data") {
                vm.updateDataInDatabase(modelContext: modelContext)
            }
        }
    }
    // MARK: - VIEW PROPERTIES
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \MealCategory.name) private var mealCategories: [MealCategory]
}
#Preview {
    MealCategoryList()
        .modelContainer(for: MealCategory.self, inMemory: true)
        .fontDesign(.serif)
}
