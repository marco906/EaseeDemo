//
//  ContentView.swift
//  EaseeDemo
//
//  Created by Marco Wenzel on 14.04.22.
//

import SwiftUI

struct LocationView: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @EnvironmentObject var model: Model

    var body: some View {
        Group {
            if horizontalSizeClass == .compact {
                VStack {
                    ProductCardView(robot: .preview)
                        .edgesIgnoringSafeArea(.bottom)
                }
                .background(Color(uiColor: .secondarySystemGroupedBackground))
            } else {
                HStack {
                    VStack{
                        Spacer()
                        Text("Location Info")
                            .padding()
                        Spacer()
                    }
                    Spacer()
                    ProductCardView(robot: .preview)
                        .frame(maxWidth: 500)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button{
                    
                } label: {
                    Image(systemName: "chevron.down")
                }
            }
        }
        .foregroundColor(.primary)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        LocationView()
        }
        .environmentObject(Model())
        .preferredColorScheme(.dark)
        
        NavigationView {
        LocationView()
        }
        .environmentObject(Model())
        .preferredColorScheme(.light)
    }
}
