//
//  CartaoPessoaViewModel.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 02/11/20.
//

import Foundation
import Combine

class CartaoPessoaViewModel: ObservableObject {
    var pessoa: Pessoa
    @Published var nome: String
    @Published var rg: String
    @Published var cpf: String
    @Published var dataNascimento: String
    @Published var nomeCidadeNascimento: String
    
    init(pessoa: Pessoa) {
        self.pessoa = pessoa
        self.nome = pessoa.nome
        self.rg = String(pessoa.rg)
        self.cpf = String(pessoa.cpf)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        self.dataNascimento = dateFormatter.string(from: pessoa.dataNascimento)
        
        self.nomeCidadeNascimento = pessoa.nomeCidadeNascimento
    }
    
    func getRGFormatado(rg: Int) -> String {
        return ""
    }
    
//    static func getDataFormatada(data: Date) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "pt-br")
//        dateFormatter.dateFormat = "dd/MM/yyyy"
//        return dateFormatter.string(from: data)
//    }
}
