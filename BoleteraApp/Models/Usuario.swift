//
//  Usuario.swift
//  BoleteraApp
//
//  Created by LIC-N1 on 20/04/26.
//

import Foundation
import SwiftData

@Model
class Usuario {
    var id: UUID?
    var nombre: String
    var primerApellido: String
    var segundoApellido: String
    var username: String
    var password: String
    
    init(id: UUID? = nil, nombre: String, primerApellido: String, segundoApellido: String, username: String, password: String) {
        self.id = id
        self.nombre = nombre
        self.primerApellido = primerApellido
        self.segundoApellido = segundoApellido
        self.username = username
        self.password = password
    }
}
