//
//  Top3View.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 26.09.20.
//

import SwiftUI

struct DiscoveryView: View {
    
    var cafe1: DiscoveryCafeViewModel
    var cafe2: DiscoveryCafeViewModel
    var cafe3: DiscoveryCafeViewModel
    
    @EnvironmentObject var weatherStore: WeatherStore

    var body: some View {
        ScrollView {
            NavigationLink(
                destination: CoffeeDetailView(coffee: cafe1.cafe)) {
                DiscoverItem(cafe: cafe1)
            }
            .padding(.vertical)
            NavigationLink(
                destination: InformationDetailCoordinator(info: informationData[2]),
                label: {
                    InformationListItem(info: informationData[2])
                        .padding(.bottom)
                })
                .padding(.bottom)
            NavigationLink(
                destination: CoffeeDetailView(coffee: roasteryData[0])) {
                CoffeeListItem(coffee: roasteryData[0])
            }
            .padding(.bottom)
            NavigationLink(
                destination: CoffeeDetailView(coffee: cafe2.cafe)) {
                DiscoverItem(cafe: cafe2)
            }
            .padding(.bottom)
            NavigationLink(
                destination: CoffeeDetailView(coffee: cafe3.cafe)) {
                DiscoverItem(cafe: cafe3)
            }
            .padding(.bottom)
            .navigationTitle("Empfehlungen")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if #available(iOS 14.5, *) {
                        Label(weatherStore.model.temperatureString,
                              systemImage: weatherStore.model.conditionName)    .labelStyle(TitleAndIconLabelStyle())
                    } else {
                        Label(weatherStore.model.temperatureString,
                              systemImage: weatherStore.model.conditionName)
                    }

                }
            }
        }
    }
}
