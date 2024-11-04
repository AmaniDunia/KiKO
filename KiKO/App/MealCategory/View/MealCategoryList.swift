//
//  MealCategoryList.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 04.11.24.
//

import SwiftUI

struct MealCategoryList: View {
    var body: some View {
        VStack(alignment: .center) {
            List(1..<3) { i in
                MealCategoryRow(category: .example01)
                    .frame(height: 64)
                    
            }
            .listStyle(.plain)
        }
        
    }
}

#Preview {
    MealCategoryList()
}
