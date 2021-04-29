//
//  TabBar.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 22.09.20.
//

import SwiftUI

struct TabBar: View {
    
    var body: some View {
        TabView {
            NavigationView {
                DiscoveryView(cafe1: DiscoveryCafeViewModel(cafe: topThreeOfTheMonth[0]), cafe2: DiscoveryCafeViewModel(cafe: topThreeOfTheMonth[1]), cafe3: DiscoveryCafeViewModel(cafe: topThreeOfTheMonth[2]))
            }
            .tabItem {
                Label("Entdecken", systemImage: "heart.text.square")
            }
            NavigationView {
                CoffeeView()
            }
            .tabItem {
                Label("Liste", systemImage: "list.dash")
            }
            
            NavigationView {
                AllCafesMapView()
            }
            .tabItem {
                Label("Karte", systemImage: "map")
            }
            
            NavigationView {
                InformationView()
            }
            .tabItem {
                Label("Zubereitung", systemImage: "book")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .preferredColorScheme(.dark)
    }
}
