//
//  CharactersView.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 27.02.2022.
//

import SwiftUI

struct CharactersView: View {
    let characterList:[Character]?
    let untouchedCharacterList:[Character]
    
    init(_ characterList:[Character]?, _ untouchedCharacterList:[Character]){
        self.characterList = characterList
        self.untouchedCharacterList = untouchedCharacterList
    }

    /**
     You can use ForEach inside List to have both dynamic and static content – a very powerful feature of SwiftUI.
     */
    var body: some View {
        if let characterList = characterList {
            List(characterList) { item in
                let destination = CharacterDetailView(item, untouchedCharacterList)
                NavigationLink(destination: destination)
                {
                    CharacterListContentView(character: item)
                }
            }// List
        }
        else
        {
            TextShimmer(text: "No Result", fontSize: 40, multiColors: false)
            Spacer()
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView(nil, [Character]())
    }
}
