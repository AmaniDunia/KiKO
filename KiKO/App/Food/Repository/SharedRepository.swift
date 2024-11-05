//
//  Repository.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 04.11.24.
//
import SwiftData
import Foundation
import Combine

@Observable
class SharedRepository {
    // MARK: - SHARED PROPERTIES -

    /// **static shared**
    /// to Assign it from every where
    static let shared = SharedRepository()
    
    /// **MealCategoriesByCoda**
    /// from the API
    var mealCategoriesFromCoda: [MealCategoryFromCoda] = []
    
    /// **IngredientsByCoda**
    /// from the API
    var ingredientsFromCoda: [IngredientFromCoda] = []
    
    // TODO: - MEALCATEGORY & INGREDIENT as SwiftData Model - ALERT Pipeline -
    /// **MealCategory**
    /// for SwiftData
    var mealCategories: [MealCategory] = []
    
    /// **MealCategory**
    /// for SwiftData
    var ingredients: [Ingredient] = []
    
    /// **Error Alert**
    ///
    var errorForAlert: ErrorForAlert?
    
    // MARK: -- PRIVATE --
    /// ...
    
    /// **private init**
    /// to hide what's going on inside
    private init() {
        getCategoriesCoda()
        getIngredientsFromCoda()
    }
    
    // TODO: Check all Envoirment Keys at Opening
    
    func getIngredients() {
        ingredientsFromCoda.forEach { ingredientFromCoda in
            let ingredient = Ingredient(ingredient: ingredientFromCoda.values)
            ingredients.append(ingredient)
            print(ingredient.name)
        }
    }
    
    /// **GET Ingredients**
    ///
    private func getIngredientsFromCoda() {
        print("started fetching ingredients")
        /// Get Data From the API
        guard let apiRequest = apiRequest(
            apiKey: apiKEY,
            docID: docID,
            tableID: tableIdIngredient
        ) else { return }
        
        // TODO: Make this a function
        /// **Combine Pipline**
        /// Use Combine Pipeline to send requested Data
        URLSession.shared
            .dataTaskPublisher(for: apiRequest)
            .map { $0.data }
            .decode(type: IngredientCodaResponse.self, decoder: JSONDecoder())
            .map { $0.items }
            .receive(on: RunLoop.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    self.errorForAlert = .init(title: .badResponse, message: error.localizedDescription)
                }
            } receiveValue: { [unowned self] (ingredients) in
                for ingredientFromCoda in ingredients {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self.ingredientsFromCoda
                            .append(ingredientFromCoda)
                    }
                }
            }
            .store(in: &cancellables)
    }
    
    /// **GET MealCategoriesDTO**
    ///
    private func getCategoriesCoda() {
        print("started fetching meal categories")
        /// Get Data From the API
        guard let apiRequest = apiRequest(
            apiKey: apiKEY,
            docID: docID,
            tableID: tableIdMealCategory
        ) else { return }
        
        /// **Combine Pipline**
        /// Use Combine Pipeline to send requested Data
        URLSession.shared
            .dataTaskPublisher(for: apiRequest)
            .map { $0.data }
            .decode(type: MealCategoryApiResponse.self, decoder: JSONDecoder())
            .map { $0.items }
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.errorForAlert = .init(title: .badResponse, message: error.localizedDescription)
                }
            }, receiveValue: { [unowned self] (mealCategory) in
                for category in mealCategory {
                    self.mealCategoriesFromCoda
                        .append(category)
                }
            })
            .store(in: &cancellables)
    }
    
    // MARK: - API Request
    /// Methode to make an **URLRequest** with **Bearer Token**
    ///
    /// apiKey
    /// -
    /// is used for Coda.io Authentification with Bearer
    ///
    /// **docID**
    /// -
    /// is used for Coda.io to get the right DOC
    ///
    /// **tableID**
    /// -
    /// is used for Coda to idenfy the table in the DOC
    ///
    /// [Get Coda 🤷](https://coda.partnerlinks.io/amaniduniaXcode)
    private func apiRequest(apiKey: String, docID: String, tableID: String) -> URLRequest? {
        guard let url = URL(string: "https://coda.io/apis/v1/docs/\(docID)/tables/\(tableID)/rows") else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        return request
    }
    
    // MARK: - GET EnvoirmentKey
    /// A method that gives back an EnvoirmentKey and Crash the App if their is No
    /// Use Case ist only for the first init 2 Check if the Envoirment Properties work.
    /// If Envoirment Keys do not work the App should not work
    private func getEnvoirmentKey(_ key: String) throws -> String {
        guard let envKey = ProcessInfo.processInfo.environment[key] else {
            throw NetworkError.environmentError
        }
        return envKey
    }
    
    // MARK: - PRIVATE PROPERTIES -
    
    /// **GET API Key**
    ///
    private var apiKEY: String { try! getEnvoirmentKey(envCodaAPIKey) }
    
    /// **GET DOC ID**
    ///
    private var docID: String { try! getEnvoirmentKey(envDocID) }
    
    /// **GET MealCategory TABLE ID**
    ///
    private var tableIdMealCategory: String { try! getEnvoirmentKey(envIngredientCategoryTableID) }
    
    /// **GET Ingredient TABLE ID**
    ///
    private var tableIdIngredient: String { try! getEnvoirmentKey(envIngredientTableID) }
    
    // MARK: - Envoirment Key Properties
    ///
    private let envCodaAPIKey = "CODA_API_KEY"
    private let envDocID = "DOC_ID"
    private let envIngredientCategoryTableID = "MEALCATEGORY_ID_TABLE"
    private let envIngredientTableID = "INGREDIENT_ID_TABLE"
    
    // MARK: - AnyCancellable
    /// use this to cancle the Combine Pipeline
    private var cancellables: Set<AnyCancellable> = []
}

struct ErrorForAlert: Error, Identifiable {
    let id = UUID()
    let title: NetworkError
    var message: NetworkError.RawValue
}

enum NetworkError: String, Error {
    case badTableID = "Bad Table ID"
    case badResponse = "Bad Response"
    case badStatusCode = "Bad Status Code"
    case environmentError = "Environment Key Error"
}


