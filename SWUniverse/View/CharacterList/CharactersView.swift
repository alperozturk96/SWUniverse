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
    
    var body: some View {
        if let characterList = characterList {
            List {
              ForEach(characterList) { item in
                  NavigationLink(destination:CharacterDetailView(item, untouchedCharacterList))
                  {
                      CharacterListContentView(character: item)
                  }
              }
            }
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
