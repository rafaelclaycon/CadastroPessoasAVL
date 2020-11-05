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
    @Published private var entrada = ""
    @Published private var entradaNome = ""
    @Published private var dataInicial = Date()
    @Published private var dataFinal = Date()
    @Published private var filtros = ["CPF", "Nome", "Data de nascimento"]
    @Published private var filtroSelecionado = 0
    @Published var exibirAlerta: Bool = false
    @Published private var exibirAlertaValorInvalido: Bool = false
    
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
                self.buscarCPF(entrada)
        }
        if entrada.isInt {
            self.buscarCPF(entrada)
        } else if !entrada.isEmpty {
            
        }
    }
    
    func buscarCPF(_ cpfProcurado: String) {
        limparResultados()
        guard let pessoa = indices.cpf.buscar(chave: cpfProcurado) else {
            return self.exibirAlerta = true
        }
        self.pessoas.append(pessoa)
    }
    
    func buscarNome() {
        limparResultados()
        
    }
    
    func buscarIntervaloDatas() {
        
    }
}
