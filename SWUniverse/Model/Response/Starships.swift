//
//  StarShips.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 12.02.2022.
//

import Foundation

struct Starships:Codable, Identifiable{
    var id = UUID()
    var name:String? = nil
    var model:String? = nil
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case model = "model"
    }
}
