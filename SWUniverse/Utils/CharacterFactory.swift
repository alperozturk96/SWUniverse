//
//  CharacterFactory.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 13.02.2022.
//

/**
 SWApi doesnt give us image url in response. This class responsible for making character.
 */

final class CharacterFactory {
    private var characterList:CharacterList
    
    init(_ characterList:CharacterList){
        self.characterList = characterList
    }
    
    func createCharacterList() -> [Character]{
       if var results = characterList.results {
           for i in 0..<results.count {
               //Adding character imageUrl manually
               results[i].imageUrl = "https://starwars-visualguide.com/assets/img/characters/\(i + 1).jpg"
           }
           
           return results
       }
        
       return [Character]()
   }
    
}
