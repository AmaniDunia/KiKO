//
//  IngredientList.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 05.11.24.
//

import SwiftUI
import SwiftData

struct IngredientList: View {
    private var vm = IngredientVM()
    var body: some View {
        VStack {
            List(vm.ingredients) { ingredient in
                IngredientRow(ingredient: ingredient)
                // MARK: - onTap
                    .onTapGesture {
                        withAnimation(
                            .smooth(
                                duration: 0.4,
                                extraBounce: 0.25
                            )) {
                                ingredient.isSelectedForAction.toggle()
                            }
                    }
                    .onTapGesture(count: 2) {
                        withAnimation(
                            .smooth(
                                duration: 0.4,
                                extraBounce: 0.25
                            )) {
                                ingredient.isLiked.toggle()
                            }
                    }
                // MARK: - leading
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button {
                            ingredient.isLiked.toggle()
                        } label: {
                            Image(systemName: ingredient.isLiked ? "heart.fill" : "heart")
                                .tint(ingredient.isLiked ? .gray : .red)
                        }
                    }
                // MARK: - trailing
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button {
                            withAnimation(.smooth(duration: 0.8, extraBounce: 0.3)) {
                                ingredient.isSelectedForAction.toggle()
                            }
                        } label: {
                            Image(systemName: ingredient.isSelectedForAction ? "heart.circle.fill" : "heart.circle")
                                .tint(ingredient.isLiked ? .gray : .green)
                        }
                    }
                
            }
            .listStyle(.plain)
            
            Button("Save Selcted Ingredients") {
                vm.makeListFromSelectedIngredients()
            }
            .padding()
            
            Button("Update List") {
                vm.getIngredients()
            }
            .padding()
        }
        .overlay {
            if !vm.selectedIngredientsForAction.isEmpty {
                List(vm.selectedIngredientsForAction) { ingredient in
                    VStack {
                        IngredientRow(ingredient: ingredient)
                        
                        
                    }
                }
            }
        }
    }
}

#Preview {
    IngredientList()
}
