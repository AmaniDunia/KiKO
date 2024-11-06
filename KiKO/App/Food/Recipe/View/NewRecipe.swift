//
//  NewRecipe.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 06.11.24.
//

import SwiftUI
import PhotosUI

struct NewRecipe: View {
    var body: some View {
        VStack {
            Text(name)
                .font(.title)
                .fontWidth(.expanded)
            
            Form {
                /// **Name**
                /// **Details**
                /// **Image**
                Section {
                    TextField("Name des Gerichts", text: $name.animation() )
                    TextField("Details", text: $details)
                    PhotosPicker(
                        selection: $photo,
                        matching: .images
                    ) {
                        HStack {
                            Text(photo == nil ?
                                 "Hier klicken um ein Bild auszuwählen" :
                                    "Hier klicken um das Bild zu ändern"
                            )
                            
                            Spacer(minLength: 0)
                            
                            Image(systemName: "checkmark")
                                .foregroundColor(photo == nil ? .gray : .green)
                                .scaleEffect(photo == nil ? 0.5 : 1.5, anchor: .trailing)
                        }
                        .font(.subheadline)
                    }
                } header: {
                    Text("Name & Bild")
                }
                
                // MARK: - Details | Dauer | Mahlzeit | Saison
                Section {
                    Stepper(value: $level, in: 0...8) {
                        Text("Schwierigkeitsgrad")
                        HStack {
                            Text("\(Int(level)) von 8")
                            Image(systemName: "frying.pan.fill")
                                .foregroundColor(.red.opacity(level / 8))
                        }
                    }
                    
                    Stepper(value: $preparationTime, step: 5) {
                        Text("Vorbereitungszeit")
                        Text("\(preparationTime) minuten")
                    }
                    
                    Stepper(value: $durationTime, step: 5) {
                        Text("Zubereitungszeit")
                        Text("\(durationTime) minuten")
                    }
                    
                    Picker("Mahlzeit", selection: $meal) {
                        ForEach(Meal.allCases) { meal in
                            Text(meal.rawValue).tag(meal)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    Picker("Saison", selection: $season) {
                        ForEach(Season.allCases) { season in
                            Text(season.rawValue).tag(season)
                        }
                    }
                    .pickerStyle(.menu)
                    
                } header: {
                    Text("Details Zum Rezept")
                }
                
                Section {
                    NavigationLink {
                        MealCategoryList()
                    } label: {
                        HStack {
                            Text("\(mealCategoriesSelected.count)")
                            Text("Kategorien")
                        }
                    }
                    NavigationLink {
                        IngredientList(ingredientsSelected: $ingredientsSelected)
                    } label: {
                        HStack {
                            Text("\(ingredientsSelected.count)")
                            Text("Zutaten")
                        }
                    }
                } header: {
                    HStack {
                        Text("Kategorien & Zutaten")
                    }
                }
                
                Section {
                    TextField("Vorbereitung", text: $preparationSteps)
                        .frame(height: 160)
                    
                } header: {
                    HStack {
                        Text("Vorbereitung")
                        Spacer(minLength: 0)
                        Image(systemName: preparationSteps.isEmpty ? "rectangle.and.pencil.and.ellipsis" : "checkmark")
                            .foregroundStyle(preparationSteps.isEmpty ? .gray : .green)
                    }
                }
                
                Section {
                    TextField("Zubereitung", text: $cookingSteps)
                        .frame(height: 160)
                } header: {
                    Text("Zubereitung")
                    Spacer(minLength: 0)
                    Image(systemName: cookingSteps.isEmpty ? "rectangle.and.pencil.and.ellipsis" : "checkmark")
                        .foregroundStyle(cookingSteps.isEmpty ? .gray : .green)
                }
            }
        }
        .navigationTitle("Neues Rezept")
        .navigationBarTitleDisplayMode(.inline)
    }
    @State private var photo: PhotosPickerItem?
    
    @State private var name: String = ""
    @State private var details: String = ""
    
    @State private var selectedImage: Image?
    @State private var level: Double = 0
    @State private var preparationTime: Int = 0
    @State private var durationTime: Int = 0
    @State private var season: Season?
    @State private var meal: Meal?
    
    @State private var ingredientsSelected: [Ingredient] = []
    @State private var mealCategoriesSelected: [MealCategory] = []
    
    @State private var preparationSteps: String = ""
    @State private var cookingSteps: String = ""
}

#Preview {
    NavigationStack {
        NewRecipe()
    }
}
