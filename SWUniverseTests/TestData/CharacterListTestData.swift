//
//  CharacterListTestData.swift
//  SWUniverseTests
//
//  Created by Alper Öztürk on 12.02.2022.
//

import Foundation
@testable import SWUniverse


struct CharacterListTestData {
    let desann = Character.init(name: "Desann",
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
    let tavion = Character.init(name: "Tavion",
                                           height: "164",
                                           mass: "200 Pound",
                                           hair_color: "Gray",
                                           skin_color: "Dark",
                                           eye_color: "Yellow",
                                           birth_year: "2003",
                                           gender: "Female",
                                           homeworld: nil,
                                           films: nil,
                                           species: nil,
                                           vehicles: nil,
                                           starships: ["Test343", "Test3"],
                                           url:"https://static.wikia.nocookie.net/starwars/images/2/21/Desann-temple.jpg/revision/latest/scale-to-width-down/450?cb=20060326092408")
    let kyle = Character.init(name: "Kyle",
                                           height: "174",
                                           mass: "200 Pound",
                                           hair_color: "White",
                                           skin_color: "White",
                                           eye_color: "Black",
                                           birth_year: "2003",
                                           gender: "Male",
                                           homeworld: nil,
                                           films: nil,
                                           species: nil,
                                           vehicles: nil,
                                           starships: ["Test1", "Test2"],
                                           url:"https://static.wikia.nocookie.net/starwars/images/2/21/Desann-temple.jpg/revision/latest/scale-to-width-down/450?cb=20060326092408")
    
    var testData:CharacterList {
        var data = CharacterList.init()
        data.results = [desann, tavion, kyle]
        return data
    }
   
}
