//
//  SupportingView.swift
//  EaseeDemo
//
//  Created by Marco Wenzel on 19.04.22.
//

import SwiftUI

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
        //.background(Color(uiColor: .secondarySystemGroupedBackground))
    }
}

