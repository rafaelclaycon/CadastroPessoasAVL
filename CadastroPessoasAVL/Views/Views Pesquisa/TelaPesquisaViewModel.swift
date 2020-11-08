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
    @Published var tituloAlerta: String = ""
    @Published var mensagemAlerta: String = ""
    @Published var exibirAlerta: Bool = false
    
    var listaVazia: Bool {
        return pessoas.isEmpty
    }
    
    init(pessoas: [Pessoa]) {
        self.pessoas = pessoas
    }
    
    private func limparResultados() {
        self.pessoas.removeAll()
    }
    
    func processarEntrada() {
        if self.filtroSelecionado == 0 {
            guard !entrada.isEmpty else {
                return exibirAlertaValorInvalidoCampoEmBranco()
            }
            
            if self.entrada.isInt {
                buscarCPF(self.entrada)
            } else {
                exibirAlertaValorInvalidoApenasNumeros()
            }
        } else if self.filtroSelecionado == 1 {
            guard !entrada.isEmpty else {
                return exibirAlertaValorInvalidoCampoEmBranco()
            }
            
            buscarNome(self.entradaNome)
        } else if self.filtroSelecionado == 2 {
            buscarIntervaloDatas(self.dataInicial, self.dataFinal)
        }
    }
    
    func buscarCPF(_ cpfProcurado: String) {
        limparResultados()
        guard let pessoa = indices.cpf.buscar(chave: cpfProcurado) else {
            return exibirAlertaNenhumResultado(chave: cpfProcurado)
        }
        self.pessoas.append(pessoa)
    }
    
    func buscarNome(_ substring: String) {
        limparResultados()
        guard let pessoas = indices.nome.buscarNosQueContem(substring: substring) else {
            return exibirAlertaNenhumResultado(chave: substring)
        }
        self.pessoas.append(contentsOf: pessoas)
    }
    
    func buscarIntervaloDatas(_ dataInicial: Date, _ dataFinal: Date) {
        limparResultados()
        
        do {
            guard let resultado = try indices.dataNascimento.buscarPessoasPorIntervaloDeDatas(de: dataInicial, ate: dataFinal) else {
                return exibirAlertaNenhumResultadoIntervalo(dataInicial: dataInicial, dataFinal: dataFinal)
            }
            self.pessoas.append(contentsOf: resultado)
        } catch ErroPesquisa.datasInvalidas {
            exibirAlertaDatasInvalidas()
        } catch {
            exibirAlertaErroInesperado(erro: "\(error)")
        }
    }
    
    // MARK: - Mensagens de Erro 🛑
    
    private func exibirAlertaNenhumResultado(chave: String) {
        self.tituloAlerta = "Nenhum Resultado"
        self.mensagemAlerta = "Não foi encontrada nenhuma pessoa para a chave \"\(chave)\"."
        self.exibirAlerta = true
    }
    
    private func exibirAlertaNenhumResultadoIntervalo(dataInicial: Date, dataFinal: Date) {
        self.tituloAlerta = "Nenhum Resultado"
        self.mensagemAlerta = "Não foram encontradas pessoas com data de nascimento entre \(Utils.getDataPadraoBrasileiro(dataInicial)) e \(Utils.getDataPadraoBrasileiro(dataFinal))."
        self.exibirAlerta = true
    }
    
    private func exibirAlertaValorInvalidoApenasNumeros() {
        self.tituloAlerta = "Valor Inválido"
        self.mensagemAlerta = "Utilize apenas números para realizar essa pesquisa."
        self.exibirAlerta = true
    }
    
    private func exibirAlertaValorInvalidoCampoEmBranco() {
        self.tituloAlerta = "Valor Inválido"
        self.mensagemAlerta = "Informe algum valor no campo de texto para realizar a consulta."
        self.exibirAlerta = true
    }
    
    private func exibirAlertaDatasInvalidas() {
        self.tituloAlerta = "Intervalo Inválido"
        self.mensagemAlerta = "A data inicial deve ser MENOR do que a data final de consulta."
        self.exibirAlerta = true
    }
    
    private func exibirAlertaErroInesperado(erro: String) {
        self.tituloAlerta = "Erro Inesperado"
        self.mensagemAlerta = erro
        self.exibirAlerta = true
    }
}
