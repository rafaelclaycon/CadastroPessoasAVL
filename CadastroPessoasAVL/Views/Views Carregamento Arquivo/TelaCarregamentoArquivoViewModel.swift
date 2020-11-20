//
//  TelaCarregamentoArquivoViewModel.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 01/11/20.
//

import Combine
import SwiftUI

class TelaCarregamentoArquivoViewModel: ObservableObject {
    @Published var tituloAlerta: String = ""
    @Published var mensagemAlerta: String = ""
    @Published var exibirAlerta: Bool = false
    @Published var nomeArquivoImportado: String = ""
    
    func processarArquivoInterno() {
        guard let fileURL = Bundle.main.url(forResource: "testImportarArquivo", withExtension: "csv") else {
            fatalError("Arquivo não encontrado.")
        }
        do {
            let arquivo = try String(contentsOf: fileURL, encoding: .utf8)
            
            if indices == nil {
                indices = IndicesArvore()
            } else {
                indices = nil
                indices = IndicesArvore()
            }
            
            AnalisadorCSV.analisar(arquivo: arquivo, indices: indices!)
        } catch {
            // TODO: Lidar com o erro de ler o arquivo!
        }
    }
    
    // TODO: Implementar mensagem de erro de importação de arquivo.
//    func exibirAlertaArquivoImportadoComSucesso(nomeArquivo: String) {
//        self.tituloAlerta = "Importação Concluída"
//        self.mensagemAlerta = "O arquivo \"\(nomeArquivo)\" foi importado com sucesso."
//        self.exibirAlerta = true
//    }
}
