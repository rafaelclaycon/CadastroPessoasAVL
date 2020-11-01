//
//  CadastroPessoasAVLApp.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 31/10/20.
//

import SwiftUI

@main
struct CadastroPessoasAVLApp: App {
    var body: some Scene {
        WindowGroup {
            //TelaPesquisa(viewModel: TelaPesquisaViewModel())
            TelaCarregamentoArquivo(viewModel: TelaCarregamentoArquivoViewModel())
        }
    }
}
