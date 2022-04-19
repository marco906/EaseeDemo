//
//  ContentView.swift
//  EaseeDemo
//
//  Created by Marco Wenzel on 14.04.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Divider()
            VStack(spacing: 8) {
                HStack {
                    Image(systemName: "wifi")
                    Text("WiFi")
                        .font(.subheadline)
                    Spacer()
                    Image(systemName: "info.circle")
                }
                .font(.title3)
                .padding(.vertical, 8)
                
                Text("Paused")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("CARPORT")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Image("FrontWhite")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 250)
                    .padding()
                
                HStack {
                    Image(systemName: "powerplug")
                        .rotationEffect(Angle(degrees: -45))
                    VStack(alignment: .leading) {
                        Text("Cable")
                            .font(.headline)
                        Text("Locked")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                    .padding(8)
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("Access")
                            .font(.headline)
                        Text("Open")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                    .padding(8)
                    Image(systemName: "lock.open")
                }
                .font(.title3)
                
                HStack {
                    Image(systemName: "bolt")
                    VStack(alignment: .leading) {
                        Text("18A")
                            .font(.headline)
                        Text("Available")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                    .padding(8)
                    Spacer()
                    Text("Schedule")
                    .font(.headline)
                    .padding(8)
                    Image(systemName: "clock")
                }
                .font(.title3)
                .background(Capsule().foregroundStyle(.white))
                .overlay(
                Image(systemName: "play.fill")
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding()
                    .background(Circle())
                )
                Spacer()
            }
            .foregroundColor(.black)
            .padding()
            .padding(.horizontal, 8)
            .background(.tertiary)
            .cornerRadius(32)
            
            //Spacer()
        }
        .navigationTitle("My Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button{
                    
                } label: {
                    Image(systemName: "chevron.down")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        ContentView()
        }
        .preferredColorScheme(.dark)
    }
}
