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
        .onAppear {
            vm.updateMealCategories()
        }
    }
    // MARK: - VIEW PROPERTIES
    @Bindable private var vm = MealCategoryVM()
    @Environment(\.modelContext) private var modelContext
    
}
#Preview {
    MealCategoryList()
        .fontDesign(.serif)
}
