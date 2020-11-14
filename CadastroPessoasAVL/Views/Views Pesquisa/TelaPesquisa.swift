//
//  TelaPesquisa.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 31/10/20.
//

import SwiftUI

struct TelaPesquisa: View {
    @ObservedObject var viewModel: TelaPesquisaViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            Cabecalho()
            
            HStack {
                Spacer()
                
                Text("Consultar por")
                    .padding(.trailing, 5)
                
                Picker(selection: $viewModel.filtroSelecionado, label: Text("Filtro de consulta")) {
                    ForEach(0 ..< viewModel.filtros.count) {
                        Text(viewModel.filtros[$0])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 460)
                .onChange(of: viewModel.filtroSelecionado, perform: { _ in
                    viewModel.limparResultados()
                })
                
                Spacer()
            }
            .padding(.bottom, 20)
            
            HStack {
                Spacer()

                if viewModel.filtroSelecionado == 0 {
                    Text("CPF:")

                    TextField("", text: $viewModel.entrada)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .frame(width: 150)
                } else if viewModel.filtroSelecionado == 1 {
                    Text("Nome:")

                    TextField("", text: $viewModel.entradaNome)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .frame(width: 180)
                } else if viewModel.filtroSelecionado == 2 {
                    DatePicker("Nascidos entre", selection: $viewModel.dataInicial, displayedComponents: .date)
                        .frame(width: 250)

                    DatePicker(" e ", selection: $viewModel.dataFinal, displayedComponents: .date)
                        .frame(width: 150)
                }

                Button(action: {
                    viewModel.processarEntrada()
                }) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Buscar")
                    }
                }
                .padding(.leading, 10)
                .alert(isPresented: $viewModel.exibirAlerta) {
                    Alert(title: Text(viewModel.tituloAlerta), message: Text(viewModel.mensagemAlerta), dismissButton: .default(Text("OK")))
                }

                Spacer()
            }
            
            VStack {
                HStack {
                    Text("Resultados:")
                        .font(.title2)
                        .bold()
                        .padding()
                    
                    Spacer()
                    
                    Text(viewModel.getTextoResultados())
                        .foregroundColor(.gray)
                }
                .padding(.leading, 10)
                .padding(.trailing, 30)
                
                if viewModel.listaVazia {
                    Spacer()
                    Text("Nenhum Resultado")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                        .bold()
                        .opacity(0.4)
                    Spacer()
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(viewModel.resultados, id: \.cpf) { pessoa in
                                CartaoPessoa(viewModel: CartaoPessoaViewModel(pessoa: pessoa))
                            }
                        }
                        .padding(.horizontal)
                        .animation(.spring())
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
