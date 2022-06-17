//
//  CafeDetailView.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 23.09.20.
//

import SwiftUI
import MapKit

struct CoffeeDetailView: View {
    
    var model: NewCoffeeModel
    @Environment(\.dismiss) var dismiss
    
    @State var regionVM = RegionStore.shared.region
    
    @State private var trackingMode = MapUserTrackingMode.follow
    
    let infoRandom = informationData.randomElement()!
    #if !APPCLIP
    @State private var isPresented = false
    #endif


    let locationStore = LocationStore.shared

    var location: CLLocation {
        CLLocation(latitude: model.coordinates.latitude, longitude: model.coordinates.longitude)
    }

    var distance: String {
        return self.locationStore.getDistanceAsString(cafeLocation: location)
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                ZStack(alignment: .topTrailing) {
                    Map(coordinateRegion: $regionVM, interactionModes: .all, showsUserLocation: true, userTrackingMode: $trackingMode, annotationItems: [model]) { item in
                        MapMarker(coordinate: item.coordinates)
                    }
                    .frame(height: geo.size.height*0.35, alignment: .center)
                    .allowsHitTesting(false)
                    Text("Entfernung: \(distance)")
                        .padding()
                        .background(Color("Olive1"))
                        .cornerRadius(16)
                        .padding(8)
                }
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading) {
//                            if model.isRoastery {
//                                Label("Rösterei", image: "beans")
//                            } else {
                        FeatureDisplayView(features: model.features)
//                            }
                        .padding(.bottom, 4)
                        .font(.system(.body, design: .default))
                        .foregroundColor(.secondary)
                        Text(model.name)
                            .bold()
                            .font(.system(.title, design: .default))
                        Text(model.hood.rawValue)
                            .foregroundColor(Color(.secondaryLabel))
                            .font(.system(.body, design: .default))
                        GoogleMapsButton(locationURL: model.locationURL)
                    }
                    // TODO: Roastery
                    if let imageURL = model.imageURL {
                        AsyncImage(url: imageURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(16)
                        } placeholder: {
                            EmptyView()
                        }
                        Spacer()
                    }
                }
                .padding([.horizontal, .bottom])
                .padding(.top, 8)
                if let note = model.note {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Ümit´s Notizen")
                            .font(.system(.title2, design: .default))
                            .bold()
                            .padding(.bottom, 4)
                        Text(note)
                    }
                    .padding(.bottom)
                    .padding(.horizontal, 12)
                }
                #if !APPCLIP
                VStack(alignment: .leading, spacing: 2) {
                    Text("Wusstest du schon..?")
                        .font(.system(.title2, design: .default))
                        .bold()
                        .padding(.bottom, 4)
                        .padding([.leading])
                    Button(action: { isPresented.toggle() }, label: {
                        InformationListItem(info: infoRandom)
                    })
                }
                .padding(.bottom)
                .sheet(isPresented: $isPresented) {
                    InformationDetailCoordinator(info: infoRandom)
                }
                #endif
            }
            .navigationBarTitle("", displayMode: .inline)
            .background(Color("Olive1"))
        }
    }
    
}
