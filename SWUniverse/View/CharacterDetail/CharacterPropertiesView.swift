//
//  CharacterPropertiesView.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 27.02.2022.
//

import SwiftUI

struct CharacterPropertiesView: View {
    let properties: [String]
    
    init(_ properties: [String]){
        self.properties = properties
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        List(properties, id: \.self) { item in
            Text(item)
                .multilineTextAlignment(.leading)
        }
    }
}

struct CharacterPropertiesView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterPropertiesView(["Car: Lamborghini"])
    }
}
