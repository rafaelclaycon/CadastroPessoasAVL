//
//  TelaPesquisa.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 31/10/20.
//

import SwiftUI

struct TelaPesquisa: View {
    @ObservedObject var viewModel: TelaPesquisaViewModel
    
    var body: some View {
        VStack {
            Cabecalho()
            
            HStack {
                Spacer()

                Picker(selection: $viewModel.filtroSelecionado, label: Text("Filtro de consulta")) {
                    ForEach(0 ..< viewModel.filtros.count) {
                        Text(viewModel.filtros[$0])
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding(.trailing, 30)

                if viewModel.filtroSelecionado == 0 {
                    Text("CPF:")

                    TextField("", text: $viewModel.entrada)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .frame(width: 150)
                        .padding(.trailing, 30)
                } else if viewModel.filtroSelecionado == 1 {
                    Text("Nome:")

                    TextField("", text: $viewModel.entradaNome)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .frame(width: 180)
                        .padding(.trailing, 30)
                } else if viewModel.filtroSelecionado == 2 {
                    DatePicker("Nascidos entre", selection: $viewModel.dataInicial, displayedComponents: .date)
                        .frame(width: 250)
                        .padding(.trailing, 4)

                    DatePicker(" e ", selection: $viewModel.dataFinal, displayedComponents: .date)
                        .frame(width: 150)
                }

                Button(action: {
                    if viewModel.filtroSelecionado == 0 {
                        viewModel.processarEntrada(viewModel.entrada)
                    } else if viewModel.filtroSelecionado == 1 {
                        viewModel.processarEntrada(viewModel.entradaNome)
                    }
                }) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Buscar")
                    }
                }
                .padding(.leading, 10)
                .alert(isPresented: $viewModel.exibirAlertaValorInvalido) {
                    Alert(title: Text("Valor Inválido"), message: Text("Utilize apenas números para realizar essa pesquisa."), dismissButton: .default(Text("OK")))
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
        .alert(isPresented: $viewModel.exibirAlertaNenhumResultado) {
            Alert(title: Text("Nenhum Resultado"), message: Text("Não foi encontrada nenhuma pessoa para a chave \"\(viewModel.entrada)\"."), dismissButton: .default(Text("OK")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TelaPesquisa(viewModel: TelaPesquisaViewModel(pessoas: [Pessoa]()))
    }
}
