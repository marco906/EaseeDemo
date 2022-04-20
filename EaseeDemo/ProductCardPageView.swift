//
//  ProductCardPageView.swift
//  EaseeDemo
//
//  Created by Marco Wenzel on 20.04.22.
//

import SwiftUI

struct ProductCardPageView: View {
    @State var location: ChargeLocation
    @State var currentRobot = 0
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                headerView
                
                TabView(selection: $currentRobot) {
                    ForEach(location.robots) { robot in
                        ProductCardView(robot: robot)
                            .tag(location.robots.firstIndex(where: { $0.id == robot.id }) ?? 0)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .frame(height: 520)
                .background(.red)
                
                optionButtons
                    .padding(.horizontal)
            }
        }
        .background(Color(uiColor: .systemGroupedBackground))
        .cornerRadius(32)
    }
    
    var headerView: some View {
        HStack {
            HStack{
            Image(systemName: "wifi")
            Text("WiFi")
                .font(.subheadline)
            }
            .frame(width: 80, alignment: .leading)
            Spacer()
            Text("\(currentRobot + 1)/\(location.robots.count)")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Spacer()
            Image(systemName: "info.circle")
                .frame(width: 80, alignment: .trailing)
        }
        .font(.title3)
        .padding(.vertical, 8)
        .padding(.top)
        .padding(.horizontal)
    }
    
    @ViewBuilder var optionButtons: some View {
        NavigationLink{
            Text("Power options")
        } label: {
            NavButton(title: "Power options")
        }
        .padding(.top)
        
        NavigationLink{
            Text("Charger settings")
        } label: {
            NavButton(title: "Charger settings")
        }
    }
}

struct ProductCardPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        ProductCardPageView(location: .preview)
        }
    }
}