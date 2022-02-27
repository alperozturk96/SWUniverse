//
//  CharacterStarshipView.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 27.02.2022.
//

import SwiftUI

struct CharacterStarshipView: View {
    var starships:[Starships]
    
    init(_ starships:[Starships]){
        self.starships = starships
    }
    
    var body: some View {
        GroupBox() {
            DisclosureGroup("Starships") {
                ForEach(starships) { item in
                    Divider().padding(.vertical, 2)
                    
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(item.name ?? "")
                        }
                        .foregroundColor(.white)
                        .font(Font.system(.body).bold())
                        
                        Spacer(minLength: 25)
                        
                        Text(item.model ?? "")
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
        .padding(.horizontal, 15)
    }
}

struct CharacterStarshipView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterStarshipView([Starships]())
    }
}
