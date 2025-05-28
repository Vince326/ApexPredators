//
//  PredatorDetail.swift
//  ApexPredators
//
//  Created by Vincent Hunter on 5/27/25.
//

import SwiftUI

struct PredatorDetail: View {
    let predator: ApexPredator
    var body: some View {
        GeometryReader {geo in
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    //Background Image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                    
                    //Dinosaur Image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width / 1.5, height: geo.size.height / 3.7)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 20)
                }
               
                
                VStack(alignment: .leading)
                {
                    //Dino Name
                    Text(predator.name)
                        .font(.largeTitle)
                        
                    
                    
                    //Dino current location
                    
                    //Dino Movie Appearances
                    Text("Appears In: ")
                        .font(.title3)
                    
                    ForEach(predator.movies, id: \.self) {movie in
                        Text("•" + movie)
                            .font(.subheadline)
                        
                    }
                    
                    //Movie Moments
                    Text("Movie Moments: ")
                        .font(.title)
                        .padding(.top, 15)
                    
                    ForEach(predator.movieScenes) {scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding(.vertical, 1)
                        
                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)
                    }
                    
                    //Link to the webpage
                    Text("Read More: ")
                        .font(.caption)
                    Link(predator.link, destination: URL(string: predator.link)!)
                    
                }
                .padding()
                .frame(width:geo.size.width, alignment: .leading)
                
                
                
                
                
            }
        }
        .ignoresSafeArea()
        
    }
        
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[2])
//        .preferredColorScheme(.dark)
    
}
