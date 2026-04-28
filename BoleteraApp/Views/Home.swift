//
//  Home.swift
//  BoleteraApp
//
//  Created by LIC-N1 on 20/04/26.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView{
            Inicio().tabItem {
                Label("Inicio", systemImage: "house")
            }
            Boletos().tabItem {
                Label("Boletos", systemImage: "ticket")
            }
            Ventas().tabItem {
                Label("Ventas", systemImage: "list.bullet")
            }
            UsuarioAccount.tabItem {
                Label("Cuenta", systemImage: "person.circle")
            }
        }
    }
}

#Preview {
    Home()
}
