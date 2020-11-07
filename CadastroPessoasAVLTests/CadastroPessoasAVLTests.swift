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
        
        arvore.inserir(diego, Pessoa(cpf: "", rg: "", nome: diego, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir(carla, Pessoa(cpf: "", rg: "", nome: carla, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir(carlos, Pessoa(cpf: "", rg: "", nome: carlos, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir(malu, Pessoa(cpf: "", rg: "", nome: malu, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir(caua, Pessoa(cpf: "", rg: "", nome: caua, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir(erick, Pessoa(cpf: "", rg: "", nome: erick, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir(bento, Pessoa(cpf: "", rg: "", nome: bento, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir(renata, Pessoa(cpf: "", rg: "", nome: renata, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir(eduardo, Pessoa(cpf: "", rg: "", nome: eduardo, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir(sandra, Pessoa(cpf: "", rg: "", nome: sandra, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir(marcio, Pessoa(cpf: "", rg: "", nome: marcio, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir(nelson, Pessoa(cpf: "", rg: "", nome: nelson, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir(giovanna, Pessoa(cpf: "", rg: "", nome: giovanna, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir(vicente, Pessoa(cpf: "", rg: "", nome: vicente, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir(carlosCesar, Pessoa(cpf: "", rg: "", nome: carlosCesar, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir(pietra, Pessoa(cpf: "", rg: "", nome: pietra, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir(brenda, Pessoa(cpf: "", rg: "", nome: brenda, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir(elaine, Pessoa(cpf: "", rg: "", nome: elaine, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir(rosangela, Pessoa(cpf: "", rg: "", nome: rosangela, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir(jaqueline, Pessoa(cpf: "", rg: "", nome: jaqueline, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir(marlene, Pessoa(cpf: "", rg: "", nome: marlene, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir(nicolas, Pessoa(cpf: "", rg: "", nome: nicolas, dataNascimento: Date(), nomeCidadeNascimento: ""))
        
        guard let pessoas = arvore.buscarNosQueContem(substring: "ma") else {
            return XCTFail("Nenhuma pessoa retornada.")
        }
        
        XCTAssertEqual(pessoas.count, 3)
    }
    
    // MARK: - Pesquisa por intervalo de datas
    
    func testBuscarPessoasPorDuasDatasDiferentes() throws {
        let arvore = ArvoreAVL()
        
        arvore.inserir("1976-02-15", Pessoa(cpf: "", rg: "", nome: diego, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir("1955-09-20", Pessoa(cpf: "", rg: "", nome: carla, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir("1990-09-18", Pessoa(cpf: "", rg: "", nome: carlos, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir("1972-08-02", Pessoa(cpf: "", rg: "", nome: malu, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir("1967-04-16", Pessoa(cpf: "", rg: "", nome: caua, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir("1993-03-24", Pessoa(cpf: "", rg: "", nome: erick, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir("1980-10-04", Pessoa(cpf: "", rg: "", nome: bento, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir("1974-02-12", Pessoa(cpf: "", rg: "", nome: renata, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir("1977-05-05", Pessoa(cpf: "", rg: "", nome: eduardo, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir("1940-02-21", Pessoa(cpf: "", rg: "", nome: sandra, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir("1944-09-08", Pessoa(cpf: "", rg: "", nome: marcio, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir("1958-04-03", Pessoa(cpf: "", rg: "", nome: nelson, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir("1982-12-15", Pessoa(cpf: "", rg: "", nome: giovanna, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir("1948-08-04", Pessoa(cpf: "", rg: "", nome: vicente, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir("1968-03-06", Pessoa(cpf: "", rg: "", nome: carlosCesar, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir("1990-02-04", Pessoa(cpf: "", rg: "", nome: pietra, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir("1945-04-05", Pessoa(cpf: "", rg: "", nome: brenda, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir("1940-04-15", Pessoa(cpf: "", rg: "", nome: elaine, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir("1977-07-24", Pessoa(cpf: "", rg: "", nome: rosangela, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir("1942-04-07", Pessoa(cpf: "", rg: "", nome: jaqueline, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir("1964-06-20", Pessoa(cpf: "", rg: "", nome: marlene, dataNascimento: Date(), nomeCidadeNascimento: ""))
        arvore.inserir("1996-10-27", Pessoa(cpf: "", rg: "", nome: nicolas, dataNascimento: Date(), nomeCidadeNascimento: ""))
        
        // Busca por todas as pessoas nascidas nos anos 90
        let dataInicialString = "1990-01-01T00:00:00+0000"
        let dataFinalString = "1999-12-31T00:00:00+0000"
        
        let dateFormatter = ISO8601DateFormatter()
        
        let dataInicial = dateFormatter.date(from: dataInicialString)!
        let dataFinal = dateFormatter.date(from: dataFinalString)!
        
        do {
            guard let pessoas = try arvore.buscarPessoasPorIntervaloDeDatas(de: dataInicial, ate: dataFinal) else {
                return XCTFail("Nenhum resultado encontrado.")
            }
            XCTAssertEqual(pessoas.count, 4)
        } catch {
            XCTFail("Erro inesperado: \(error).")
        }
    }
    
    // TODO: Caso de teste: Buscar por pessoas com a mesma data de aniversário
}
