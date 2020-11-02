//
//  Arvore.swift
//  ArvoreAVL
//
//  Created by Rafael Schmitt on 18/09/20.
//

import SwiftUI

struct DiagramaSubarvore: View {
    let no: No?
    
    var body: some View {
        if no != nil {
            VStack(alignment: .center) {
                NoView(chave: no!.chave, fator: no!.fatorBalanceamento)
                HStack(alignment: .center, spacing: 10) {
                    //Spacer()
                    DiagramaSubarvore(no: no!.esquerda)
                    Spacer()
                    DiagramaSubarvore(no: no!.direita)
                    //Spacer()
                }
            }
        }
    }
}

struct Arvore_Previews: PreviewProvider {
    static var previews: some View {
        DiagramaSubarvore(no: No(pai: nil, esquerda: nil, direita: No(pai: nil, esquerda: nil, direita: nil, chave: "1", dados: Pessoa(cpf: 25064654057, rg: 442668508, nome: "Kamilly Analu Liz da Rocha", dataNascimento: Date(), nomeCidadeNascimento: "Canoas")), chave: "0", dados: Pessoa(cpf: 24446143212, rg: 116927951, nome: "Diogo Bento Almada", dataNascimento: Date(), nomeCidadeNascimento: "Porto Alegre")))
    }
}
