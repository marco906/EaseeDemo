//
//  DashBoardView.swift
//  WatchEaseeDemo WatchKit Extension
//
//  Created by Marco Wenzel on 19.04.22.
//

import SwiftUI

struct LocationView: View {
    var body: some View {
        ScrollView {
            Text("Paused")
                
                .padding()
            HStack {
                Image(systemName: "powerplug")
                    .padding()
                    .background(Circle().foregroundStyle(.tertiary))
                Spacer()
                Image(systemName: "play.fill")
                    .font(.title3)
                    .padding()
                    .background(Circle().foregroundStyle(.tertiary))
                Spacer()
                Image(systemName: "lock")
                    .padding()
                    .background(Circle().foregroundStyle(.tertiary))
                
            }

        }
        .background(
        Image("FrontWhite")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .padding()
            .blur(radius: 8)
            .opacity(0.7)
        )
        .navigationTitle("Carport")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LocationView()
        }
    }
}
