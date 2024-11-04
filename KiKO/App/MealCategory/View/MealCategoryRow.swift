//
//  MealCategoryRow.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 04.11.24.
//

import SwiftUI

struct MealCategoryRow: View {
    /// Categorie for the Row
    var category: MealCategoryByCoda = .example01
    
    /// Shadow Properties
    var shadowColor: Color = .primary
    var shadowRadius: CGFloat = 8
    var shadowX: CGFloat = 8
    var shadowY: CGFloat = 8
    
    /// @State isSelected
    @State var isSelected: Bool = true
    
    var body: some View {
        
        HStack {
            // MARK: - CheckMark
            BTNCheckMark(isSelected: isSelected)
                .shadow(
                    color: shadowColor.opacity(isSelected ? 1 : 0.8),
                    radius: isSelected ? shadowRadius : shadowRadius * 0.8,
                    x: isSelected ? shadowX : shadowX * 0.8,
                    y: isSelected ? shadowY : shadowY * 0.8
                )
                .opacity(isSelected ? 1 : 0.1)
            
            // MARK: - Spacer isSelected
            if isSelected { Spacer(minLength: 0)}
            
            Text(category.name)
                .padding(.trailing, isSelected ? 24 : 8)
                .shadow(
                    color: .green.opacity(isSelected ? 1 : 0.1),
                    radius: shadowRadius,
                    x: shadowX,
                    y: shadowY
                )
            // MARK: - Spacer !isSelected
            if !isSelected { Spacer(minLength: 0)}
        }
        .font(.title3)
        .bold()
        .padding(isSelected ? 8 : 0)
        .padding(.horizontal, 16)
        .background {
            ADRoundRec(isSelected: $isSelected, color: .secondary.opacity(0.1))
        }
        .clipped()
        .swipeActions(edge: .leading, allowsFullSwipe: true) {
            Button(action: {
                withAnimation(.smooth(duration: 2, extraBounce: 0.35).delay(0.2)) {
                    isSelected.toggle()
                }
            }) {
                Image(systemName: isSelected ? "checkmark.circle.fill" : "checkmark.circle")
                    .tint(isSelected ? .gray : .green)
            }
            
        }
        .onTapGesture {
            withAnimation {
                isSelected.toggle()
            }
        }
    }
    
}

#Preview {
    MealCategoryRow()
}
