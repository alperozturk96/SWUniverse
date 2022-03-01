//
//  CharacterDetailViewModel.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 12.02.2022.
//

import Combine

final class CharacterDetailViewModel: ObservableObject {

    @Published var starships = [Starships]()
    var dataSource = CharacterDetailDataSource(cancellables: Set<AnyCancellable>())
    
    func getStarshipList(urls:[String]){
        for url in urls {
            if let publisher = API.getSharships(url: url) {
                dataSource.getSharships(publisher) { [weak self] response in
                    self?.starships.append(response)
                }
            }
        }
    }
    
    func getCharacterProperties(_ character:Character) -> [String] {
        var properties = [String]()
        
        if var birthDate = character.birth_year {
            birthDate = "Birth Date: " + birthDate
            properties.append(birthDate)
        }
        
        if var height = character.height {
            height = "Height: " + height
            properties.append(height)
        }
        
        if var mass = character.mass {
            mass = "Mass: " + mass
            properties.append(mass)
        }
        
        if var hairColor = character.hair_color {
            hairColor = "Hair Color: " + hairColor
            properties.append(hairColor)
        }
        
        if var skinColor = character.skin_color {
            skinColor = "Skin Color: " + skinColor
            properties.append(skinColor)
        }
        
        
        return properties
    }
    
}
