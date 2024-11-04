//
//  MealCategoryList.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 04.11.24.
//

import SwiftUI
import SwiftData

struct MealCategoryList: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \MealCategory.name) var mealCategories: [MealCategory]
    @State var vm = MealCategoryVM(repo: MealCategoryRepo.shared)
    var frameHeight: CGFloat = 40
    
    var body: some View {
        
        List(vm.mealCategoriesByCoda) { categorie in
            MealCategoryRow(category: categorie)
                .frame(height: frameHeight)
        }
        .listStyle(.plain)
    }
}
#Preview {
    MealCategoryList()
        .fontDesign(.serif)
}
