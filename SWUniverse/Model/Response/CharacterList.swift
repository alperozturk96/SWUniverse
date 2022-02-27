//
//  People.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 12.02.2022.
//

import Foundation

struct CharacterList:Codable {
    var results:[Character]? = nil
}


struct Character:Codable, Identifiable {
    var id = UUID()
    var imageUrl:String? = nil
    var name:String? = nil
    var height:String? = nil
    var mass:String? = nil
    var hair_color:String? = nil
    var skin_color:String? = nil
    var eye_color:String? = nil
    var birth_year:String? = nil
    var gender:String? = nil
    var homeworld:String? = nil
    var films:[String]? = nil
    var species:[String]? = nil
    var vehicles:[String]? = nil
    var starships:[String]? = nil
    var url:String? = nil
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case height = "height"
        case mass = "mass"
        case hair_color = "hair_color"
        case skin_color = "skin_color"
        case eye_color = "eye_color"
        case birth_year = "birth_year"
        
        case gender = "gender"
        case homeworld = "homeworld"
        case films = "films"
        case species = "species"
        
        case starships = "starships"
        case vehicles = "vehicles"
        case url = "url"
    }
    
}


struct CharacterPreviewData {
    static let desann = Character.init(name: "Desann",
                                           height: "184",
                                           mass: "200 Pound",
                                           hair_color: "Brown",
                                           skin_color: "Brown",
                                           eye_color: "Black",
                                           birth_year: "2003",
                                           gender: "Male",
                                           homeworld: nil,
                                           films: nil,
                                           species: nil,
                                           vehicles: nil,
                                           starships: ["Brown 343", "Kawai19"],
                                           url:"https://static.wikia.nocookie.net/starwars/images/2/21/Desann-temple.jpg/revision/latest/scale-to-width-down/450?cb=20060326092408")
}
