//
//  TelaPrincipal.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 31/10/20.
//

import SwiftUI

struct TelaPrincipal: View {
    @State private var entrada = ""
    @State private var entradaNome = ""
    @State private var dataInicial = Date()
    @State private var dataFinal = Date()
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Cadastro de Pessoas 👩🏾‍🦱👨🏻🧒🏽👵🏽👩🏼")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 1)
                    
                Text("TRABALHO DO GRAU B - ESTRUTURAS AVANÇADAS DE DADOS I")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            .padding()
            .padding(.leading, 10)
            
            HStack {
                Spacer()
                
                Text("CPF:")
                
                TextField("", text: $entrada)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .frame(width: 150)
                    .padding(.trailing, 30)
                
                Text("Nome:")
                
                TextField("", text: $entradaNome)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .frame(width: 180)
                    .padding(.trailing, 30)
                
                DatePicker("Nascidos entre", selection: $dataInicial, displayedComponents: .date)
                    .frame(width: 250)
                    .padding(.trailing, 4)
                
                DatePicker(" e ", selection: $dataFinal, displayedComponents: .date)
                    .frame(width: 150)
                
                Button(action: {
                    // your action here
                }) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Buscar")
                    }
                }
                .padding(.leading, 30)
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TelaPrincipal()
    }
}
