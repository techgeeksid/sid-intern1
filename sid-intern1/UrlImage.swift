//
//  UrlImage.swift
//  UrlImage
//
//  Created by externalOS on 27/09/19.
//  Copyright © 2019 siddhartha. All rights reserved.
//

import SwiftUI

struct UrlImage: View {
        let url: String
        
        @ObservedObject private var imageDownloader = ImageDownloader()
        
        init(url: String) {
            self.url = url
            self.imageDownloader.downloadImage(url: self.url)
        }
        
        var body: some View {
            if let imageData = self.imageDownloader.downloadedData {
                print(imageData)
                if let img = UIImage(data: imageData){
                    print(img)
                    return VStack {
                        Image(uiImage: img)
                            .resizable()
                    }
                }else{
                    return VStack{
                        Image(systemName: "circle")
                    }
                }
                
            } else {
                return VStack {
                    Image(systemName: "photo")
                }
            }
            
        }
    }

struct UrlImage_Previews: PreviewProvider {
    static var previews: some View {
        UrlImage(url:"https://www.apple.com/v/home/ep/images/promos/tv-plus-helpsters/tile__cauwwcyyn9hy_medium.jpg")
    }
}
