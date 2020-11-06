//
//  Utils.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 05/11/20.
//

import Foundation

class Utils {
    static func getStringNormalizada(_ texto: String) -> String {
        return texto.uppercased().folding(options: .diacriticInsensitive, locale: .current)
    }
}
