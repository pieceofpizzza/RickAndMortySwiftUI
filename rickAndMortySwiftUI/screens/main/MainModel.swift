//
//  MainModel.swift
//  rickAndMortySwiftUI
//
//  Created by Дарина Лисанова on 07.07.2023.
//

import SwiftUI

enum Main {
    struct Post: Decodable {
        let id: Int
        let name: String
        let status: String
        let species: String
        let type: String
        let gender: String
        let origin: Origin
        let location: Location
        let image: String
        let episode: [String]
        let url: String
        let created: String
    }
    
    struct DataToShow {
        var image: Image?
        let name: String
        let status: String
        let species: String
        let type: String
        let gender: String
        let origin: String
        let originData: Origin
        init (post: Post) {
            self.image = nil
            self.name = post.name
            self.status = "Status: \(post.status)"
            self.species = "Species: \(post.species)"
            self.type = "Type: \(post.type.isEmpty ? "none" : post.type)"
            self.gender = "Gender: \(post.gender)"
            self.origin = "Origin: \(post.origin.name)"
            self.originData = post.origin
        }
        
        mutating func set(image: Image){
            self.image = image
        }
    }

    struct Origin: Decodable {
        let name: String
        let url: String
    }

    struct Location: Decodable {
        let name: String
        let url: String
    }

    struct EarthPost: Decodable {
        let id: Int
        let name: String
        let type: String
        let dimension: String
        let residents: [String]
    }

}
