//
//  Boletos.swift
//  BoleteraApp
//
//  Created by LIC-N1 on 20/04/26.
//

import SwiftUI
import SwiftData

struct Boletos: View {
    // Declaramos el uso dek swiftData context
    @Environment(\.modelContext) private var context
    @State private var nombreCliente: String = ""
    @State private var cantidadBoletos: Int = 1
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.green, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            VStack(spacing: 20){
                Text("Venta de boletos")
                    .font(.largeTitle)
                TextField("Nombre cliente", text: $nombreCliente)
                    .textFieldStyle(.roundedBorder).padding(20)
                Stepper("Cantidad: \(cantidadBoletos)", value: $cantidadBoletos, in: 1...10)
                    .padding(20)
                
                // Logica para registro
                Button("Registrar venta"){
                    guardarVenta()
                }.buttonStyle(.borderedProminent)
                Spacer()
            }.padding()
        }
    }
    func guardarVenta(){
        let nuevaVenta = Venta(
            id: UUID(),
            nombreCliente: nombreCliente,
            cantidadBoletos: cantidadBoletos
        )
        context.insert(nuevaVenta)
        nombreCliente = ""
        cantidadBoletos = 1
    }
}

#Preview {
    Boletos()
}
