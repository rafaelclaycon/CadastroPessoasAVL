//
//  VisualizacaoArvores.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 01/11/20.
//

import SwiftUI

struct VisualizacaoArvores: View {
    @State private var arvores = ["CPFs", "Nomes", "Datas de Nascimento"]
    @State private var arvoreSelecionada = 0
    
    var body: some View {
        VStack {
            Cabecalho()
            
            Spacer()
            
            Text("Árvore de \(arvores[arvoreSelecionada])")
                .font(.title2)
                .bold()
            
            Spacer()
            
            ScrollView(.horizontal) {
                if arvoreSelecionada == 0 {
                    DiagramaSubarvore(no: indices.cpf.raiz)
                } else if arvoreSelecionada == 1 {
                    DiagramaSubarvore(no: indices.nome.raiz)
                } else if arvoreSelecionada == 2 {
                    DiagramaSubarvore(no: indices.dataNascimento.raiz)
                }
            }
            
            Spacer()
            
            Picker(selection: $arvoreSelecionada, label: Text("Filtro de consulta")) {
                ForEach(0 ..< arvores.count) {
                    Text(arvores[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 500)
            .padding(.bottom, 35)
        }
    }
}

struct VisualizacaoArvores_Previews: PreviewProvider {
    static var previews: some View {
        VisualizacaoArvores()
    }
}
