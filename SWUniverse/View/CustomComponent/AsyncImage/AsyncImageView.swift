//
//  AsyncImageView.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 12.02.2022.
//

import SwiftUI
import Combine

struct AsyncImageView: View {
    var url: String
    let width:CGFloat
    let height:CGFloat
  
    @StateObject var imageLoader = ImageLoaderService()
    @State var image: UIImage = UIImage()
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaledToFit()
        
            .onReceive(imageLoader.$image) { image in
                self.image = image
            }
            .frame(width: width, height: height, alignment: .center)
            .onAppear {
                imageLoader.loadImage(for: url)
            }
    }
    
}

final class ImageLoaderService: ObservableObject {
    @Published var image: UIImage = UIImage()
    
    func loadImage(for urlString: String) {
        print("ImageLoaderService loading from: ",urlString)
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
        task.resume()
    }
    
}
