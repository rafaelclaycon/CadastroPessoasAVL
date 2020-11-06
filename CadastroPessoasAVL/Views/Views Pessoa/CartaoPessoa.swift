//
//  CartaoPessoa.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 02/11/20.
//

import SwiftUI

struct CartaoPessoa: View {
    @ObservedObject var viewModel: CartaoPessoaViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.blue)
                .frame(width: 500, height: 180)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 25)
//                        .stroke(Color.blue, lineWidth: 1)
//                )
            
            VStack(alignment: .leading) {
                Text(viewModel.nome)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 400, height: 20)
                    .truncationMode(.tail)
                    .padding(.bottom, 2)
                HStack {
                    VStack(alignment: .leading) {
                        Text("RG")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .bold()
                            .opacity(0.8)
                        Text(viewModel.rg)
                            .foregroundColor(.white)
                            .bold()
                    }
                    VStack(alignment: .leading) {
                        Text("CPF")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .bold()
                            .opacity(0.8)
                        Text(viewModel.cpf)
                            .foregroundColor(.white)
                            .bold()
                    }.padding(.leading, 65)
                }.padding(.bottom, 2)
                
                HStack {
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
    }
}

struct CartaoPessoa_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CartaoPessoa(viewModel: CartaoPessoaViewModel(pessoa: Pessoa(cpf: "71828160245", rg: "448284224", nome: "Clarice Marcela da Rosa", dataNascimento: Date(), nomeCidadeNascimento: "Itatiba")))
            CartaoPessoa(viewModel: CartaoPessoaViewModel(pessoa: Pessoa(cpf: "13598557698", rg: "467532953", nome: "Diego Manuel Edson Barbosa", dataNascimento: Date(), nomeCidadeNascimento: "Luziânia")))
        }.previewLayout(.fixed(width: 480, height: 220))
    }
}
