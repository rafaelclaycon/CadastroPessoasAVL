//
//  TelaPesquisaViewModel.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 31/10/20.
//

import Combine
import SwiftUI

class TelaPesquisaViewModel: ObservableObject {
    @Published var pessoas: [Pessoa]?
    
    var listaVazia: Bool {
        return pessoas == nil
    }
    
    init(pessoas: [Pessoa]?) {
        self.pessoas = pessoas
    }
    
    func buscarCPF(_ cpfProcurado: String) {
//        if self.pessoas != nil {
//            self.pessoas?.removeAll()
//        }
        guard let pessoa = indices.cpf.buscar(chave: cpfProcurado) else {
            return
        }
        if self.pessoas == nil {
            self.pessoas = [Pessoa]()
        }
        self.pessoas!.append(pessoa)
    }
}
