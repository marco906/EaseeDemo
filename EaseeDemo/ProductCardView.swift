//
//  ProductCardView.swift
//  EaseeDemo
//
//  Created by Marco Wenzel on 19.04.22.
//

import SwiftUI

struct ProductCardView: View {
    var body: some View {
            VStack(spacing: 8) {
                headerView
                
                Image("FrontWhite")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 220)
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
                
                optionButtons
                
                Spacer()
            }
            .padding()
            .padding(.horizontal, 8)
            .background(Color(uiColor: .systemGroupedBackground))
            .cornerRadius(32)
    }
    
    // MARK: - Subviews
    var headerView: some View {
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
            .fontWeight(.medium)
            .foregroundStyle(.tertiary)
        }
    }
    
    var playButton: some View {
        Image(systemName: "play.fill")
            .font(.title)
            .foregroundStyle(.background)
            .padding()
            .background(Circle().frame(width: 70, height: 70))
    }
    
    var capsuleBackground: some View {
        Capsule()
            .foregroundStyle(Color(uiColor: .secondarySystemGroupedBackground))
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

// MARK: - Preview
struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        ProductCardView()
        }
    }
}

struct FeatureView: View {
    var imageName: String
    var title: String
    var subTitle: String
    var leading: Bool
    var body: some View {
        HStack(spacing: 4) {
            if leading {
                Image(systemName: imageName)
                    .frame(width: 25)
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                    if subTitle.isEmpty == false {
                    Text(subTitle)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    }
                }
                .padding(8)
            } else {
                VStack(alignment: .trailing) {
                    Text(title)
                        .font(.headline)
                    if subTitle.isEmpty == false {
                    Text(subTitle)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    }
                }
                .padding(8)
                Image(systemName: imageName)
                    .frame(width: 25)
            }
        }
    }
}

struct NavButton: View {
    var title: String
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Image(systemName: "chevron.forward")
                .foregroundColor(.secondary)
        }
        .foregroundColor(.primary)
        .padding()
        .background(Color(uiColor: .secondarySystemGroupedBackground))
    }
}
