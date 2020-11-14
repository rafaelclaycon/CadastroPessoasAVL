//
//  No.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 31/10/20.
//

import Foundation

class No {
    var pai: No?
    var esquerda: No?
    var direita: No?
    var chave: String
    var dados: UnsafeMutablePointer<Pessoa>?
    var fatorBalanceamento: Int {
        return No.getAltura(esquerda) - No.getAltura(direita)
    }
    var isRaiz: Bool {
        return pai == nil
    }
    var orientacaoEmRelacaoAoPai: OrientacaoNo {
        if pai == nil {
            return .nenhuma
        } else {
            if pai?.esquerda?.chave == self.chave {
                return .esquerda
            } else {
                return .direita
            }
        }
    }
    
    init(pai: No?, esquerda: No?, direita: No?, chave: String, dados: Pessoa?) {
        self.pai = pai
        self.esquerda = esquerda
        self.direita = direita
        self.chave = chave
        // Cada Nó tem espaço para até 10 pessoas (no caso de pessoas com a mesma Data da Aniversário).
        self.dados = UnsafeMutablePointer<Pessoa>.allocate(capacity: 10)
        self.dados!.initialize(repeating: Pessoa(), count: 10)
        // Verifica os dados passados por parâmetro e só faz o assign no self.dados se alguma Pessoa foi passada.
        if dados != nil {
            self.dados![0] = dados!
        }
    }
    
    static func getAltura(_ no: No?) -> Int {
        if no == nil {
            return 0
        } else {
            let alturaEsquerda = getAltura(no?.esquerda)
            let alturaDireita = getAltura(no?.direita)
            
            if alturaEsquerda > alturaDireita {
                return alturaEsquerda + 1
            } else {
                return alturaDireita + 1
            }
        }
    }
    
    private func getPrimeiroIndicePessoaVazio() -> Int? {
        let buffer = UnsafeBufferPointer(start: self.dados!, count: 10)
        for (index, element) in buffer.enumerated() {
            if element.nome.isEmpty {
                return index
            }
        }
        return nil
    }
    
    func adicionar(pessoa: Pessoa?) {
        guard let pessoa = pessoa else {
            return
        }
        guard self.dados != nil else {
            return
        }
        guard let indiceVazio = self.getPrimeiroIndicePessoaVazio() else {
            fatalError("O array de Pessoas deste Nó atingiu sua capacidade máxima (10).")
        }
        self.dados![indiceVazio] = pessoa
    }
    
    func getDados() -> [Pessoa] {
        let buffer = UnsafeBufferPointer(start: self.dados, count: 10)
        var resultado = [Pessoa]()

        for (_, element) in buffer.enumerated() {
            if !element.nome.isEmpty {
                resultado.append(element)
            }
        }
        
        return resultado
    }
}

enum OrientacaoNo {
    case nenhuma, esquerda, direita
}
