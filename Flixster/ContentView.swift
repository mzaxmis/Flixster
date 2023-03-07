//
//  ContentView.swift
//  Flixster
//
//  Created by Misbah M on 3/7/23.
//

import SwiftUI

struct ContentView: View {
    
    private let movieList: [MovieItem] = [
        MovieItem(
            movie: "🪵",
            name: "Knock at the Cabin",
            description: "While vacationing at a remote cabin, a young girl and her two fathers are taken hostage by four armed strangers who demand that the family make an unthinkable choice to avert the apocalypse. With limited access to the outside world, the family must decide what they believe before all is lost."),
        MovieItem(
            movie: "🐆",
            name: "Black Panther: Wakanda Forever",
            description: "Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death.  As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda."),
        MovieItem(
            movie: "😸",
            name: "Puss in Boots: The Last Wish",
            description: "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives."),
        MovieItem(
            movie: "✈️",
            name: "Plane",
            description: "After a heroic job of successfully landing his storm-damaged aircraft in a war zone, a fearless pilot finds himself between the agendas of multiple militias planning to take the plane and its passengers hostage."),
        MovieItem(
            movie: "👧",
            name: "Little Dixie",
            description: "Erstwhile Special Forces operative Doc Alexander is asked to broker a truce with the Mexican drug cartel in secrecy. When Oklahoma Governor Richard Jeffs celebrates the execution of a high-ranking cartel member on TV, his Chief of Staff and Doc inform him about the peace he just ended. But it’s too late, as Cuco, the cartel’s hatchet man, has set his vengeful sights on Doc’s daughter Dixie."),
    ]
    
    var body: some View {
        NavigationView {
            List(movieList) { movieItem in
                NavigationLink(destination: DetailsView(movieItem: movieItem)) {
                    HStack {
                        MovieCircleView(movieItem: movieItem)
                        Text(movieItem.name)
                            .font(.headline)
                    }.padding(7)
                }
            }
            .navigationBarTitle("Movies")
        }
    }
}
    struct DetailsView: View{
        let movieItem: MovieItem
        
        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    MovieCircleView(movieItem: movieItem)
                        .padding(.trailing, 5)
                    
                    Text(movieItem.name)
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                }
                Text(movieItem.description)
                    .padding(.top)
                
                Spacer()
            }
                .padding()
                .navigationBarTitle(Text(movieItem.name), displayMode: .inline)
            }
        }
    
    struct MovieCircleView: View {
        let movieItem: MovieItem
        
        var body: some View {
            ZStack {
                Text(movieItem.movie)
                    .shadow(radius:3)
                    .font(.largeTitle)
                    .frame(width: 65, height: 65)
                    .overlay(
                        Circle().stroke(Color.purple, lineWidth: 3)
                    )
                    }
        }
    }
        
struct MovieItem: Identifiable {
    let id = UUID()
    let movie: String
    let name: String
    let description: String
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
    
