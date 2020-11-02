//
//  VisualizacaoArvores.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 01/11/20.
//

import SwiftUI

struct VisualizacaoArvores: View {
    var body: some View {
        VStack {
            Text("CPF")
                .font(.title)
                .bold()
            DiagramaSubarvore(no: indices.cpf.raiz)
            
            HStack {
                VStack {
                    Text("Nomes")
                        .font(.title)
                        .bold()
                    DiagramaSubarvore(no: indices.nome.raiz)
                }
                
                VStack {
                    Text("Data de nascimento")
                        .font(.title)
                        .bold()
                    DiagramaSubarvore(no: indices.dataNascimento.raiz)
                }
            }
        }
    }
}

struct VisualizacaoArvores_Previews: PreviewProvider {
    static var previews: some View {
        VisualizacaoArvores()
    }
}
