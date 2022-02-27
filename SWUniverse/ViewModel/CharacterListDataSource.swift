//
//  PeopleListDataSource.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 12.02.2022.
//

/**
 DataSource responsible for fetching data from service or storage. Its bridge between viewModel and Data.
 */

import Combine

final class CharacterListDataSource {
    var cancellables: Set<AnyCancellable>
    
    internal init(cancellables: Set<AnyCancellable>) {
        self.cancellables = cancellables
    }
    
    func getPeopleList(_ publisher: AnyPublisher<CharacterList, Error> , onSuccess: @escaping (_ people:CharacterList)->()){
        publisher.sink(receiveCompletion: { result in
            switch result {
            case .finished: print("characters fetched")
            case .failure(let err): print("error catched at getPeopleList: \(err)")
            }
        }, receiveValue: { response in
            onSuccess(response)
        }).store(in: &cancellables)
    }
    
    
    func searchCharacter(_ publisher: AnyPublisher<CharacterList, Error>, onSuccess: @escaping (_ people:CharacterList)->()){
        publisher.sink(receiveCompletion: { result in
            switch result {
            case .finished: print("characters fetched")
            case .failure(let err): print("error catched at searchCharacter: \(err)")
            }
        }, receiveValue: { response in
            onSuccess(response)
        }).store(in: &cancellables)
    }
    
}
