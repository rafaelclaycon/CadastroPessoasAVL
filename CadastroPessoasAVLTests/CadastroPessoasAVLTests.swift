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
    
    // MARK: - Testes da árvore AVL com inteiros

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
    
    func testRotDuplaADireitaPag19() throws {
        let arvore = ArvoreAVL()
        arvore.inserir("120")
        arvore.inserir("110")
        arvore.inserir("150")
        arvore.inserir("080")
        arvore.inserir("130")
        arvore.inserir("200")
        
        guard let arrayCaminhamentoPosOrdemAntes = arvore.getCaminhamentoPosOrdem() else {
            return XCTFail("Não obteve caminhamento.")
        }
        
        let caminhamentoPosOrdemAntes = arrayCaminhamentoPosOrdemAntes.joined(separator:",")
        
        XCTAssertEqual(caminhamentoPosOrdemAntes, "080,110,130,200,150,120")
        
        arvore.inserir("100")
        
        guard let arrayCaminhamentoPosOrdemDepois = arvore.getCaminhamentoPosOrdem() else {
            return XCTFail("Não obteve caminhamento.")
        }
        
        let caminhamentoPosOrdemDepois = arrayCaminhamentoPosOrdemDepois.joined(separator:",")
        
        XCTAssertEqual(caminhamentoPosOrdemDepois, "080,110,100,130,200,150,120")
    }
    
    // MARK: - Testes da árvore AVL com nomes
    
    func testInserirDiegoCarlaCarlosRotDuplaADireita() throws {
        let arvore = ArvoreAVL()
        arvore.inserir("DIEGO MANUEL EDSON BARBOSA")
        arvore.inserir("CARLA MAYA MARIANA RODRIGUES")
        arvore.inserir("CARLOS EDUARDO MIGUEL LUCAS FERNANDES")
        
        guard let arrayCaminhamentoPosOrdem = arvore.getCaminhamentoPosOrdem() else {
            return XCTFail("Não obteve caminhamento.")
        }
        
        let caminhamentoPosOrdem = arrayCaminhamentoPosOrdem.joined(separator:",")
        
        XCTAssertEqual(caminhamentoPosOrdem, "CARLA MAYA MARIANA RODRIGUES,DIEGO MANUEL EDSON BARBOSA,CARLOS EDUARDO MIGUEL LUCAS FERNANDES")
    }
    
    func testInserirDiegoCarlaCarlosMaluCaua() throws {
        let diego = "DIEGO MANUEL EDSON BARBOSA"
        let carla = "CARLA MAYA MARIANA RODRIGUES"
        let carlos = "CARLOS EDUARDO MIGUEL LUCAS FERNANDES"
        let malu = "MALU ESTER MAYA ROCHA"
        let caua = "CAUA CAUE BARBOSA"
        
        let arvore = ArvoreAVL()
        arvore.inserir(diego)
        arvore.inserir(carla)
        arvore.inserir(carlos)
        arvore.inserir(malu)
        arvore.inserir(caua)
        
        guard let arrayCaminhamentoPosOrdem = arvore.getCaminhamentoPosOrdem() else {
            return XCTFail("Não obteve caminhamento.")
        }
        
        let caminhamentoPosOrdem = arrayCaminhamentoPosOrdem.joined(separator:",")
        
        XCTAssertEqual(caminhamentoPosOrdem, "\(carla),\(caua),\(malu),\(diego),\(carlos)")
    }
    
    func testInserirDiegoCarlaCarlosMaluCauaErick() throws {
        let diego = "DIEGO MANUEL EDSON BARBOSA"
        let carla = "CARLA MAYA MARIANA RODRIGUES"
        let carlos = "CARLOS EDUARDO MIGUEL LUCAS FERNANDES"
        let malu = "MALU ESTER MAYA ROCHA"
        let caua = "CAUA CAUE BARBOSA"
        let erick = "ERICK MARTIN EDSON PEIXOTO"
        
        let arvore = ArvoreAVL()
        arvore.inserir(diego)
        arvore.inserir(carla)
        arvore.inserir(carlos)
        arvore.inserir(malu)
        arvore.inserir(caua)
        arvore.inserir(erick)
        
        guard let arrayCaminhamentoPosOrdem = arvore.getCaminhamentoPosOrdem() else {
            return XCTFail("Não obteve caminhamento.")
        }
        
        let caminhamentoPosOrdem = arrayCaminhamentoPosOrdem.joined(separator:",")
        
        XCTAssertEqual(caminhamentoPosOrdem, "\(carla),\(caua),\(carlos),\(erick),\(malu),\(diego)")
        
        let nomePaiDiego = arvore.buscarChavePai(chave: diego)
        XCTAssertEqual(nomePaiDiego, nil)
        
        guard let nomePaiCarlos = arvore.buscarChavePai(chave: carlos) else {
            return XCTFail("Não obteve a chave do pai.")
        }
        XCTAssertEqual(nomePaiCarlos, diego)
        
        guard let nomePaiMalu = arvore.buscarChavePai(chave: malu) else {
            return XCTFail("Não obteve a chave do pai.")
        }
        XCTAssertEqual(nomePaiMalu, diego)
        
        guard let nomePaiCarla = arvore.buscarChavePai(chave: carla) else {
            return XCTFail("Não obteve a chave do pai.")
        }
        XCTAssertEqual(nomePaiCarla, carlos)
        
        guard let nomePaiCaua = arvore.buscarChavePai(chave: caua) else {
            return XCTFail("Não obteve a chave do pai.")
        }
        XCTAssertEqual(nomePaiCaua, carlos)
        
        guard let nomePaiErick = arvore.buscarChavePai(chave: erick) else {
            return XCTFail("Não obteve a chave do pai.")
        }
        XCTAssertEqual(nomePaiErick, malu)
    }
    
//    func testInserir10Nomes() throws {
//        let arvore = ArvoreAVL()
//        arvore.inserir("DIEGO MANUEL EDSON BARBOSA")
//        arvore.inserir("CARLA MAYA MARIANA RODRIGUES")
//        arvore.inserir("CARLOS EDUARDO MIGUEL LUCAS FERNANDES")
//        arvore.inserir("MALU ESTER MAYA ROCHA")
//        arvore.inserir("CAUA CAUE BARBOSA")
//        arvore.inserir("ERICK MARTIN EDSON PEIXOTO")
//        arvore.inserir("BENTO RENAN PINTO")
//        arvore.inserir("RENATA SIMONE NOVAES")
//        arvore.inserir("EDUARDO BENEDITO CASTRO")
//        arvore.inserir("SANDRA LARA PIRES")
//
//        guard let arrayCaminhamentoPosOrdemAntes = arvore.getCaminhamentoPosOrdem() else {
//            return XCTFail("Não obteve caminhamento.")
//        }
//
//        let caminhamentoPosOrdemAntes = arrayCaminhamentoPosOrdemAntes.joined(separator:",")
//
//        XCTAssertEqual(caminhamentoPosOrdemAntes, "")
//    }
}
