//
//  TelaCarregamentoArquivo.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 31/10/20.
//

import SwiftUI

struct TelaCarregamentoArquivo: View {
    
    
    var body: some View {
        Cabecalho()
        
        Spacer()
        
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color(UIColor(red: 0.86, green: 0.95, blue: 1.00, alpha: 1.00)))
                .frame(width: 400, height: 300)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.blue, lineWidth: 1)
                )
            
            Button(action: {
                // your action here
            }) {
                HStack {
                    Image(systemName: "folder.fill.badge.plus")
                    Text("Buscar arquivo")
                }
            }
            //.foregroundColor(.blue)
        }
        
        Spacer()
    }
}
