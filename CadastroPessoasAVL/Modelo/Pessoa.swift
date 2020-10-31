//
//  Pessoa.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 31/10/20.
//

import Foundation

class Pessoa {
    var cpf: Int
    var rg: Int
    var nome: String
    var dataNascimento: Date
    var nomeCidadeNascimento: String
    
    init(cpf: Int, rg: Int, nome: String, dataNascimento: Date, nomeCidadeNascimento: String) {
        self.cpf = cpf
        self.rg = rg
        self.nome = nome
        self.dataNascimento = dataNascimento
        self.nomeCidadeNascimento = nomeCidadeNascimento
    }
}
