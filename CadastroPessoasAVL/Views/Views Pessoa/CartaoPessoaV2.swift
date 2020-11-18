//
//  CartaoPessoa.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 02/11/20.
//

import SwiftUI

struct CartaoPessoaV2: View {
    @ObservedObject var viewModel: CartaoPessoaV2ViewModel
    
    let gradiente = LinearGradient(gradient: Gradient(colors: [.azul, .azul, .azulClaro]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(gradiente)
                .frame(width: 500, height: 180)
            
            // HStack de fora
            HStack {
                VStack(alignment: .leading) {
                    Text(viewModel.nome)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.bottom, 8)
                    
                    HStack {
                        // 1º VStack interno
                        VStack(alignment: .leading) {
                            VStack(alignment: .leading) {
                                Text("RG")
                                    .foregroundColor(.white)
                                    .font(.footnote)
                                    .bold()
                                    .opacity(0.8)
                                Text(viewModel.rg)
                                    .foregroundColor(.white)
                                    .bold()
                            }.padding(.bottom, 4)
                            
                            VStack(alignment: .leading) {
                                Text("DATA DE NASCIMENTO")
                                    .foregroundColor(.white)
                                    .font(.footnote)
                                    .bold()
                                    .opacity(0.8)
                                Text(viewModel.dataNascimento)
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        }
                        
                        // 2º VStack interno
                        VStack(alignment: .leading) {
                            VStack(alignment: .leading) {
                                Text("CPF")
                                    .foregroundColor(.white)
                                    .font(.footnote)
                                    .bold()
                                    .opacity(0.8)
                                Text(viewModel.cpf)
                                    .foregroundColor(.white)
                                    .bold()
                            }
                            .padding(.leading)
                            .padding(.bottom, 4)
                            
                            VStack(alignment: .leading) {
                                Text("CIDADE NATAL")
                                    .foregroundColor(.white)
                                    .font(.footnote)
                                    .bold()
                                    .opacity(0.8)
                                Text(viewModel.nomeCidadeNascimento)
                                    .foregroundColor(.white)
                                    .bold()
                            }.padding(.leading)
                        }
                    }
                }
                .padding(.leading, 60)
                
                Spacer()
            }
            
            Image(systemName: "person.fill")
                .foregroundColor(.white)
                .font(.largeTitle)
                .offset(x: 210, y: 50)
        }
    }
}

struct CartaoPessoaV2_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CartaoPessoaV2(viewModel: CartaoPessoaV2ViewModel(pessoa: Pessoa(cpf: "71828160245", rg: "448284224", nome: "Clarice Marcela da Rosa", dataNascimento: Date(), nomeCidadeNascimento: "Itatiba")))
            CartaoPessoaV2(viewModel: CartaoPessoaV2ViewModel(pessoa: Pessoa(cpf: "13598557698", rg: "467532953", nome: "Diego Manuel Edson Barbosa", dataNascimento: Date(), nomeCidadeNascimento: "Luziânia")))
        }.previewLayout(.fixed(width: 560, height: 220))
    }
}
