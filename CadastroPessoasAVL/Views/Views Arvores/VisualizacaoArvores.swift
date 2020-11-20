//
//  VisualizacaoArvores.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 01/11/20.
//

import SwiftUI

struct VisualizacaoArvores: View {
    @ObservedObject var viewModel: VisualizacaoArvoresViewModel
    @State private var arvores = ["CPFs", "Nomes", "Datas de Nascimento"]
    @State private var arvoreSelecionada = 0
    @State private var entrada = ""
    
    var body: some View {
        VStack {
            Cabecalho()
            
            Spacer()
            
            Text("Árvore de \(arvores[arvoreSelecionada])")
                .font(.title2)
                .bold()
            
            Spacer()
            
            ScrollView(.horizontal) {
                if viewModel.mostarArvore {
                    if arvoreSelecionada == 0 {
                        DiagramaSubarvore(no: indices?.cpf.raiz)
                    } else if arvoreSelecionada == 1 {
                        DiagramaSubarvore(no: indices?.nome.raiz)
                    } else {
                        DiagramaSubarvore(no: indices?.dataNascimento.raiz)
                    }
                }
            }
            
            Spacer()
            
            HStack {
                Spacer()
                
                TextField("", text: $entrada)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .frame(width: 120)
                    .padding(.trailing, 20)
                
                Button(action: {
                    if arvoreSelecionada == 0 {
                        indices?.cpf.inserir(entrada)
                    } else if arvoreSelecionada == 1 {
                        indices?.nome.inserir(entrada)
                    } else {
                        indices?.dataNascimento.inserir(entrada)
                    }
                    entrada = ""
                }) {
                    Text("Inserir")
                }
                .padding(.trailing, 20)
                
                Toggle(isOn: $viewModel.mostarArvore) {
                    Text("Mostrar árvore")
                }
                .frame(width: 180)
                
                Spacer()
            }
            
            Spacer()
            
            ZStack {
                Picker(selection: $arvoreSelecionada, label: Text("Filtro de consulta")) {
                    ForEach(0 ..< arvores.count) {
                        Text(arvores[$0])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 500)
                .padding(.bottom, 35)
                
                HStack {
                    Spacer()
                    
                    getTextoNos()
                }
                .padding(.trailing, 40)
                .padding(.bottom, 30)
            }
        }
    }
    
    func getTextoNos() -> some View {
        if arvoreSelecionada == 0 {
            return AnyView(Text(viewModel.getTextoNosCPF()))
        } else if arvoreSelecionada == 1 {
            return AnyView(Text(viewModel.getTextoNosNome()))
        } else {
            return AnyView(Text(viewModel.getTextoNosDataNascimento()))
        }
    }
}

struct VisualizacaoArvores_Previews: PreviewProvider {
    static var previews: some View {
        VisualizacaoArvores(viewModel: VisualizacaoArvoresViewModel())
    }
}
