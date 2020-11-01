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
    var valor: Int
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
            if pai?.esquerda?.valor == self.valor {
                return .esquerda
            } else {
                return .direita
            }
        }
    }
    
    init(pai: No?, esquerda: No?, direita: No?, valor: Int) {
        self.pai = pai
        self.esquerda = esquerda
        self.direita = direita
        self.valor = valor
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
}

enum OrientacaoNo {
    case nenhuma, esquerda, direita
}
