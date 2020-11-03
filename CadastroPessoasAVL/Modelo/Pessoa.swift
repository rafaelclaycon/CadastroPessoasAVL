//
//  Pessoa.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 31/10/20.
//

import Foundation

class Pessoa {
    var cpf: String
    var rg: String
    var nome: String
    var dataNascimento: Date
    var nomeCidadeNascimento: String
    
    init(cpf: String, rg: String, nome: String, dataNascimento: Date, nomeCidadeNascimento: String) {
        self.cpf = cpf
        self.rg = rg
        self.nome = nome
        self.dataNascimento = dataNascimento
        self.nomeCidadeNascimento = nomeCidadeNascimento
    }
}
