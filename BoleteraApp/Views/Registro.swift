//
//  Registro.swift
//  BoleteraApp
//
//  Created by LIC-N1 on 20/04/26.
//

import SwiftUI

struct Registro: View {
    @Environment(\.modelContext) private var context
    @State private var nombre : String = ""
    @State private var primerApellido : String = ""
    @State private var segundoApellido : String = ""
    @State private var username : String = ""
    @State private var password : String = ""
    @State private var secondPassword : String = ""
    @State private var showError : Bool = false
    @State private var registro : Bool = false
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.green, Color.blue], startPoint: .topLeading, endPoint: .topTrailing).ignoresSafeArea()
            VStack(spacing: 20){
                Text("New account")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.black)
                    .shadow(radius: 0.5)
                TextField("Name", text: $nombre)
                    .textFieldStyle(.roundedBorder)
                    .shadow(radius: 1)
                HStack{
                    TextField("First name", text: $primerApellido)
                        .textFieldStyle(.roundedBorder)
                        .shadow(radius: 1)
                    TextField("Last name", text: $segundoApellido)
                        .textFieldStyle(.roundedBorder)
                        .shadow(radius: 1)
                }
                TextField("User", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .shadow(radius: 1)
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .shadow(radius: 1)
                SecureField("Verify password", text: $secondPassword)
                    .textFieldStyle(.roundedBorder)
                    .shadow(radius: 1)
                Button("Register"){
                    guardarUsuario()
                }
                .buttonStyle(.borderedProminent)
                if showError{
                    Text("Error registering a new user")
                        .foregroundColor(Color.red)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(25)
            .shadow(radius: 10)
            .padding()
        }
    }
    func guardarUsuario(){
        if(secondPassword == password){
            let newUser = Usuario(
                nombre: nombre,
                primerApellido: primerApellido,
                segundoApellido: segundoApellido,
                username: username,
                password: password
            )
            context.insert(newUser)
            print("Usuario registrado exitosamente: \(newUser.username) \(newUser.password)")
        } else {
            showError = true
        }
    }
}

#Preview {
    Registro()
}
