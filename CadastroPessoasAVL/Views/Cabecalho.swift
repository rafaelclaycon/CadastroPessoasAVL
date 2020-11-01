//
//  Cabecalho.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 31/10/20.
//

import SwiftUI

struct Cabecalho: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Cadastro de Pessoas 👩🏾‍🦱👨🏻🧒🏽👵🏽👩🏼")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 1)
                    
                Text("TRABALHO DO GRAU B - ESTRUTURAS AVANÇADAS DE DADOS I")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            .padding()
            .padding(.leading, 10)
            
            Spacer()
            
            Text("Rafael Claycon Schmitt")
                .font(.title3)
                .padding(.trailing, 8)
        }
    }
}

struct Cabecalho_Previews: PreviewProvider {
    static var previews: some View {
        Cabecalho()
    }
}
