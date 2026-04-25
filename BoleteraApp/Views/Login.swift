//
//  Login.swift
//  BoleteraApp
//
//  Created by LIC-N1 on 20/04/26.
//

import SwiftUI
import _SwiftData_SwiftUI

struct Login: View {
    @State private var user: String = ""
    @State private var password: String = ""
    @State private var validLogin: Bool = false
    @State private var showError: Bool = false
    @State private var registro: Bool = false
    @Query private var usuarios : [Usuario]
    @AppStorage(AppKeys.username) var usernameKey: String = ""
    var body: some View {
        if(validLogin){
            Home()
        } else {
            ZStack{
                LinearGradient(colors: [Color.green, Color.blue], startPoint: .topLeading, endPoint: .topTrailing).ignoresSafeArea()
                VStack(spacing: 20){
                    Text("Login")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color.black)
                        .shadow(radius: 0.5)
                    TextField("User", text: $user)
                        .textFieldStyle(.roundedBorder)
                        .shadow(radius: 1)
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .shadow(radius: 1)
                    Button("Login"){
                        validateLogin()
                    }
                    .buttonStyle(.borderedProminent)
                    if showError{
                        Text("Invalid credentials")
                            .foregroundColor(Color.red)
                    }
                    HStack{
                        Text("Don't have an account?")
                        Button("Register Here"){
                            registro = true
                        }
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(25)
                .shadow(radius: 10)
                .padding()
            }.sheet(isPresented: $registro){
                NavigationStack{
                    Registro()
                        .navigationTitle("Registro")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar{
                            ToolbarItem(placement: .topBarLeading){
                                Button("Cerrar"){
                                    registro = false
                                }
                            }
                        }
                }
            }
        }
    }
    func validateLogin(){
        print("validacion en progreso")
        let coincidence = usuarios.first {$0.username == user && $0.password == password }
        
        if coincidence != nil {
            validLogin = true
            usernameKey = user
            print("201")
        } else {
            showError = true
            print("401")
        }
        
        /*usuarios.forEach{ usuario in
            if(usuario.username == user && usuario.password == password){
                validLogin = true
                showError = false
            
                print("Status code 201")
            } else {
                validLogin = false
                showError = true
                print("Status code 400")
            }
        }*/
    }
}

#Preview {
    Login()
}
