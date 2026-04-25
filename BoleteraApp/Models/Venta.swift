//
//  Venta.swift
//  BoleteraApp
//
//  Created by LIC-N1 on 20/04/26.
//

import Foundation
import SwiftData

@Model
class Venta{
    var id: UUID
    var nombreCliente: String
    var cantidadBoletos: Int
    var fechaVenta: Date
    
    init(id: UUID, nombreCliente: String, cantidadBoletos: Int, fechaVenta: Date = Date()) {
        self.id = id
        self.nombreCliente = nombreCliente
        self.cantidadBoletos = cantidadBoletos
        self.fechaVenta = fechaVenta
    }
}
