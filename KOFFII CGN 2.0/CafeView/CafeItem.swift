//
//  CoffeeItem.swift
//  KOFFII CGN 2.0
//
//  Created by Ümit Gül on 21.09.20.
//

import SwiftUI

struct CafeItem: View {
    
    var cafe: Cafe
    var height: CGFloat
    
    @EnvironmentObject var store: LocationStore
    
    var body: some View {
        VStack {
            Image(cafe.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .cornerRadius(16)
            HStack {
                VStack(alignment: .leading) {
                    Text(cafe.name)
                        .lineLimit(1)
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(.primary)
                    Text(cafe.hood.rawValue)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.primary).opacity(0.8)
                    Text(store.getDistanceAsString(cafeLocation: cafe.location))
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.primary).opacity(0.8)
                }
                Spacer()
            }
            FeatureDisplayView(cafe: cafe)
        }
        .frame(height: height)
    }
}


struct CoffeeItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CafeItem(cafe: cafeData[5],height: 400)
                .preferredColorScheme(.dark)
        }
    }
}

struct FeatureDisplayView: View {
    
    var cafe: Cafe
    
    var body: some View {
        HStack {
            Image(systemName: "wifi")
                .foregroundColor(cafe.hasWifi ? .primary : Color(.tertiaryLabel).opacity(0.8))
            Spacer()
            Image("FOOD")
                .foregroundColor(cafe.hasFood ? .primary : Color(.tertiaryLabel).opacity(0.8))
            Spacer()
            Image(systemName: "leaf")
                .foregroundColor(cafe.hasVegan ? .primary : Color(.tertiaryLabel).opacity(0.8))
            Spacer()
            Image(systemName: "bolt")
                .foregroundColor(cafe.hasPlug ? .primary : Color(.tertiaryLabel).opacity(0.8))
        }
        .padding(.horizontal)
    }
}
