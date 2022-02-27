//
//  CharacterImagePathFinder.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 13.02.2022.
//

/**
 We can use below method in viewModel but its against princible of MVVM architecture. It also breaking SingleReponsibility.
 Maybe one step further of this app we are going to use CoreData and save response to local storage. It means that class
 open for extensions, we can add new features in here or refactor for our needs. If we use this method in viewModel any extra need would make the viewModel class worse off and it reduce modularity.
 */

final class CharacterImagePathFinder {
    private var characterList:[Character]
    
    init(_ characterList:[Character]){
        self.characterList = characterList
    }
    
    func findImageUrl(_ name:String?) -> String {
        if let name = name {
            for character in characterList {
                if character.name == name {
                    return character.imageUrl ?? ""
                }
            }
        }
        
        return ""
    }
}
