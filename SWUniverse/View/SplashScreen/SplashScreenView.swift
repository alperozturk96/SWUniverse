//
//  SplashScreenView.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 12.02.2022.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isActive:Bool = false
    
    var body: some View {
        VStack
        {
            if isActive {
                CharacterListView()
            }
            else
            {
                TextShimmer(text: "Hire Me :)", fontSize: 75, multiColors: true)
                    .preferredColorScheme(.dark)
                    .hiddenNavigationBarStyle()
            }
        }//VStack
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    isActive = true
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
