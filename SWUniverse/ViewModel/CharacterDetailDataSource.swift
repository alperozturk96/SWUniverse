//
//  CharacterDetailDataSource.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 12.02.2022.
//

import Combine

final class CharacterDetailDataSource {
    var cancellables: Set<AnyCancellable>
    
    internal init(cancellables: Set<AnyCancellable>) {
        self.cancellables = cancellables
    }
    
    func getSharships(_ publisher: AnyPublisher<Starships, Error> , onSuccess: @escaping (_ starships:Starships)->()){
        publisher.sink(receiveCompletion: { result in
            switch result {
            case .finished: print("starships fetched")
            case .failure(let err): print("error catched at getSharships: \(err)")
            }
        }, receiveValue: { response in
            onSuccess(response)
        }).store(in: &cancellables)
    }
    
}
