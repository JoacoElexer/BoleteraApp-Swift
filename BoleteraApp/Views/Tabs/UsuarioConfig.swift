//
//  UsuarioAccount.swift
//  BoleteraApp
//
//  Created by LIC-N1 on 27/04/26.
//

import SwiftUI
import SwiftData

struct UsuarioConfig: View {
    @Environment(\.modelContext) private var context
    @AppStorage(AppKeys.username) var usernameKey: String = ""
    @Query private var usuarios: [Usuario]

    @State private var nombre: String = ""
    @State private var primerApellido: String = ""
    @State private var segundoApellido: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var secondPassword: String = ""
    @State private var showSuccess: Bool = false
    @State private var showError: Bool = false
    @State private var errorMessage: String = ""

    private var usuarioActual: Usuario? {
        usuarios.first { $0.username == usernameKey }
    }

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.green, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {
                    // Avatar placeholder
                    ZStack {
                        Circle()
                            .fill(Color.white.opacity(0.3))
                            .frame(width: 90, height: 90)
                        Text(String(usernameKey.prefix(1)).uppercased())
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 10)

                    Text("Mi cuenta")
                        .font(.title2).bold()
                        .foregroundColor(.white)

                    VStack(spacing: 16) {
                        TextField("Nombre", text: $nombre)
                            .textFieldStyle(.roundedBorder)

                        HStack {
                            TextField("Primer apellido", text: $primerApellido)
                                .textFieldStyle(.roundedBorder)
                            TextField("Segundo apellido", text: $segundoApellido)
                                .textFieldStyle(.roundedBorder)
                        }

                        TextField("Username", text: $username)
                            .textFieldStyle(.roundedBorder)
                            .autocapitalization(.none)

                        Divider()

                        Text("Cambiar contraseña (opcional)")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        SecureField("Nueva contraseña", text: $password)
                            .textFieldStyle(.roundedBorder)

                        SecureField("Confirmar contraseña", text: $secondPassword)
                            .textFieldStyle(.roundedBorder)

                        if showError {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .font(.caption)
                        }

                        if showSuccess {
                            Text("¡Cambios guardados correctamente!")
                                .foregroundColor(.green)
                                .font(.caption)
                        }

                        Button("Guardar cambios") {
                            guardarCambios()
                        }
                        .buttonStyle(.borderedProminent)
                        .frame(maxWidth: .infinity)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 8)
                    .padding(.horizontal)
                }
                .padding(.bottom, 30)
            }
        }
        .onAppear {
            cargarDatos()
        }
    }

    func cargarDatos() {
        guard let u = usuarioActual else { return }
        nombre = u.nombre
        primerApellido = u.primerApellido
        segundoApellido = u.segundoApellido
        username = u.username
    }

    func guardarCambios() {
        showError = false
        showSuccess = false
        errorMessage = ""

        guard let u = usuarioActual else {
            errorMessage = "No se encontró el usuario."
            showError = true
            return
        }

        // Validar contraseña si se quiere cambiar
        if !password.isEmpty || !secondPassword.isEmpty {
            guard password == secondPassword else {
                errorMessage = "Las contraseñas no coinciden."
                showError = true
                return
            }
            u.password = password
        }

        u.nombre = nombre
        u.primerApellido = primerApellido
        u.segundoApellido = segundoApellido

        // Si cambió el username, actualizar AppStorage también
        if username != u.username {
            u.username = username
            usernameKey = username
        }

        do {
            try context.save()
            showSuccess = true
            // Limpiar campos de contraseña tras guardar
            password = ""
            secondPassword = ""
        } catch {
            errorMessage = "Error al guardar: \(error.localizedDescription)"
            showError = true
        }
    }
}

#Preview {
    UsuarioAccount()
}
