//
//  AnalisadorCSV.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 01/11/20.
//

import Foundation

class AnalisadorCSV {
    static func analisar(arquivo: String, indices indice: IndicesArvore) {
        let lines = arquivo.split(separator: "\n")
        
        // Inicializa array de ponteiros Pessoa
        indice.pessoas = UnsafeMutablePointer<Pessoa>.allocate(capacity: lines.count)
        indice.pessoas!.initialize(repeating: Pessoa(), count: lines.count)
        indice.quantidadePessoas = lines.count
        
        // Inicializa variáveis locais de apoio
        var linha: Int = 0
        var campo: Int = 0
        
        var cpf: String = ""
        var rg: String = ""
        var nome: String = ""
        var dataNascimento: Date = Date()
        var nomeCidadeNascimento: String = ""
        
        for line in lines {
            let columns = line.split(separator: ";", omittingEmptySubsequences: false)
            
            campo = 0
            
            for column in columns {
                if campo == 0 {
                    cpf = String(column)
                } else if campo == 1 {
                    rg = String(column)
                } else if campo == 2 {
                    nome = String(column)
                } else if campo == 3 {
                    dataNascimento = Utils.getDateFrom(String(column))
                } else if campo == 4 {
                    nomeCidadeNascimento = String(column)
                }
                
                campo += 1
            }
            
            // Adiciona pessoa ao array Pessoas
            indice.pessoas![linha] = Pessoa(cpf: cpf, rg: rg, nome: nome, dataNascimento: dataNascimento, nomeCidadeNascimento: nomeCidadeNascimento)
            
            indice.cpf.inserir(String(indice.pessoas![linha].cpf), indice.pessoas![linha])
            indice.nome.inserir(Utils.getStringNormalizada(indice.pessoas![linha].nome), indice.pessoas![linha])
            indice.dataNascimento.inserir(Utils.getISODateFrom(indice.pessoas![linha].dataNascimento), indice.pessoas![linha])
            
            linha += 1
        }
    }
}
