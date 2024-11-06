//
//  IngredientSample.swift
//  KiKO
//
//  Created by Joscha Amani Gaber on 06.11.24.
//

import Foundation

extension Ingredient {
    static var sample: Ingredient {
        Ingredient(
            id: UUID().uuidString,
            name: "Kichererbse",
            details: "Kichererbsen gehören zur Familie der Hülsenfrüchte, sind aber trotz des Namens mit der Erbse nicht näher verwandt. \n \nSie ist ein guter Lieferant für Eiweiß und vielseitig einsetzbar in Aufstrichen, Suppen und bunten Pfannen. \n \nKichererbsen sollten immer gut durchgegart und nicht roh verzehrt werden.",
            image: "mango",
            isLocal: false,
            season: "Winter",
            family: "Hülsenfrüchte"
        )
    }
}
    

