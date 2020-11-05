//
//  DocumentPickerView.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 05/11/20.
//

import SwiftUI
import UniformTypeIdentifiers

struct DocumentPickerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let supportedTypes: [UTType] = [UTType.commaSeparatedText]
        let pickerViewController = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes, asCopy: true)
        return pickerViewController
    }

    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {

    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let fileURL = urls.first else {
            fatalError("Arquivo não encontrado.")
        }
        guard fileURL.isFileURL else {
            fatalError("Houve um problema ao processar o arquivo.")
        }
        do {
            let arquivo = try String(contentsOf: fileURL, encoding: .utf8)
            
            AnalisadorCSV.analisar(arquivo: arquivo)
        } catch {
            // TODO: Lidar com o erro de ler o arquivo!
        }
    }
}
