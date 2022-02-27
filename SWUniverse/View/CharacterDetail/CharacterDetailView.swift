//
//  CharacterDetailView.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 12.02.2022.
//
import SwiftUI

struct CharacterDetailView: View {
    var character:Character
    var characterList:[Character] // necassary for finding character imageUrl
    let imageFinder:CharacterImagePathFinder
    
    @StateObject var viewModel = CharacterDetailViewModel()
    @EnvironmentObject var favorites: Favorites
    
    init(_ character:Character, _ characterList:[Character]) {
        self.character = character
        self.characterList = characterList
        self.imageFinder = CharacterImagePathFinder.init(characterList)
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                VStack(alignment: .leading, spacing: 5) {
                    Text(character.name ?? "")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                  
                 
                    let url = imageFinder.findImageUrl(character.name)
                    AsyncImageView(url: url, width: UIScreen.width * 0.5, height: UIScreen.height * 0.35)
                    
                    let properties = viewModel.getCharacterProperties(character)
                    CharacterPropertiesView(properties)
                        .frame(width: UIScreen.width, height: UIScreen.height * 0.4, alignment: .center)
                      
                    CharacterStarshipView(viewModel.starships)
                } //: VSTACK
                .padding(.horizontal, 20)
                .padding(.top, 100)
                .frame(maxWidth: 640, alignment: .center)
            } //: VSTACK
        } //: SCROLL
        .preferredColorScheme(.dark)
        .edgesIgnoringSafeArea(.top)
        .toolbar {
            Button(action: {self.changeCharacterStatus()}) {
                if favorites.isCharacterFavorite(character.name ?? "") {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }
                else
                {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.white)
                }
            }
        }
        .onAppear {
            if let starships = character.starships {
                viewModel.getStarshipList(urls: starships)
            }
        }
    }
    
    func changeCharacterStatus(){
        if let name = character.name {
            if favorites.isCharacterFavorite(name) {
                favorites.deleteFavoriteCharacter(name)
            }
            else
            {
                favorites.addFavoriteCharacter(name)
            }
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CharacterDetailView(CharacterPreviewData.desann, [Character]())
        }
        .environmentObject(Favorites())
    }
}