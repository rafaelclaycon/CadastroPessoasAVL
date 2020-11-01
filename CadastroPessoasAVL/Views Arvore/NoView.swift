//
//  NoView.swift
//  ArvoreAVL
//
//  Created by Rafael Schmitt on 17/09/20.
//

import SwiftUI

struct NoView: View {
    @State var valor: Int
    @State var fator: Int
    
    let gradiente = LinearGradient(gradient: Gradient(colors: [.azulEscuro, .azulClaro]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        let corFator = fator < -1 || fator > 1 ? Color.red : Color.verdeEscuro
        
        ZStack {
            Circle()
                //.strokeBorder(Color.black, lineWidth: 1)
                .fill(gradiente)
                .frame(width: 50, height: 50, alignment: .center)
            
            Text(String(self.valor))
                .font(.body)
                .foregroundColor(.white)
            
            Text(String(self.fator))
                .font(.body)
                //UIColor(red: 0.15, green: 0.49, blue: 0.86, alpha: 1.00).bold()
                .foregroundColor(corFator)
                .offset(x: -40.0)
        }
    }
}

struct NoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NoView(valor: 1, fator: 0)
            NoView(valor: 10, fator: 0)
            NoView(valor: 999, fator: 0)
        }
        .previewLayout(.fixed(width: 100, height: 80))
    }
}
