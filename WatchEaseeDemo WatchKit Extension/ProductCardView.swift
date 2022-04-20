//
//  ProductCardView.swift
//  WatchEaseeDemo WatchKit Extension
//
//  Created by Marco Wenzel on 20.04.22.
//

import SwiftUI

struct ProductCardView: View {
    @State var robot: ChargeRobot
    var body: some View {
        VStack{
            VStack {
                Text(robot.isCharging ? "Charging" : "Paused")
                    .font(.headline)
                Text(robot.name)
                    .font(.subheadline)
                    .foregroundStyle(.tertiary)
                    
            }.padding()
            
            Spacer()
            HStack {
                CircleLabel(image: "powerplug")
                    .font(.headline)
                Spacer()
                
                Button{ robot.isCharging.toggle() } label: {
                    CircleLabel(image: robot.isCharging ? "pause" : "play.fill", size: 55)
                        .font(.title2)
                }

                Spacer()
                Button{ robot.isAccessLocked.toggle() } label: {
                    CircleLabel(image: robot.isAccessLocked ? "lock" : "lock.open")
                        .font(.headline)
                }
            }            
            Spacer()
            
            HStack {
                CircleLabel(image: "bolt")
                    .font(.headline)
                Spacer()
                CircleLabel(image: "clock")
                    .font(.headline)
                
            }
            .padding(.horizontal, 24)

        }
        .background(backgroundImage, alignment: .top)
        .buttonStyle(.plain)
    }
    
    // MARK: Blurred Image
    var backgroundImage: some View {
        Image(robot.color)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .padding(.top)
            .padding(.horizontal, 25)
            .blur(radius: 6)
            .opacity(0.6)
    }
}

// MARK: Preview
struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(robot: .preview)
    }
}


struct CircleLabel: View {
    var image: String
    var size: CGFloat = 40
    var body: some View {
        Image(systemName: image)
            .padding(12)
            .frame(width: size, height: size)
            .background(Circle().foregroundStyle(.quaternary))
    }
}
