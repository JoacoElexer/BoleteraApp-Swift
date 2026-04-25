//
//  BoleteraAppApp.swift
//  BoleteraApp
//
//  Created by LIC-N1 on 20/04/26.
//

import SwiftUI

@main
struct BoleteraAppApp: App {
    var body: some Scene {
        WindowGroup {
            Login()
        }.modelContainer(for: [Usuario.self, Venta.self])
    }
}
