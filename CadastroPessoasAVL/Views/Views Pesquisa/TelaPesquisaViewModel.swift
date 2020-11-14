//
//  TelaPesquisaViewModel.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 31/10/20.
//

import Combine
import SwiftUI

class TelaPesquisaViewModel: ObservableObject {
    @Published var resultados: [Pessoa]
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
        return resultados.isEmpty
    }
    
    init(pessoas: [Pessoa]) {
        self.resultados = pessoas
    }
    
    func limparResultados() {
        self.resultados.removeAll()
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
            guard !entradaNome.isEmpty else {
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
        self.resultados.append(contentsOf: pessoa)
        self.resultados.sort {
            $0.nome < $1.nome
        }
    }
    
    func buscarNome(_ substring: String) {
        limparResultados()
        guard let pessoas = indices.nome.buscarNosQueContem(substring: substring) else {
            return exibirAlertaNenhumResultado(chave: substring)
        }
        self.resultados.append(contentsOf: pessoas)
        self.resultados.sort {
            $0.nome < $1.nome
        }
    }
    
    func buscarIntervaloDatas(_ dataInicial: Date, _ dataFinal: Date) {
        limparResultados()
        
        do {
            guard let resultado = try indices.dataNascimento.buscarPessoasPorIntervaloDeDatas(de: dataInicial, ate: dataFinal) else {
                return exibirAlertaNenhumResultadoIntervalo(dataInicial: dataInicial, dataFinal: dataFinal)
            }
            self.resultados.append(contentsOf: resultado)
            self.resultados.sort {
                $0.dataNascimento < $1.dataNascimento
            }
        } catch ErroPesquisa.datasInvalidas {
            exibirAlertaDatasInvalidas()
        } catch {
            exibirAlertaErroInesperado(erro: error.localizedDescription)
        }
    }
    
    func getTextoResultados() -> String {
        guard self.resultados.count > 1 else {
            return ""
        }
        
        var texto: String = ""
        
        if (filtroSelecionado == 0) || (filtroSelecionado == 1) {
            texto = "\(self.resultados.count) resultados ordenados pelo nome (A → Z)."
        } else if filtroSelecionado == 2 {
            texto = "\(self.resultados.count) resultados ordenados pela data de nascimento (da mais antiga à mais recente)."
        }
        return texto
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
        self.mensagemAlerta = "A data inicial deve ser MENOR OU IGUAL à data final de consulta."
        self.exibirAlerta = true
    }
    
    private func exibirAlertaErroInesperado(erro: String) {
        self.tituloAlerta = "Erro Inesperado"
        self.mensagemAlerta = erro
        self.exibirAlerta = true
    }
}
