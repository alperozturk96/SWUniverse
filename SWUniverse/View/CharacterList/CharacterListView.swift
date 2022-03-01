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
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                SearchView(debounceTime: 2) { text in
                    viewModel.searchCharacter(search: text)
                }

                CharactersView(viewModel.characterList, viewModel.untouchedCharacterList)
            }//VStack
            .hiddenNavigationBarStyle()
        }//NavigationView
        .modifier(Modifier())
        .environmentObject(viewModel.favorities)
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
