//
//  ContentView.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 12.02.2022.
//

import SwiftUI
import Combine

struct CharacterListView: View {
    @StateObject private var viewModel = CharacterListViewModel()
    @StateObject private var favorites = Favorites()
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                CharacterListSearchView.init { text in
                    viewModel.searchCharacter(search: text)
                }
                
                CharactersView(viewModel.characterList, viewModel.untouchedCharacterList)
            }//VStack
            .hiddenNavigationBarStyle()
        }//NavigationView
        .modifier(Modifier())
        .environmentObject(favorites)
        .onAppear {
            viewModel.getCharacterList()
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}


fileprivate struct Modifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .preferredColorScheme(.dark)
            .navigationViewStyle(StackNavigationViewStyle())
            .accentColor( .white)
    }
}
