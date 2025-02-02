//
//  InformationDetailView.swift
//  KOFFII 3.0
//
//  Created by Gül, Ümit on 25.04.21.
//

import SwiftUI

struct MethodDetailView: View {
    
    var info: Information
    var complain = complainData
    
    @State private var isBitterPressed = false
    @State private var isSourPressed = false
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                AsyncImage(url: info.imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Image(systemName: "photo")
                }
                //                info.image
                //                    .resizable()
                //                    .frame(height: geo.size.height*0.35, alignment: .center)
                VStack(alignment: .leading) {
                    InformationDetailHeader(info: info)
                        .padding(.bottom)
                    Divider()
                    Text(info.title)
                        .bold()
                        .font(.system(.title, design: .default))
                    Text("Zubereitung")
                        .foregroundColor(Color(.secondaryLabel))
                        .font(.system(.body, design: .default))
                    ForEach(info.steps, id: \.self) { step in
                        HStack {
                            Label(
                                title: { Text(step) },
                                icon: { Image(systemName: "diamond") })
                            Spacer()
                        }
                    }
                    .padding(.top, 8)
                    .padding([.vertical, .bottom], 4)
                }
                .padding([.horizontal,.top])
            }
            .background(Color("Olive1"))
            .navigationBarTitle("", displayMode: .inline)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button(action: { isBitterPressed.toggle() }) {
                        Text(info.isEspresso ? complain[2].title : complain[0].title)
                    }
                    Spacer()
                    Button(action: { isSourPressed.toggle() }) {
                        Text(info.isEspresso ? complain[3].title : complain[1].title)
                    }
                }
            }
            .sheet(isPresented: $isBitterPressed) {
                ComplainView(complain: info.isEspresso ? complain[2] : complain[0])
            }
            .sheet(isPresented: $isSourPressed) {
                ComplainView(complain: info.isEspresso ? complain[3] : complain[1])
            }
        }
    }
}

struct InformationDetailHeader: View {
    
    var info: Information
    
    var body: some View {
        HStack {
            Label(
                title: { Text("\(info.quan ?? "")") },
                icon: { Image(systemName: "square.stack.3d.up") })
            Spacer()
            Label(
                title: { Text("\(info.time ?? "")") },
                icon: { Image(systemName: "timer") })
            Spacer()
            Label(
                title: { Text("\(info.temp ?? "")") },
                icon: { Image(systemName: "thermometer") })
        }
    }
}
