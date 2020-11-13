//
//  TelaCarregamentoArquivo.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 31/10/20.
//

import SwiftUI

struct TelaCarregamentoArquivo: View {
    @ObservedObject var viewModel: TelaCarregamentoArquivoViewModel
    @State private var exibirModalImportacaoArquivo: Bool = false
    
    var body: some View {
        VStack {
            Cabecalho()
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color(UIColor(red: 0.86, green: 0.95, blue: 1.00, alpha: 1.00)))
                    .frame(width: 600, height: 300)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.blue, lineWidth: 1)
                    )
                
                VStack {
                    Button(action: {
                        exibirModalImportacaoArquivo = true
                    }) {
                        HStack {
                            Image(systemName: "arrow.down.doc.fill")
                            Text("Importar arquivo CSV")
                        }
                    }
                }
            }
            
            Spacer()
            
            Button(action: {
                viewModel.processarArquivoInterno()
            }) {
                HStack {
                    Image(systemName: "doc.badge.gearshape.fill")
                    Text("Carregar arquivo interno de testes")
                }
            }
            
            Spacer()
        }
        .fileImporter(
            isPresented: $exibirModalImportacaoArquivo,
            allowedContentTypes: [.commaSeparatedText],
            allowsMultipleSelection: false
        ) { result in
            do {
                guard let selectedFile: URL = try result.get().first else { return }
                guard let conteudoArquivo = String(data: try Data(contentsOf: selectedFile), encoding: .utf8) else { return }
                
                AnalisadorCSV.analisar(arquivo: conteudoArquivo)
                
                viewModel.exibirAlertaArquivoImportadoComSucesso(nomeArquivo: selectedFile.lastPathComponent)
            } catch {
                // TODO: Implementar alert para exibir mensagem de erro.
            }
        }
        .alert(isPresented: $viewModel.exibirAlerta) {
            Alert(title: Text(viewModel.tituloAlerta), message: Text(viewModel.mensagemAlerta), dismissButton: .default(Text("OK")))
        }
    }
}
