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
    @State var pai: String?
    
    //let gradiente = LinearGradient(gradient: Gradient(colors: [.azulEscuro, .azulClaro]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    let raioNo: CGFloat = 40.0
    
    var body: some View {
        let corFator = fator < -1 || fator > 1 ? Color.red : Color.verdeEscuro
        
        ZStack {
            Circle()
                .strokeBorder(Color.blue, lineWidth: 1.5)
                //.fill(gradiente)
                .frame(width: raioNo, height: raioNo, alignment: .center)
                //.opacity(0.6)
            
            Text(self.chave)
                .font(.footnote)
                .bold()
                .foregroundColor(.white)
                .background(Color.black.opacity(0.65))
                .frame(width: 100, height: 20)
                .truncationMode(.tail)
            
            Text(String(self.fator))
                .font(.footnote)
                .foregroundColor(corFator)
                .offset(x: -25.0, y: -25.0)
            
            Text(String(self.pai ?? ""))
                .font(.footnote)
                .foregroundColor(.gray)
                .offset(y: -30.0)
        }
    }
}

struct NoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NoView(chave: "1994-07-19", fator: 0, pai: "19")
            NoView(chave: "57309454421", fator: 0, pai: nil)
            NoView(chave: "CARLOS EDUARDO MIGUEL LUCAS FERNANDES", fator: 0, pai: "CA")
            NoView(chave: "CARLA MAYA MARIANA RODRIGUES", fator: 0, pai: "DI")
        }
        .previewLayout(.fixed(width: 500, height: 100))
    }
}
