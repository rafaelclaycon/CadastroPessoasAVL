//
//  NoView.swift
//  ArvoreAVL
//
//  Created by Rafael Schmitt on 17/09/20.
//

import SwiftUI

struct NoView: View {
    @State var chave: String
    @State var fator: Int
    
    let gradiente = LinearGradient(gradient: Gradient(colors: [.azulEscuro, .azulClaro]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        let corFator = fator < -1 || fator > 1 ? Color.red : Color.verdeEscuro
        
        ZStack {
            Circle()
                .fill(gradiente)
                .frame(width: 50, height: 50, alignment: .center)
            
            Text(self.chave)
                .font(.body)
                .foregroundColor(.white)
                .background(Color.black.opacity(0.5))
            
            Text(String(self.fator))
                .font(.body)
                .foregroundColor(corFator)
                .offset(x: -35.0, y: -25.0)
        }
    }
}

struct NoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NoView(chave: "1", fator: 0)
            NoView(chave: "10", fator: 0)
            NoView(chave: "999", fator: 0)
        }
        .previewLayout(.fixed(width: 100, height: 80))
    }
}
