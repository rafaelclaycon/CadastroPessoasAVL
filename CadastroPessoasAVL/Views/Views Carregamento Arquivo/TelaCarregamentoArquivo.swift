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
                    .stroke(Color.gray, lineWidth: 1)
                    .frame(width: 600, height: 300)
                
                VStack {
                    Text("Para começar, importe um arquivo:")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 17)
                    
                    Button(action: {
                        exibirModalImportacaoArquivo = true
                    }) {
                        HStack {
                            Image(systemName: "arrow.down.doc.fill")
                            Text("Importar arquivo CSV")
                        }
                    }
                    .padding(.bottom, 20)
                    
                    Text("Formato esperado: cpf;rg;nome;dataAniversario;cidadeNatal")
                        .foregroundColor(.gray)
                        .padding(.bottom, 45)
                    
                    self.getStatusArquivo()
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
                
                if indices == nil {
                    indices = IndicesArvore()
                } else {
                    indices = nil
                    indices = IndicesArvore()
                }
                
                AnalisadorCSV.analisar(arquivo: conteudoArquivo, indices: indices!)
                
                viewModel.nomeArquivoImportado = selectedFile.lastPathComponent
            } catch {
                // TODO: Implementar alert para exibir mensagem de erro.
            }
        }
        .alert(isPresented: $viewModel.exibirAlerta) {
            Alert(title: Text(viewModel.tituloAlerta), message: Text(viewModel.mensagemAlerta), dismissButton: .default(Text("OK")))
        }
    }
    
    func getStatusArquivo() -> some View {
        if indices == nil {
            return AnyView(HStack {
                Image(systemName: "nosign")
                Text("Nenhum arquivo importado.")
            })
        } else if indices!.quantidadePessoas == 1 {
            return AnyView(HStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                Text("1 pessoa importadas do arquivo \"\(viewModel.nomeArquivoImportado)\".")
            })
        } else {
            return AnyView(HStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                Text("\(indices!.quantidadePessoas) pessoas importadas do arquivo \"\(viewModel.nomeArquivoImportado)\".")
            })
        }
    }
}
