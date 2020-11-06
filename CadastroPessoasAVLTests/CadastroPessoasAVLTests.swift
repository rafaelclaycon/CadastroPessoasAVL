//
//  CadastroPessoasAVLTests.swift
//  CadastroPessoasAVLTests
//
//  Created by Rafael Schmitt on 31/10/20.
//

import XCTest
@testable import CadastroPessoasAVL

class CadastroPessoasAVLTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // 04_Árvore_AVL.pdf - pág. 12
    func testRotSimplesADireitaPag12() throws {
        let arvore = ArvoreAVL()
        arvore.inserir("120")
        arvore.inserir("110")
        arvore.inserir("150")
        arvore.inserir("100")
        arvore.inserir("130")
        arvore.inserir("200")
        
        guard let arrayCaminhamentoPosOrdemAntes = arvore.getCaminhamentoPosOrdem() else {
            return XCTFail("Não obteve caminhamento.")
        }
        
        let caminhamentoPosOrdemAntes = arrayCaminhamentoPosOrdemAntes.joined(separator:",")
        
        XCTAssertEqual(caminhamentoPosOrdemAntes, "100,110,130,200,150,120")
        
        arvore.inserir("080")
        
        guard let arrayCaminhamentoPosOrdemDepois = arvore.getCaminhamentoPosOrdem() else {
            return XCTFail("Não obteve caminhamento.")
        }
        
        let caminhamentoPosOrdemDepois = arrayCaminhamentoPosOrdemDepois.joined(separator:",")
        
        XCTAssertEqual(caminhamentoPosOrdemDepois, "080,110,100,130,200,150,120")
    }
    
    func testRotSimplesADireitaPag14() throws {
        let arvore = ArvoreAVL()
        arvore.inserir("42")
        arvore.inserir("15")
        arvore.inserir("88")
        arvore.inserir("06")
        arvore.inserir("27")
        
        guard let arrayCaminhamentoPosOrdemAntes = arvore.getCaminhamentoPosOrdem() else {
            return XCTFail("Não obteve caminhamento.")
        }
        
        let caminhamentoPosOrdemAntes = arrayCaminhamentoPosOrdemAntes.joined(separator:",")
        
        XCTAssertEqual(caminhamentoPosOrdemAntes, "06,27,15,88,42")
        
        arvore.inserir("04")
        
        guard let arrayCaminhamentoPosOrdemDepois = arvore.getCaminhamentoPosOrdem() else {
            return XCTFail("Não obteve caminhamento.")
        }
        
        let caminhamentoPosOrdemDepois = arrayCaminhamentoPosOrdemDepois.joined(separator:",")
        
        XCTAssertEqual(caminhamentoPosOrdemDepois, "04,06,27,88,42,15")
    }
}
