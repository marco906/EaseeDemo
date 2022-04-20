//
//  ProductCardView.swift
//  EaseeDemo
//
//  Created by Marco Wenzel on 19.04.22.
//

import SwiftUI

struct ProductCardView: View {
    @State var robot: ChargeRobot
    
    var body: some View {
            VStack(spacing: 8) {
                headerView
                
                Image(robot.color)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .padding()
                
                HStack {
                    FeatureView(imageName: "powerplug", title: "Cable", subTitle: "Locked", leading: true)
                    Spacer()
                    FeatureView(imageName: "lock.open", title: "Access", subTitle: "Open", leading: false)
                }
                .font(.title3)
                .padding(.horizontal)
                
                HStack {
                    FeatureView(imageName: "bolt", title: "18A", subTitle: "Available", leading: true)
                    Spacer()
                    FeatureView(imageName: "clock", title: "Schedule", subTitle: "", leading: false)
                }
                .font(.title3)
                .padding(.horizontal)
                .background(capsuleBackground)
                .padding(.vertical)
                .overlay(playButton)
                
                Spacer()
            }
            .padding()
            //.padding(.horizontal, 8)
    }
    
    // MARK: - Subviews
    var headerView: some View {
        VStack(spacing: 8) {        
            Text(robot.isCharging ? "Charging" : "Paused")
            .font(.title2)
            .fontWeight(.semibold)
        
            Text(robot.name.uppercased())
            .font(.subheadline)
            .fontWeight(.medium)
            .foregroundStyle(.tertiary)
        }
    }
    
    var playButton: some View {
        Button{
            robot.isCharging.toggle()
        } label : {
        Image(systemName: robot.isCharging ? "pause" : "play.fill")
            .font(.title)
            .foregroundStyle(.background)
            .padding()
            .background(Circle().frame(width: 70, height: 70))
        }
        .buttonStyle(.plain)
    }
    
    var capsuleBackground: some View {
        Capsule()
            .foregroundStyle(Color(uiColor: .secondarySystemGroupedBackground))
    }
    

}

// MARK: - Preview
struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
            ProductCardView(robot: ChargeRobot.preview)
                //.preferredColorScheme(.dark)
    }
}
