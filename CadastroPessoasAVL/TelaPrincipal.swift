//
//  TelaPrincipal.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 02/11/20.
//

import SwiftUI

struct TelaPrincipal: View {
    var body: some View {
        TabView {
            VStack {
                TelaCarregamentoArquivo(viewModel: TelaCarregamentoArquivoViewModel())
            }
            .tabItem {
                Image(systemName: "folder.fill")
                Text("Carregar arquivo")
            }
            
            VStack {
                VisualizacaoArvores()
            }
            .tabItem {
                Image(systemName: "leaf.fill")
                Text("Árvores")
            }
            
            VStack {
                TelaPesquisa(viewModel: TelaPesquisaViewModel(pessoas: [Pessoa]()))
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Consulta")
            }
        }
    }
}

struct TelaPrincipal_Previews: PreviewProvider {
    static var previews: some View {
        TelaPrincipal()
    }
}
