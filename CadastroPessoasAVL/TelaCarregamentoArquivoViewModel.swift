//
//  TelaCarregamentoArquivoViewModel.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 01/11/20.
//

import Combine
import SwiftUI

class TelaCarregamentoArquivoViewModel: ObservableObject {
    func processarArquivo() {
        guard let fileURL = Bundle.main.url(forResource: "Pessoas", withExtension: "csv") else {
            fatalError("Arquivo não encontrado.")
        }
        do {
            let arquivo = try String(contentsOf: fileURL, encoding: .utf8)
            
            let lines = arquivo.split(separator: "\n")
            for line in lines {
                print(line)
            }
        } catch {
            // TODO: Lidar com o erro de ler o arquivo!
        }
    }
}
