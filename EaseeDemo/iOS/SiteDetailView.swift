//
//  LocationDetailView.swift
//  EaseeDemo
//
//  Created by Marco Wenzel on 20.04.22.
//

import SwiftUI

struct SiteDetailView: View {
    @State var selection = 2
    var body: some View {
        VStack{
            Picker(selection: $selection, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                Text("Month").tag(1)
                Text("Year").tag(2)
                Text("Total").tag(3)
            }
            .pickerStyle(.segmented)
            .frame(maxWidth: 220)
            .padding()
            
            HStack(alignment: .top) {
                Text(String(Int.random(in: 1000...2000)))
                    
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.semibold)
                Text("kWh")
                    .font(.subheadline)
                    .padding(.top, 4)
            }
            .padding()
            
            HStack {
                Image(systemName: "chevron.left")
                    .padding(12)
                    .background(Circle()
                        .foregroundColor(Color(uiColor: .systemGroupedBackground))
                    )
                Spacer()
                Text("2021")
                    .font(.subheadline)
                
                Spacer()
                Image(systemName: "alternatingcurrent")
                    .padding(12)
                    .background(Circle()
                        .foregroundColor(Color(uiColor: .systemGroupedBackground))
                    )
            }
            .padding(.bottom)
            
            optionButtons
            Spacer()
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder var optionButtons: some View {
        Group{
        NavigationLink{
            Text("Power management")
        } label: {
            NavButton(title: "Power management")
        }
        
        NavigationLink{
            Text("Site settings")
        } label: {
            NavButton(title: "Site settings")
        }
        }
        .font(.subheadline)
        .background(Color(uiColor: .systemGroupedBackground))
        
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SiteDetailView()
            .background(Color(uiColor: .secondarySystemGroupedBackground))
            .preferredColorScheme(.dark)
    }
}
