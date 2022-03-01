//
//  SearchView.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 1.03.2022.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchBarViewModel()

    var debounceTime:Int
    var searchResult: (String) -> ()

    var body: some View {
        ZStack {
            TextField("Search", text: $viewModel.text)
                .onReceive(
                    viewModel.$text
                        .debounce(for: .seconds(debounceTime), scheduler: DispatchQueue.main)
                ) {
                    searchResult($0)
                }
                .modifier(Modifier())
                .foregroundColor(Color.white)
                .disableAutocorrection(true)
                .autocapitalization(.none)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(debounceTime: 2, searchResult: {_ in })
    }
}


fileprivate struct Modifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.white)
            .padding(.horizontal, 20)
            .padding(.top, 20)
    }
}
