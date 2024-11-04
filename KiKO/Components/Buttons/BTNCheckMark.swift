//
//  CheckMarkBTN.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 04.11.24.
//

import SwiftUI

struct BTNCheckMark: View {
    var isSelected: Bool = true
    var body: some View {
        Image(systemName: "checkmark.circle")
            .foregroundStyle(
                AngularGradient(
                    colors:
                        [.red, .green, .yellow, .cyan, .blue, .purple, .orange, .indigo, .mint],
                    center: .topLeading,
                    angle: .init(degrees: isSelected ? 0 : 360)
                )
            )
            .overlay {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(isSelected ? .green : .gray)
                    .scaleEffect(!isSelected ? 1.1 : 0.88)
            }
            .scaleEffect(isSelected ? 2.1 : 0.8, anchor: .trailing)
            .padding()
            .shadow(
                color: isSelected ? .white : .secondary,
                radius: isSelected ? 8 : 1,
                x: isSelected ? 4 : 2,
                y: isSelected ? 4 : 2
            )
    }
    
}

#Preview {
    BTNCheckMark()
}
