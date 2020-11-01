//
//  TelaPrincipal.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 31/10/20.
//

import SwiftUI

struct TelaPrincipal: View {
    @ObservedObject var viewModel: TelaPrincipalViewModel
    @State private var entrada = ""
    @State private var entradaNome = ""
    @State private var dataInicial = Date()
    @State private var dataFinal = Date()
    var filtros = ["CPF", "Nome", "Data de nascimento"]
    @State private var filtroSelecionado = 0
    
    var body: some View {
        VStack {
            HStack {
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
                
                Spacer()
                
                Text("Rafael Claycon Schmitt")
                    .font(.title3)
                    .padding(.trailing, 8)
            }
            
            HStack {
                Spacer()
                
                Picker(selection: $filtroSelecionado, label: Text("Filtro de consulta")) {
                    ForEach(0 ..< filtros.count) {
                        Text(self.filtros[$0])
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding(.trailing, 30)
                
                if filtroSelecionado == 0 {
                    Text("CPF:")
                    
                    TextField("", text: $entrada)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .frame(width: 150)
                        .padding(.trailing, 30)
                } else if filtroSelecionado == 1 {
                    Text("Nome:")
                    
                    TextField("", text: $entradaNome)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .frame(width: 180)
                        .padding(.trailing, 30)
                } else if filtroSelecionado == 2 {
                    DatePicker("Nascidos entre", selection: $dataInicial, displayedComponents: .date)
                        .frame(width: 250)
                        .padding(.trailing, 4)
                    
                    DatePicker(" e ", selection: $dataFinal, displayedComponents: .date)
                        .frame(width: 150)
                }
                
                Button(action: {
                    // your action here
                }) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Buscar")
                    }
                }
                .padding(.leading, 10)
                
                Spacer()
            }
            
            VStack {
                HStack {
                    Text("Resultados:")
                        .font(.title2)
                        .bold()
                        .padding()
                        .padding(.leading, 10)
                    Spacer()
                }
                
                HStack {
                    List {
                        
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TelaPrincipal(viewModel: TelaPrincipalViewModel())
    }
}
