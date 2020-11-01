//
//  VisualizacaoArvores.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 01/11/20.
//

import SwiftUI

struct VisualizacaoArvores: View {
    var body: some View {
        DiagramaSubarvore(no: indices.cpf.raiz)
    }
}

struct VisualizacaoArvores_Previews: PreviewProvider {
    static var previews: some View {
        VisualizacaoArvores()
    }
}
