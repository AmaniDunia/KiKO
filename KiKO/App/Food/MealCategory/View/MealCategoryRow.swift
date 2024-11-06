//
//  MealCategoryRow.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 04.11.24.
//

import SwiftUI

struct MealCategoryRow: View {
    /// Categorie for the Row
    @Binding var category: MealCategory
    
    /// Shadow Properties
    var shadowColor: Color = .primary
    var shadowRadius: CGFloat = 3
    var shadowX: CGFloat = 3
    var shadowY: CGFloat = 3
    
    /// @State isSelected
    
    var body: some View {
        
        HStack {
            // MARK: CheckMark
            BTNCheckMark(isSelected: category.isSelected)
                .shadow(
                    color: shadowColor.opacity(category.isSelected ? 1 : 0.8),
                    radius: category.isSelected ? shadowRadius : shadowRadius * 0.8,
                    x: category.isSelected ? shadowX : shadowX * 0.8,
                    y: category.isSelected ? shadowY : shadowY * 0.8
                )
                .opacity(category.isSelected ? 1 : 0.1)
            
            // MARK: Spacer isSelected
            if category.isSelected { Spacer(minLength: 0) }
            
            // MARK: TEXT
            Text(category.name)
                .padding(.trailing, category.isSelected ? 24 : 8)
                .shadow(
                    color: .green.opacity(category.isSelected ? 1 : 0.1),
                    radius: shadowRadius,
                    x: -shadowX,
                    y: shadowY
                )
            
            // MARK: Spacer !isSelected
            if !category.isSelected { Spacer(minLength: 0) }
        }
        .font(.title3)
        .bold()
        .padding(category.isSelected ? 8 : 0)
        .padding(.horizontal, 16)
        .background {
            ADRoundRec(isSelected: $category.isSelected, color: .secondary.opacity(0.1))
        }
        .clipped()
        // MARK: swipeActions
        .swipeActions(edge: .leading, allowsFullSwipe: true) {
            
            Button(action: {
                withAnimation(.smooth(duration: 0.8, extraBounce: 0.35).delay(0.2)) {
                    category.isSelected.toggle()
                }
            }) {
                Image(systemName: category.isSelected ? "checkmark.circle.fill" : "checkmark.circle")
                    .tint(category.isSelected ? .gray : .green)
            }
            
        }
        // MARK: onTapGesture
        .onTapGesture {
            withAnimation {
                category.isSelected.toggle()
            }
        }
    }
    
}

#Preview {
    MealCategoryRow(category: .constant(.example01))
        
}
