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
    
    static func getDateFrom(_ stringDate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt-br")
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: stringDate)!
    }
    
    static func getISODateFrom(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
}
