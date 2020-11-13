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
    var dados: [UnsafeMutablePointer<Pessoa>]?
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
        self.dados = [Pessoa]()
        if dados != nil {
            self.dados!.append(dados!)
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
    
    func adicionar(pessoa: Pessoa?) {
        guard let pessoa = pessoa else {
            return
        }
        guard self.dados != nil else {
            return
        }
        self.dados!.append(pessoa)
    }
}

enum OrientacaoNo {
    case nenhuma, esquerda, direita
}
