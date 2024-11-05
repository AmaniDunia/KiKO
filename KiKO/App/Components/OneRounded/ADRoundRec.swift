//
//  ADRoundRec.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 04.11.24.
//

import SwiftUI

struct ADRoundRec: View {

    @Binding var isSelected: Bool
    
    var color: Color = .secondary
    var strokeWidth: CGFloat = 3
    var animationAmountFinal: CGFloat = 0.9
    var isOneWay: Bool = false
    var startPoint: UnitPoint = .topLeading
    var endPoint: UnitPoint = .bottomTrailing
    
    // MARK: - Corners
    var topLeft: CGFloat = 8
    var topRight: CGFloat = 8
    var botLeft: CGFloat = 8
    var botRight: CGFloat = 8
    var style: RoundedCornerStyle = .continuous
    
    var body: some View {
        UnevenRoundedRectangle(
            topLeadingRadius: topLeft,
            bottomLeadingRadius: botLeft,
            bottomTrailingRadius: botRight,
            topTrailingRadius: topRight,
            style: style
        )
        .foregroundStyle(color)
        .overlay {
            UnevenRoundedRectangle(
                topLeadingRadius: topLeft,
                bottomLeadingRadius: botLeft,
                bottomTrailingRadius: botRight,
                topTrailingRadius: topRight,
                style: style
            )
            .stroke(LinearGradient(
                colors:
                    [
                        .red,
                        .green,
                        .yellow,
                        .cyan,
                        .blue,
                        .purple,
                        .orange,
                        .indigo,
                        .mint
                    ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ), lineWidth: isSelected ? strokeWidth * animationAmountFinal : strokeWidth)
            .opacity(isSelected ? animationAmount * 2 - (animationAmount / animationAmountFinal) : 1)
            .blur(radius: !isSelected ? animationAmount * 8 : animationAmount * 2)
        }
        .scaleEffect(animationAmount)
        .opacity(isSelected ? 2.0 * animationAmountFinal - animationAmount : 1)
        .animation(.easeInOut(duration: 8).repeatForever(autoreverses: !isOneWay), value: animationAmount)
        .onAppear {
            if isSelected { animationAmount = animationAmountFinal }
            
        }
    }
    @State private var animationAmount: CGFloat = 1.0
}

#Preview {
    ADRoundRec(isSelected: .constant(true))
}
