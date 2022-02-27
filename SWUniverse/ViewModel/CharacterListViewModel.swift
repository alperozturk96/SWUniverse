//
//  PeopleListViewModel.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 12.02.2022.
//


/**
 ViewModel should only contains data for View. There shouldn't be api calls or logic in this class.
 */

import Combine
import SwiftUI

final class CharacterListViewModel: ObservableObject {
    
    @Published var characterList = [Character]()
    var untouchedCharacterList = [Character]()
    var dataSource = CharacterListDataSource(cancellables: Set<AnyCancellable>())
    
    func searchCharacter(search:String){
        if let publisher = API.searchCharacter(search) {
            dataSource.searchCharacter(publisher) { [weak self] response in
                self?.characterList = CharacterFactory.init(response).createCharacterList()
            }
        }
    }
    
    func getCharacterList(){
        if let publisher = API.getCharacterList() {
            dataSource.getPeopleList(publisher) { [weak self] response in
                self?.characterList = CharacterFactory.init(response).createCharacterList()
                self?.untouchedCharacterList = CharacterFactory.init(response).createCharacterList()
            }
        }
    }
}
