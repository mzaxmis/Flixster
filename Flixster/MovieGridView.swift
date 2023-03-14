//
// MovieGridView.swift
// Flixster
//
// Created by Misbah M on 3/13/23.
//

import SwiftUI
import AlamofireImage

struct MovieGridView: View {
    @State var movies = [[String:Any]]()
    
    var body: some View {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        
        let width = (UIScreen.main.bounds.width - layout.minimumInteritemSpacing * 2) / 3
        layout.itemSize = CGSize(width: width, height: width * 3/2)
        
        return NavigationView {
            List {
                ForEach(movies.indices, id: \.self) { index in
                    NavigationLink(destination: MovieDetailView(movie: movies[index])) {
                        MovieGridCell(posterURL: URL(string: "https://image.tmdb.org/t/p/w185" + movies[index]["poster_path"] as! String)!)
                    }
                }
            }
            .onAppear(perform: loadData)
            .navigationTitle("Similar Movies")
        }
    }
    
    func loadData() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US&page=1")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    let response = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    let results = response["results"] as! [[String: Any]]
                    
                    DispatchQueue.main.async {
                        self.movies = results
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}

struct MovieGridCell: View {
    let posterURL: URL
    
    var body: some View {
        VStack {
            AsyncImage(url: posterURL, placeholder: { ProgressView() })
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width / 3 - 6, height: (UIScreen.main.bounds.width / 3 - 6) * 3/2)
                .cornerRadius(10)
        }
    }
}

struct MovieDetailView: View {
    let movie: [String:Any]
    
    var body: some View {
        Text(movie["title"] as? String ?? "N/A")
            .navigationTitle(movie["title"] as? String ?? "N/A")
    }
}
