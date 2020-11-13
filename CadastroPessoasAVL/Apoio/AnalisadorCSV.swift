//
//  AnalisadorCSV.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 01/11/20.
//

import Foundation

class AnalisadorCSV {
    static func analisar(arquivo: String) {
        let lines = arquivo.split(separator: "\n")
        
        //indices = IndicesArvore()
        let oneTwo = UnsafeMutablePointer<Int>.allocate(capacity: 2)
        
        oneTwo.initialize(repeating: 1, count: 2)
        print("First memory address:", oneTwo) // First memory address: 0x000000010045deb0
        print("First value:", oneTwo.pointee) // First value: 1

        oneTwo[1] = 2 // Subscript
        print("Second memory address:", oneTwo + 1) // Second memory address: 0x000000010045deb8
        print("Second value:", oneTwo[1]) // Second value: 2
        
        var campo: Int = 0
        var cpf: String = ""
        var rg: String = ""
        var nome: String = ""
        var dataNascimento: Date = Date()
        var nomeCidadeNascimento: String = ""
        
        for line in lines {
            print(line)
            let columns = line.split(separator: ";", omittingEmptySubsequences: false)
            
            campo = 0
            
            for column in columns {
                print(column)
                
                if campo == 0 {
                    let cpfEncontrado = column
                    print("String = \(cpfEncontrado)")
                    cpf = String(cpfEncontrado)
                } else if campo == 1 {
                    let rgEncontrado = column
                    print("String = \(rgEncontrado)")
                    rg = String(rgEncontrado)
                } else if campo == 2 {
                    let nomeEncontrado = column
                    print("String = \(nomeEncontrado)")
                    nome = String(nomeEncontrado)
                } else if campo == 3 {
                    let dataNascimentoEncontrada = String(column)
                    print("Date = \(dataNascimentoEncontrada)")
                    dataNascimento = Utils.getDateFrom(dataNascimentoEncontrada)
                } else if campo == 4 {
                    let nomeCidadeEncontrado = column
                    print("String = \(nomeCidadeEncontrado)")
                    nomeCidadeNascimento = String(nomeCidadeEncontrado)
                }
                
                campo += 1
            }
            
            let pessoa = Pessoa(cpf: cpf, rg: rg, nome: nome, dataNascimento: dataNascimento, nomeCidadeNascimento: nomeCidadeNascimento)
            
            indices.cpf.inserir(String(pessoa.cpf), pessoa)
            indices.nome.inserir(Utils.getStringNormalizada(pessoa.nome), pessoa)
            indices.dataNascimento.inserir(Utils.getISODateFrom(pessoa.dataNascimento), pessoa)
        }
    }
}
