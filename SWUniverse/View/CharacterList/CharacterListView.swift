//
//  ContentView.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 12.02.2022.
//

import SwiftUI
import Combine

struct CharacterListView: View {
    @State private var searchText = ""
    @StateObject private var viewModel = CharacterListViewModel()
    @StateObject private var favorites = Favorites()
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                HStack{
                    TextField("Search", text: $searchText)
                        .foregroundColor(Color.white)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .onChange(of: Just(searchText), perform: { text in
                            viewModel.searchCharacter(search: searchText)
                        })
                  
                    .foregroundColor(Color.white)
                }//HStack
                .padding(20)
                
                if let characterList = viewModel.characterList{
                    List {
                      ForEach(characterList) { item in
                          NavigationLink(destination:CharacterDetailView(item, viewModel.untouchedCharacterList))
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
            }//VStack
            .hiddenNavigationBarStyle()
        }//NavigationView
        .environmentObject(favorites)
        .preferredColorScheme(.dark)
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor( .white)
        .onAppear {
            viewModel.getCharacterList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
