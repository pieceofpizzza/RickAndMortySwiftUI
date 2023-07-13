//
//  ModalModel.swift
//  rickAndMortySwiftUI
//
//  Created by Дарина Лисанова on 07.07.2023.
//

import Foundation
enum Modal {
    struct DataToShow {
        let name: String
        init (origin: Main.Origin) {
            self.name = origin.name
        }
        
    }
    
    struct Earth: Decodable {
        let id: Int
        let name: String
        let type: String
        let dimension: String
        let residents: [String]
        let url: String
        let created: Date
    }
}
