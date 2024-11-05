//
//  IngredientRow.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 05.11.24.
//

import SwiftUI

struct IngredientRow: View {
    var ingredient: Ingredient = .sample
    var body: some View {
        HStack {
            Image(systemName: "checkmark")
                .foregroundColor(ingredient.isSelectedForAction ? .green : .red)
                .scaleEffect(
                    ingredient.isSelectedForAction ? 1.11 : 0.7,
                    anchor: .trailing
                )
                .fontWeight(ingredient.isSelectedForAction ? .medium : .light)
            
            if ingredient.isSelectedForAction { Spacer(minLength: 0) }
            
            Text(ingredient.name)
                .fontWeight(ingredient.isLiked ? .medium : .light)
            
            if !ingredient.isSelectedForAction { Spacer(minLength: 0) }
        }
        .background(.gray.opacity(0.01))
        .fontWidth(ingredient.isSelectedForAction ? .expanded : .standard)
        .padding()
    }
}

#Preview {
    IngredientRow()
}
