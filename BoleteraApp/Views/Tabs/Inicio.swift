//
//  Inicio.swift
//  BoleteraApp
//
//  Created by LIC-N1 on 20/04/26.
//

import SwiftUI

struct Inicio: View {
    @AppStorage(AppKeys.username) var usernameKey: String = ""
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.green, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            VStack{
                Text("Bienvenid@ \(usernameKey)")
                    .font(.title).foregroundColor(.white)
            }
        }
    }
}

#Preview {
    Inicio()
}
