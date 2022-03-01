//
//  SearchViewModel.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 1.03.2022.
//

import Combine

class SearchBarViewModel: ObservableObject {
    @Published var text: String = ""
}
