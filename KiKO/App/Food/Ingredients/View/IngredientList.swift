//
//  IngredientList.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 05.11.24.
//

import SwiftUI
import SwiftData

struct IngredientList: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.ingredients) { ingredient in
                    IngredientRow(ingredient: ingredient)
                }
                .listStyle(.plain)
            }
            .transition(.slide.combined(with: .opacity.combined(with: .scale(0.1))))
        }
        .navigationTitle("Zutaten")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if vm.ingredients.isEmpty {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Laden") {
                        withAnimation(.smooth(duration: 1.8, extraBounce: 0.35)) {
                            vm.getIngredients()
                        }
                    }
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Speichern") {
                    vm.makeListFromSelectedIngredients()
                }
            }
        }
    }
    
    @Bindable private var vm = IngredientVM()
}

#Preview {
    NavigationStack {
        IngredientList()
    }
}
