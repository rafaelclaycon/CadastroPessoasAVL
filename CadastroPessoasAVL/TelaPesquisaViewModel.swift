//
//  TelaPesquisaViewModel.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 31/10/20.
//

import Combine
import SwiftUI

class TelaPesquisaViewModel: ObservableObject {
    @Published var pessoas: [Pessoa]
    @Published var exibirAlerta: Bool = false
    
    var listaVazia: Bool {
        return pessoas.isEmpty
    }
    
    init(pessoas: [Pessoa]) {
        self.pessoas = pessoas
    }
    
    func buscarCPF(_ cpfProcurado: String) {
        self.pessoas.removeAll()
        guard let pessoa = indices.cpf.buscar(chave: cpfProcurado) else {
            return self.exibirAlerta = true
        }
        self.pessoas.append(pessoa)
    }
}
