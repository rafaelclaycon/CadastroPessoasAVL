//
//  IndicesArvore.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 01/11/20.
//

import Foundation

class IndicesArvore {
    var cpf: ArvoreAVL
    var nome: ArvoreAVL
    var dataNascimento: ArvoreAVL
    var pessoas: UnsafeBufferPointer<Pessoa>?
    
    init() {
        self.cpf = ArvoreAVL()
        self.nome = ArvoreAVL()
        self.dataNascimento = ArvoreAVL()
        self.pessoas = nil
    }
}
