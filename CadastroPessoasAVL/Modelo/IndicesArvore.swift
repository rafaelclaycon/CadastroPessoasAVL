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
    var quantidadePessoas: Int = 0
    
    init() {
        self.cpf = ArvoreAVL()
        self.nome = ArvoreAVL()
        self.dataNascimento = ArvoreAVL()
    }
    
    func getQuantidadeNosCPF() -> Int {
        guard let array = cpf.getCaminhamentoPosOrdem() else {
            return 0
        }
        return array.count
    }
    
    func getQuantidadeNosNome() -> Int {
        guard let array = nome.getCaminhamentoPosOrdem() else {
            return 0
        }
        return array.count
    }
    
    func getQuantidadeNosDataNascimento() -> Int {
        guard let array = dataNascimento.getCaminhamentoPosOrdem() else {
            return 0
        }
        return array.count
    }
}
