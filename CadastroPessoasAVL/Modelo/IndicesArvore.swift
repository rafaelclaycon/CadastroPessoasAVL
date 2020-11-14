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
    var pessoas: UnsafeMutablePointer<Pessoa>? = nil
    
    init() {
        self.cpf = ArvoreAVL()
        self.nome = ArvoreAVL()
        self.dataNascimento = ArvoreAVL()
    }
}
