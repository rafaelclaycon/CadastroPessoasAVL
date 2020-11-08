//
//  Cabecalho.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 31/10/20.
//

import SwiftUI

struct Cabecalho: View {
    var imagemPerfil: Image = ImageStore.shared.image(name: "imagem_perfil")
    
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
            
            VStack(alignment: .trailing) {
                HStack {
                    Text("Rafael Claycon Schmitt")
                        .font(.title3)
                        .bold()
                        .padding(.trailing, 6)
                    
                    imagemPerfil
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                }
            }
            .padding(.trailing, 20)
        }
    }
}

struct Cabecalho_Previews: PreviewProvider {
    static var previews: some View {
        Cabecalho()
    }
}
