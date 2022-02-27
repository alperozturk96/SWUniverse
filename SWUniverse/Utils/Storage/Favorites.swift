//
//  StorageManager.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 12.02.2022.
//

/**
 This class responsible for storing favoriteCharacters.
 */

import Foundation

final class Favorites: ObservableObject {
    private var favorites: Set<String>
    private let saveKey = "favoriteCharacters"
    
    init() {
        let decoder = JSONDecoder()
        let data = UserDefaults.standard.value(forKey: saveKey) as? Data
        if let data = data{
            let favoriteCharacterList = try? decoder.decode(Set<String>.self, from: data)
            favorites = favoriteCharacterList ?? []
          
        }
        else
        {
            favorites = []
        }
    }
    
    func isCharacterFavorite(_ name:String) -> Bool {
        return favorites.contains(name)
    }
    
    func addFavoriteCharacter(_ name:String){
        objectWillChange.send()
        favorites.insert(name)
        saveFavoriteCharacters()
    }
    
    func deleteFavoriteCharacter(_ name:String){
        objectWillChange.send()
        favorites.remove(name)
        saveFavoriteCharacters()
    }
    
    func saveFavoriteCharacters(){
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(favorites) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
   
}
