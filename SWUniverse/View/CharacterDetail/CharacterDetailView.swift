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
            VStack(alignment: .leading, spacing: 5) {
                Text(character.name ?? "")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
                    .padding(.leading, 20)

                let url = imageFinder.findImageUrl(character.name)
                AsyncImageView(url: url, width: UIScreen.width * 0.5, height: UIScreen.height * 0.35)
                    .padding(.leading, 20)

                let properties = viewModel.getCharacterProperties(character)
                CharacterPropertiesView(properties)
                    .frame(width: UIScreen.width, height: UIScreen.height * 0.4, alignment: .center)

                CharacterStarshipView(viewModel.starships)
                    .frame(width: UIScreen.width, alignment: .center)
            } //: VStack
            .modifier(VStackModifier())
        } //: ScrollView
        .modifier(ScrollViewModifier())
        .toolbar {
            Button(action: {self.changeCharacterStatus()}) {
                let isFavorite = favorites.isFavorite(character.name ?? "")
                FavoriteView( isFavorite)
            }
        }
        .onAppear {
            guard let starships = character.starships else {
                return
            }

            viewModel.getStarshipList(urls: starships)
        }
    }
    
    private func changeCharacterStatus(){
        guard let name = character.name else { return }
        favorites.isFavorite(name) ? favorites.delete(name): favorites.add(name)
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


fileprivate struct VStackModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 20)
            .padding(.top, 100)
            .frame(maxWidth: UIScreen.width, alignment: .center)
    }
}

fileprivate struct ScrollViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .preferredColorScheme(.dark)
            .edgesIgnoringSafeArea(.top)
    }
}
