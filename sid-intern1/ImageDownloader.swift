//
//  ImageDownloader.swift
//  UrlImage
//
//  Created by externalOS on 27/09/19.
//  Copyright © 2019 siddhartha. All rights reserved.
//

import Foundation

class ImageDownloader: ObservableObject {

    @Published var downloadedData: Data? = nil
    
    func downloadImage(url: String) {
        
        print(url)
        
        guard let imageURL = URL(string: url) else {
            fatalError("ImageURL is incorrect")
        }
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageURL)
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }
    }
    
}
