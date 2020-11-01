//
//  TelaPrincipalViewModel.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 31/10/20.
//

import Combine
import SwiftUI

class TelaPrincipalViewModel: ObservableObject {
    @Published var pessoaSelecionada: Pessoa? = nil
}
