//
//  VisualizacaoArvoresViewModel.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 15/11/20.
//

import Combine
import SwiftUI

class VisualizacaoArvoresViewModel: ObservableObject {
    
    func getTextoNosCPF() -> String {
        guard indices != nil else {
            return ""
        }
        return "CPFs: \(indices!.getQuantidadeNosCPF()) nós"
    }
    
    func getTextoNosNome() -> String {
        guard indices != nil else {
            return ""
        }
        return "Nomes: \(indices!.getQuantidadeNosNome()) nós"
    }
    
    func getTextoNosDataNascimento() -> String {
        guard indices != nil else {
            return ""
        }
        return "Datas de nascimento: \(indices!.getQuantidadeNosDataNascimento()) nós"
    }
    
}
