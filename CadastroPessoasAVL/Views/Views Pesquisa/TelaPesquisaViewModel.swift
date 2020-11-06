//
//  TelaPesquisaViewModel.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 31/10/20.
//

import Combine
import SwiftUI

class TelaPesquisaViewModel: ObservableObject {
    @Published var pessoas: [Pessoa]
    @Published var entrada = ""
    @Published var entradaNome = ""
    @Published var dataInicial = Date()
    @Published var dataFinal = Date()
    @Published var filtros = ["CPF", "Nome", "Data de Nascimento"]
    @Published var filtroSelecionado = 0
    @Published var exibirAlertaNenhumResultado: Bool = false
    @Published var exibirAlertaValorInvalido: Bool = false
    
    var listaVazia: Bool {
        return pessoas.isEmpty
    }
    
    init(pessoas: [Pessoa]) {
        self.pessoas = pessoas
    }
    
    private func limparResultados() {
        self.pessoas.removeAll()
    }
    
    func processarEntrada(_ entrada: String) {
        guard !entrada.isEmpty else {
            return self.exibirAlertaValorInvalido = true
        }
        
        if self.filtroSelecionado == 0 {
            if entrada.isInt {
                buscarCPF(entrada)
            } else {
                return self.exibirAlertaValorInvalido = true
            }
        } else if self.filtroSelecionado == 1 {
            buscarNome(Utils.getStringNormalizada(entrada))
        } else if self.filtroSelecionado == 2 {
            buscarIntervaloDatas()
        }
    }
    
    func buscarCPF(_ cpfProcurado: String) {
        limparResultados()
        guard let pessoa = indices.cpf.buscar(chave: cpfProcurado) else {
            return exibirAlertaNenhumResultado = true
        }
        self.pessoas.append(pessoa)
    }
    
    func buscarNome(_ substring: String) {
        limparResultados()
        guard let pessoas = indices.nome.buscarNosQueContem(substring: substring) else {
            return exibirAlertaNenhumResultado = true
        }
        self.pessoas.append(contentsOf: pessoas)
    }
    
    func buscarIntervaloDatas() {
        
    }
}
