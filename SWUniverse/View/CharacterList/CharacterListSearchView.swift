//
//  CharacterListSearchView.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 27.02.2022.
//

import SwiftUI
import Combine

struct CharacterListSearchView: View {
    @State private var searchText = ""
    var searchResult: (String) -> ()
    
    var body: some View {
        TextField("Search", text: $searchText)
            .foregroundColor(Color.white)
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .onChange(of: Just(searchText), perform: { text in
                searchResult(text.output)
            })
            .modifier(Modifier())
        
    }
}

struct CharacterListSearchView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListSearchView(searchResult: {_ in })
    }
}


fileprivate struct Modifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.white)
            .padding(.horizontal, 20)
            .padding(.top, 20)
    }
}


