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
        VStack(alignment: .leading) {
            
            /// **IngredientRow**
            ///
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
            
            // MARK: GESTURES
            
            /// **TapGesture 2**
            .onTapGesture {
                withAnimation(
                    .smooth(
                        duration: 0.4,
                        extraBounce: 0.25
                    )) {
                        ingredient.isSelectedForAction.toggle()
                    }
            }
            /// **TapGesture 2**
            .onTapGesture(count: 2) {
                withAnimation(
                    .smooth(
                        duration: 0.4,
                        extraBounce: 0.25
                    )) {
                        ingredient.isLiked.toggle()
                    }
            }
            
            // MARK: swipe.leading full
            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                Button {
                    ingredient.isLiked.toggle()
                } label: {
                    Image(systemName: ingredient.isLiked ? "heart.fill" : "heart")
                        .tint(ingredient.isLiked ? .gray : .red)
                }
            }
            // MARK: swip.trailing full
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
            
            /// isSelectedForRecipe?
            /// **UnitAndSize**
            ///
            HStack {
                if ingredient.isSelectedForAction {
                    TextField("Menge", text: $size)
                } else {
                    Spacer(minLength: 0)
                }
                Picker(unit.title, selection: $unit) {
                    ForEach(UnitForSize.allCases) { units in
                        Text(units.rawValue)
                    }
                }
                .disabled(!ingredient.isSelectedForAction)
            }
            .transition(
                .asymmetric(
                    insertion:
                            .opacity
                        .combined(with: .scale(scale: 0.1, anchor: .bottomTrailing))
                        .combined(with: .move(edge: .leading)),
                    removal: .scale(scale: 0.1, anchor: .bottomLeading).combined(with: .opacity)
                )
            )
        }
        .padding()
    }
    @State private var isSelectedForAction: Bool = false
    @State private var size: String = ""
    @State private var unit: UnitForSize = .St
    
}

#Preview {
    IngredientRow()
}
