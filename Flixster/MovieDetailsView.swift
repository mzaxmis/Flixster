//
// MovieDetailsView.swift
// Flixster
//
// Created by Misbah M on 3/13/23.
//

import SwiftUI
import AlamofireImage

struct MovieDetailsView: View {
    let movie: [String:Any]
    
    var body: some View {
        VStack {
            Image(uiImage: posterImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(movie["title"] as? String ?? "")
                .font(.title)
            Text(movie["overview"] as? String ?? "")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
    
    func posterImage() -> UIImage {
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterPath)!
        let posterImage = UIImage.af.image(withURL: posterURL)!
        return posterImage
    }
}
