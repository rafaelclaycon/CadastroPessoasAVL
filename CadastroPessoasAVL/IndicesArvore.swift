//
//  IndicesArvore.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 01/11/20.
//

import Foundation

class IndicesArvore {
    var indiceCPF: ArvoreAVL
    var indiceNome: ArvoreAVL
    var indiceDataNascimento: ArvoreAVL
    
    init() {
        self.indiceCPF = ArvoreAVL()
        self.indiceNome = ArvoreAVL()
        self.indiceDataNascimento = ArvoreAVL()
    }
}
