//
//  SWApi.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 12.02.2022.
//

import Foundation
import Combine

enum API {
    static let resultWrapper = ResultWrapper()
    static let baseURL = URL(string: AppConst.baseUrl)!
    
}

extension API {
        
    static func searchCharacter(_ search:String) -> AnyPublisher<CharacterList, Error>? {
        if let url = URL(string: AppConst.baseUrl + "/people/?search=" + search)  {
            let request = URLRequest(url: url)
            return resultWrapper.run(request)
                .map(\.value)
                .eraseToAnyPublisher()
        }
        else
        {
            return nil
        }
    }
    
    static func getSharships(url:String) -> AnyPublisher<Starships, Error>? {
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            return resultWrapper.run(request)
                .map(\.value)
                .eraseToAnyPublisher()
        }
        else
        {
            return nil
        }
    }
    
    static func getCharacterList() -> AnyPublisher<CharacterList, Error>? {
        if let url = URL(string: AppConst.baseUrl + "/people") {
            let request = URLRequest(url: url)
            return resultWrapper.run(request)
                .map(\.value)
                .eraseToAnyPublisher()
        }
        else
        {
            return nil
        }
    }
}
