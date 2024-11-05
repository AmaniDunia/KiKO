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
class MealCategoryRepo {
    // MARK: -- SHARED --
    /// ....
    
    // MARK: - SHARED PROPERTIES -
    /// ...
    
    // MARK: - static
    /// to Assign it from every where
    static let shared = MealCategoryRepo()
    
    // MARK: - SwiftData Properties
    ///
    var mealCategories: [MealCategoryByCoda] = []
    var categories: [MealCategory] = []
    // MARK: - Error Alert
    ///
    var errorForAlert: ErrorForAlert?
    
    // MARK: -- PRIVATE --
    /// ...
    
    // MARK: - private init
    /// ...
    private init() {
        getCategoriesCoda()
    }
    
    // MARK: - PRIVATE METHODS -
    /// ...
    
    // MARK: - GET MealCategoriesDTO
    /// ...
    private func getCategoriesCoda() {
        print("started fetching meal categories")
        /// Get Data From the API
        guard let apiRequest = apiRequest(
            apiKey: getEnvoirmentKey(envCodaAPIKey),
            docID: getEnvoirmentKey(envDocID),
            tableID: getEnvoirmentKey(envIngredientCategoryTableID)
        ) else { return }
        
        URLSession.shared.dataTaskPublisher(for: apiRequest)
            .map { $0.data }
            .decode(type: MealCategoryApiResponse.self, decoder: JSONDecoder())
            .map { $0.items }
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.errorForAlert = .init(title: .badResponse, message: error.localizedDescription)
                }
            }, receiveValue: { [unowned self] (mealCategory) in
                mealCategories.append(contentsOf: mealCategory)
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
    // TODO: ServiceAPI class
    
    // MARK: - GET Envoirment
    /// A method that gives back an EnvoirmentKey and Crash the App if their is No
    /// Use Case ist only for the first init 2 Check if the Envoirment Properties work.
    /// If Envoirment Keys do not work the App should not work
    private func getEnvoirmentKey(_ key: String) -> String {
        guard let envKey = ProcessInfo.processInfo.environment[key] else {
            print("\(key) could not be found not set")
            return ""
        }
        return envKey
    }
    
    // MARK: - PRIVATE PROPERTIES -
    /// ...
    
    // MARK: - Envoirment Key Properties
    // TODO: ServiceAPI class
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
}


