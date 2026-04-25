//
//  Ventas.swift
//  BoleteraApp
//
//  Created by LIC-N1 on 20/04/26.
//

import SwiftUI
import SwiftData

struct Ventas: View {
    @Environment(\.modelContext) private var context
    @Query private var ventas: [Venta]
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.green, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            VStack{
                List{
                    ForEach(ventas){
                        venta in
                        VStack(alignment: .leading){
                            Text(venta.nombreCliente)
                                .font(.headline)
                            Text("Boletos: \(venta.cantidadBoletos)")
                                .font(.subheadline)
                            Text(venta.fechaVenta, style: .date)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }.onDelete(perform: eliminarVenta)
                }.background(Color.black)
            }.padding()
        }
    }
    func eliminarVenta(at offset: IndexSet) {
        for index in offset{
            let venta = ventas[index]
            context.delete(venta)
        }
        do {
            try context.save()
        } catch {
            print("Error al eliminar: \(error)")
        }
    }
}

#Preview {
    Ventas()
}
