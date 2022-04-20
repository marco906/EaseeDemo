//
//  NotificationsView.swift
//  EaseeDemo
//
//  Created by Marco Wenzel on 20.04.22.
//

import SwiftUI

struct NotificationsView: View {
    @EnvironmentObject var model: Model
    var body: some View {
        List{
            Toggle("Charge started", isOn: $model.notifChargeStarted)
            Toggle("Charge ended", isOn: $model.notifChargeEnded)
            Toggle("Charge interrupted", isOn: $model.notifChargeInter)
            Toggle("Authentication missing", isOn: $model.notifAuthForgotten)
        }
        .tint(.blue)
        .navigationTitle("Notifications")
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        NotificationsView()
            .environmentObject(Model())
        }
    }
}
