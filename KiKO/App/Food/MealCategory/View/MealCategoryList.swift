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
        
        List($vm.mealCategories) { $category in
            MealCategoryRow(category: $category)
                .frame(height: frameHeight)
        }
        .listStyle(.plain)
        .safeAreaInset(edge: .bottom) {
            VStack {
                Text("Found \(vm.mealCategoriesFromCoda.count) categories")
                Button("Update All Categories") {
                    vm.updateMealCategories()
                }
                Button("Save Selected Categories in Swift Data") {
                    vm.saveSelectedCategories(modelContext: modelContext)
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.red.gradient.opacity(0.1))
        }
    }
    // MARK: - VIEW PROPERTIES
    @State private var vm = MealCategoryVM()
    @Environment(\.modelContext) private var modelContext
    
}
#Preview {
    MealCategoryList()
        .fontDesign(.serif)
}
