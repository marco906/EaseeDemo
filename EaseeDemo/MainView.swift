//
//  ProfileView.swift
//  EaseeDemo
//
//  Created by Marco Wenzel on 19.04.22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
        List {
            Section("My easee") {
                NavigationLink{
                    DashboardView()
                } label: {
                    Label("Dashboard", systemImage: "rectangle.3.group")
                }
                
                keyLink
                TestLink(title: "Settings", image: "gear")
                TestLink(title: "Notifications", image: "bell.badge")
            }
            .listItemTint(.secondary)
            
                TestLink(title: "Support", image: "questionmark.circle")
                .listItemTint(.secondary)
                Label("Log out", systemImage: "rectangle.portrait.and.arrow.right")
            .listItemTint(.secondary)
            
        }
        
        .listStyle(.sidebar)
        .navigationTitle("")
        //.navigationBarTitleDisplayMode(.inline)
        
        .toolbar{
            ToolbarItem(placement: .principal) {
                HStack{
                    profileHeader
                    Spacer()
                }
                .padding(.vertical)
            }
        }
        }
    }
    
    // MARK: - Subviews
    var profileHeader: some View {
        HStack {
            Image(systemName: "person.crop.circle.fill")
                .font(.title)
                .foregroundColor(.secondary)
                .symbolRenderingMode(.multicolor)
            VStack(alignment: .leading) {
                Text("Marco")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Show Profile")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            //
        }
        .padding(.leading)
        .listRowBackground(Color.clear)
    }
    
    var keyLink: some View {
        NavigationLink{
            Text("Test")
        } label: {
            HStack {
                Label("Easee Keys", systemImage: "key")
                Spacer()
                Text("0")
                    .foregroundStyle(.tertiary)
            }
        }
    }
}

// MARK: - Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
            MainView()
        .preferredColorScheme(.dark)
    }
}

struct TestLink: View {
    var title: String
    var image: String
    var body: some View {
        NavigationLink{
            Text("Test")
        } label: {
            Label(title, systemImage: image)
        }
    }
}
