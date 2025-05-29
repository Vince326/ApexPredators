//
//  PredatorDetail.swift
//  ApexPredators
//
//  Created by Vincent Hunter on 5/27/25.
//

import SwiftUI
import MapKit

struct PredatorDetail: View {
    let predator: ApexPredator
    
    @State var position: MapCameraPosition
    
    var body: some View {
        GeometryReader {geo in
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    //Background Image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            LinearGradient(stops: [
                                Gradient.Stop(color: .clear, location: 0.8),
                                                   Gradient.Stop(color: .black, location: 1),
                                
                            ], startPoint: .top, endPoint: .bottom)
                        }
                    
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
                    NavigationLink {
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                    } label: {
                        Map(position: $position) {
                            Annotation(predator.name, coordinate: predator.location) {
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.largeTitle)
                                    .imageScale(.large)
                                    .symbolEffect(.pulse)
                            }
                            .annotationTitles(.hidden)
                        }
                        
                        .frame(height: 125)
                        .clipShape(.rect(cornerRadius: 15))
                    }
                    
                    //Dino Movie Appearances
                    Text("Appears In: ")
                        .font(.title3)
                        .padding(.top)
                    
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
                        .font(.caption)
                        .foregroundStyle(.blue)
                    
                }
                .padding()
                .padding(.bottom)
                .frame(width:geo.size.width, alignment: .leading)
                
                
                
                
                
            }
        }
        .ignoresSafeArea()
        .toolbarBackground(.automatic)
        
    }
        
}

#Preview {
    
    let predator = Predators().apexPredators[2]
    
    PredatorDetail(predator: predator, position: .camera(
        MapCamera(
            centerCoordinate: predator.location, distance: 30000
        )))
        .preferredColorScheme(.dark)
    
}
