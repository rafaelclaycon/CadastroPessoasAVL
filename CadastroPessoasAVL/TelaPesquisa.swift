//
//  TelaPesquisa.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 31/10/20.
//

import SwiftUI

struct TelaPesquisa: View {
    @ObservedObject var viewModel: TelaPesquisaViewModel
    @State private var entrada = ""
    @State private var entradaNome = ""
    @State private var dataInicial = Date()
    @State private var dataFinal = Date()
    var filtros = ["CPF", "Nome", "Data de nascimento"]
    @State private var filtroSelecionado = 0
    
    var body: some View {
        VStack {
            Cabecalho()
            
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
                    if entrada.isInt {
                        viewModel.buscarCPF(entrada)
                    }
                }) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Buscar")
                    }
                }
                .padding(.leading, 10)
                .alert(isPresented: $viewModel.exibirAlerta) {
                    Alert(title: Text("Chave não encontrada"), message: Text("Não foi encontrada nenhuma pessoa para \"\(entrada)\"."), dismissButton: .default(Text("OK")))
                }

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
                
                if viewModel.listaVazia {
                    Spacer()
                    Text("Nenhum Resultado")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                        .bold()
                        .opacity(0.4)
                    Spacer()
                } else {
                    List(viewModel.pessoas, id: \.cpf) { pessoa in
                        CartaoPessoa(viewModel: CartaoPessoaViewModel(pessoa: pessoa))
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TelaPesquisa(viewModel: TelaPesquisaViewModel(pessoas: [Pessoa]()))
    }
}
