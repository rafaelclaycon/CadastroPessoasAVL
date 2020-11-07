//
//  CadastroPessoasAVLTests.swift
//  CadastroPessoasAVLTests
//
//  Created by Rafael Schmitt on 31/10/20.
//

import XCTest
@testable import CadastroPessoasAVL

class CadastroPessoasAVLTests: XCTestCase {
    
    // Massa de testes
    let diego = "DIEGO MANUEL EDSON BARBOSA"
    let carla = "CARLA MAYA MARIANA RODRIGUES"
    let carlos = "CARLOS EDUARDO MIGUEL LUCAS FERNANDES"
    let malu = "MALU ESTER MAYA ROCHA"
    let caua = "CAUA CAUE BARBOSA"
    let erick = "ERICK MARTIN EDSON PEIXOTO"
    let bento = "BENTO RENAN PINTO"
    let renata = "RENATA SIMONE NOVAES"
    let eduardo = "EDUARDO BENEDITO CASTRO"
    let sandra = "SANDRA LARA PIRES"
    let marcio = "MARCIO LEVI VIEIRA"
    let nelson = "NELSON LUAN VIANA"
    let giovanna = "GIOVANNA GABRIELA BARROS"
    let vicente = "VICENTE HENRY FILIPE SOUZA"
    let carlosCesar = "CARLOS CESAR ANTONIO NOVAES"
    let pietra = "PIETRA LUCIANA NOGUEIRA"
    let brenda = "BRENDA SOPHIE CARVALHO"
    let elaine = "ELAINE EMANUELLY JAQUELINE SILVEIRA"
    let rosangela = "ROSANGELA FABIANA LAURA BAPTISTA"
    let jaqueline = "JAQUELINE BARBARA ASSIS"
    let marlene = "MARLENE CLAUDIA MANUELA PORTO"
    let nicolas = "NICOLAS ANDRE FIGUEIREDO"

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
        
        arvore.inserir(diego)
        arvore.inserir(carla)
        arvore.inserir(carlos)
        
        guard let arrayCaminhamentoPosOrdem = arvore.getCaminhamentoPosOrdem() else {
            return XCTFail("Não obteve caminhamento.")
        }
        
        let caminhamentoPosOrdem = arrayCaminhamentoPosOrdem.joined(separator:",")
        
        XCTAssertEqual(caminhamentoPosOrdem, "\(carla),\(diego),\(carlos)")
    }
    
    func testInserirDiegoCarlaCarlosMaluCaua() throws {
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
    
    func testInserirDiegoCarlaCarlosMaluCauaErickBento() throws {
        let arvore = ArvoreAVL()
        
        arvore.inserir(diego)
        arvore.inserir(carla)
        arvore.inserir(carlos)
        arvore.inserir(malu)
        arvore.inserir(caua)
        arvore.inserir(erick)
        arvore.inserir(bento)
        
        guard let arrayCaminhamentoPosOrdem = arvore.getCaminhamentoPosOrdem() else {
            return XCTFail("Não obteve caminhamento.")
        }
        
        let caminhamentoPosOrdem = arrayCaminhamentoPosOrdem.joined(separator:",")
        
        XCTAssertEqual(caminhamentoPosOrdem, "\(bento),\(carla),\(caua),\(carlos),\(erick),\(malu),\(diego)")
        
        // Checa os pais
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
        
        guard let nomePaiBento = arvore.buscarChavePai(chave: bento) else {
            return XCTFail("Não obteve a chave do pai.")
        }
        XCTAssertEqual(nomePaiBento, carla)
    }
    
    func testInserirDiegoCarlaCarlosMaluCauaErickBentoRenata() throws {
        let arvore = ArvoreAVL()
        
        arvore.inserir(diego)
        arvore.inserir(carla)
        arvore.inserir(carlos)
        arvore.inserir(malu)
        arvore.inserir(caua)
        arvore.inserir(erick)
        arvore.inserir(bento)
        arvore.inserir(renata)
        
        guard let arrayCaminhamentoPosOrdem = arvore.getCaminhamentoPosOrdem() else {
            return XCTFail("Não obteve caminhamento.")
        }
        
        let caminhamentoPosOrdem = arrayCaminhamentoPosOrdem.joined(separator:",")
        
        XCTAssertEqual(caminhamentoPosOrdem, "\(bento),\(carla),\(caua),\(carlos),\(erick),\(renata),\(malu),\(diego)")
    }
    
    func testInserirDiegoCarlaCarlosMaluCauaErickBentoRenataEduardo() throws {
        let arvore = ArvoreAVL()
        
        arvore.inserir(diego)
        arvore.inserir(carla)
        arvore.inserir(carlos)
        arvore.inserir(malu)
        arvore.inserir(caua)
        arvore.inserir(erick)
        arvore.inserir(bento)
        arvore.inserir(renata)
        arvore.inserir(eduardo)
        
        guard let arrayCaminhamentoPosOrdem = arvore.getCaminhamentoPosOrdem() else {
            return XCTFail("Não obteve caminhamento.")
        }
        
        let caminhamentoPosOrdem = arrayCaminhamentoPosOrdem.joined(separator:",")
        
        XCTAssertEqual(caminhamentoPosOrdem, "\(bento),\(carla),\(caua),\(carlos),\(eduardo),\(erick),\(renata),\(malu),\(diego)")
    }
    
    func testInserirDiegoCarlaCarlosMaluCauaErickBentoRenataEduardoSandra() throws {
        let arvore = ArvoreAVL()
        
        arvore.inserir(diego)
        arvore.inserir(carla)
        arvore.inserir(carlos)
        arvore.inserir(malu)
        arvore.inserir(caua)
        arvore.inserir(erick)
        arvore.inserir(bento)
        arvore.inserir(renata)
        arvore.inserir(eduardo)
        arvore.inserir(sandra)
        
        guard let arrayCaminhamentoPosOrdem = arvore.getCaminhamentoPosOrdem() else {
            return XCTFail("Não obteve caminhamento.")
        }
        
        let caminhamentoPosOrdem = arrayCaminhamentoPosOrdem.joined(separator:",")
        
        XCTAssertEqual(caminhamentoPosOrdem, "\(bento),\(carla),\(caua),\(carlos),\(eduardo),\(erick),\(sandra),\(renata),\(malu),\(diego)")
    }
    
    func testBuscarPorMa() throws {
        let arvore = ArvoreAVL()
        
        arvore.inserir(diego)
        arvore.inserir(carla)
        arvore.inserir(carlos)
        arvore.inserir(malu)
        arvore.inserir(caua)
        arvore.inserir(erick)
        arvore.inserir(bento)
        arvore.inserir(renata)
        arvore.inserir(eduardo)
        arvore.inserir(sandra)
        arvore.inserir(marcio)
        arvore.inserir(nelson)
        arvore.inserir(giovanna)
        arvore.inserir(vicente)
        arvore.inserir(carlosCesar)
        arvore.inserir(pietra)
        arvore.inserir(brenda)
        arvore.inserir(elaine)
        arvore.inserir(rosangela)
        arvore.inserir(jaqueline)
        arvore.inserir(marlene)
        arvore.inserir(nicolas)
        
        guard let pessoas = arvore.buscarNosQueContem(substring: "ma") else {
            return XCTFail("Nenhuma pessoa retornada.")
        }
        
        XCTAssertEqual(pessoas.count, 3)
    }
}
