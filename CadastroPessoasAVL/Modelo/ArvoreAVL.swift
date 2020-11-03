//
//  ArvoreAVL.swift
//  CadastroPessoasAVL
//
//  Created by Rafael Schmitt on 31/10/20.
//

import Foundation

class ArvoreAVL {
    var raiz: No? = nil
    
    var arvoreVazia: Bool {
        return raiz == nil
    }
    //private var nosConsultados = [String]()
    private var caminhamento = [String]()
    
    // MARK: - Inserção
    func inserir(_ chave: String, _ dados: Pessoa) {
        if raiz == nil {
            raiz = No(pai: nil, esquerda: nil, direita: nil, chave: chave, dados: dados)
            print("O número \(chave) foi inserido.")
        } else {
            if chave < raiz!.chave {
                if raiz?.esquerda == nil {
                    raiz?.esquerda = No(pai: raiz, esquerda: nil, direita: nil, chave: chave, dados: dados)
                    print("O número \(chave) foi inserido.")
                } else {
                    inserirEmSubarvore((raiz?.esquerda)!, chave, dados)
                }
            } else if chave > raiz!.chave {
                if raiz?.direita == nil {
                    raiz?.direita = No(pai: raiz, esquerda: nil, direita: nil, chave: chave, dados: dados)
                    print("O número \(chave) foi inserido.")
                } else {
                    inserirEmSubarvore((raiz?.direita)!, chave, dados)
                }
            } else {
                print("O número \(chave) já existe na árvore.")
            }
        }
        verificarBalanceamento(raiz, balancear: true)
    }
    
    func inserirEmSubarvore(_ raiz: No, _ chave: String, _ dados: Pessoa) {
        if chave < raiz.chave {
            if raiz.esquerda == nil {
                raiz.esquerda = No(pai: raiz, esquerda: nil, direita: nil, chave: chave, dados: dados)
                print("O número \(chave) foi inserido.")
            } else {
                inserirEmSubarvore((raiz.esquerda)!, chave, dados)
            }
        } else if chave > raiz.chave {
            if raiz.direita == nil {
                raiz.direita = No(pai: raiz, esquerda: nil, direita: nil, chave: chave, dados: dados)
                print("O número \(chave) foi inserido.")
            } else {
                inserirEmSubarvore((raiz.direita)!, chave, dados)
            }
        } else {
            print("O número \(chave) já existe na árvore.")
        }
    }
    
    // MARK: - Balanceamento
    func verificarBalanceamento(_ no: No?, balancear: Bool) {
        guard let noAtual = no else {
            return
        }
        
        verificarBalanceamento(noAtual.esquerda, balancear: balancear)
        verificarBalanceamento(noAtual.direita, balancear: balancear)
        
        print("\(noAtual.chave) consultado para balanceamento. F: \(noAtual.fatorBalanceamento)")
        
        if (noAtual.fatorBalanceamento < -1) || (noAtual.fatorBalanceamento > 1) {
            print("Nó \(noAtual.chave) necessita balanceamento!")
            
            // Rotação Simples à Direita
            // Toda vez que uma sub-árvore fica com um fator
            // POSITIVO e sua sub-árvore da esquerda também tem um fator POSITIVO
            
            // Rotação Dupla à Direita
            // Toda vez que uma sub-árvore fica com um fator
            // POSITIVO e sua sub-árvore da esquerda também tem um fator NEGATIVO
            
            if noAtual.fatorBalanceamento > 1 {
                if noAtual.esquerda!.fatorBalanceamento > 0 {
                    print("Rotação Simples à Direita")

                    if balancear {
                        rotacaoSimplesADireita(noAtual)
                        print("Rotação Simples à Direita aplicada.")
                    } else {
                        print("Executaria uma Rotação Simples à Direita no nó \(noAtual.chave).")
                    }
                } else if noAtual.esquerda!.fatorBalanceamento < 0 {
                    print("Rotação Dupla à Direita")
                    
                    if balancear {
                        rotacaoDuplaADireita(noAtual)
                        print("Rotação Dupla à Direita aplicada.")
                    } else {
                        print("Executaria uma Rotação Dupla à Direita no nó \(noAtual.chave).")
                    }
                }
            }
            
            // Rotação Simples à Esquerda
            // Toda vez que uma sub-árvore fica com um fator
            // NEGATIVO e sua sub-árvore da direita também tem um fator NEGATIVO
            
            // Rotação Dupla à Esquerda
            // Toda vez que uma sub-árvore fica com um fator
            // NEGATIVO e sua sub-árvore da direita também tem um fator POSITIVO
            
            if noAtual.fatorBalanceamento < -1 {
                if noAtual.direita!.fatorBalanceamento > 0 {
                    print("Rotação Dupla à Esquerda")
                    
                    if balancear {
                        rotacaoDuplaAEsquerda(noAtual)
                        print("Rotação Dupla à Esquerda aplicada.")
                    } else {
                        print("Executaria uma Rotação Dupla à Esquerda no nó \(noAtual.chave).")
                    }
                } else if noAtual.direita!.fatorBalanceamento < 0 {
                    print("Rotação Simples à Esquerda")
                    
                    if balancear {
                        rotacaoSimplesAEsquerda(noAtual)
                        print("Rotação Simples à Esquerda aplicada.")
                    } else {
                        print("Executaria uma Rotação Simples à Esquerda no nó \(noAtual.chave).")
                    }
                }
            }
        }
    }
    
    func rotacaoSimplesAEsquerda(_ a: No) {
        // b - com certeza existe
        let b = a.direita!
        // c
        let c = b.direita
        // d
        let d = b.esquerda
        
        imprimirVariavelAuxiliar(a, "a")
        imprimirVariavelAuxiliar(b, "b")
        imprimirVariavelAuxiliar(c, "c")
        imprimirVariavelAuxiliar(d, "d")
        
        if a.isRaiz {
            self.raiz = b
        } else {
            switch a.orientacaoEmRelacaoAoPai {
            case .esquerda:
                a.pai!.esquerda = b
            default:
                a.pai!.direita = b
            }
        }
        
        b.pai = a.pai
        a.pai = b
        
        a.direita = d
        b.esquerda = a
    }
    
    func rotacaoSimplesADireita(_ k2: No) {
        // k1 - com certeza existe
        let k1 = k2.esquerda!
        // x
        let x = k1.esquerda
        // y
        let y = k1.direita
        // z
        let z = k2.direita
        
        imprimirVariavelAuxiliar(k2, "k2")
        imprimirVariavelAuxiliar(k1, "k1")
        imprimirVariavelAuxiliar(x, "x")
        imprimirVariavelAuxiliar(y, "y")
        imprimirVariavelAuxiliar(z, "z")
        
        if k2.isRaiz {
            self.raiz = k1
        } else {
            switch k2.orientacaoEmRelacaoAoPai {
            case .esquerda:
                k2.pai!.esquerda = k1
            default:
                k2.pai!.direita = k1
            }
        }
        
        k1.pai = k2.pai
        k2.pai = k1
        
        k1.esquerda = x
        k1.direita = k2
        
        k2.esquerda = y
        k2.direita = z
        
        y?.pai = k2
        z?.pai = k2
    }
    
    func rotacaoDuplaADireita(_ k3: No) {
        let k1 = k3.esquerda!
        let k2 = k1.direita!
        //let a = k1.esquerda
        let b = k2.esquerda
        let c = k2.direita
        //let d = k3.direita
        
        if k3.isRaiz {
            self.raiz = k2
        } else {
            switch k3.orientacaoEmRelacaoAoPai {
            case .esquerda:
                k3.pai!.esquerda = k2
            default:
                k3.pai!.direita = k2
            }
        }
        
        // Rotação esquerda
        k3.esquerda = k2
        
        k2.pai = k3
        k2.esquerda = k1
        
        k1.pai = k2
        k1.direita = b
        
        // Rotação direita
        k2.pai = k3.pai
        k2.direita = k3
        
        k3.pai = k2
        k3.esquerda = c
    }
    
    func rotacaoDuplaAEsquerda(_ k1: No) {
        let k3 = k1.direita!
        let k2 = k3.esquerda!
        let a = k1.esquerda
        let b = k2.esquerda
        let c = k2.direita
        let d = k3.direita
        
        imprimirVariavelAuxiliar(k1, "k1")
        imprimirVariavelAuxiliar(k2, "k2")
        imprimirVariavelAuxiliar(k3, "k3")
        imprimirVariavelAuxiliar(a, "a")
        imprimirVariavelAuxiliar(b, "b")
        imprimirVariavelAuxiliar(c, "c")
        imprimirVariavelAuxiliar(d, "d")
        
        // Rotação direita
        k1.direita = k2
        k2.pai = k1
        
        k2.direita = k3
        k3.pai = k2
        
        k3.esquerda = c
        c?.pai = k3
        
        // Rotação esquerda
        switch k1.orientacaoEmRelacaoAoPai {
        case .esquerda:
            k1.pai?.esquerda = k2
        case .direita:
            k1.pai?.direita = k2
        case .nenhuma:
            self.raiz = k2
        }
        k2.pai = k1.pai
        
        k2.esquerda = k1
        k1.pai = k2
        
        k1.direita = b
        b?.pai = k1
    }
    
    // MARK: - Busca
    func buscar(chave: String) -> Pessoa? {
        if raiz != nil {
            //self.nosConsultados.append("\(raiz!.chave)")
            
            if chave == raiz!.chave {
                return raiz!.dados
            } else {
                var no: No?
                if chave < raiz!.chave {
                    no = raiz!.esquerda
                } else {
                    no = raiz!.direita
                }
                
                let encontrado = buscarNaSubarvore(chave, no)
                
                if encontrado != nil {
                    return encontrado
                } else {
                    return nil
                }
            }
            // Limpa o array que guarda o caminho percorrido pela pesquisa.
            //self.nosConsultados.removeAll()
        }
        return nil
    }
    
    func buscarNaSubarvore(_ chave: String, _ no: No?) -> Pessoa? {
        guard let no = no else {
            return nil
        }
        
        //self.nosConsultados.append("\(no.chave)")
        
        if chave < no.chave {
            return buscarNaSubarvore(chave, no.esquerda)
        } else if chave > no.chave {
            return buscarNaSubarvore(chave, no.direita)
        }
        return no.dados
    }
    
    // MARK: - Remoção
    func remover(_ chave: String) {
        guard let noASerRemovido = getNo(comChave: chave, aPartirDe: raiz) else {
            return print("⛔️  Não é possível remover o número \(chave) pois ele não está na árvore.")
        }
        
        // Caso 1: O nó a ser removido é um nó folha.
        if (noASerRemovido.esquerda == nil) && (noASerRemovido.direita == nil) {
            if noASerRemovido.chave == raiz?.chave {
                raiz = nil
            } else {
                switch noASerRemovido.orientacaoEmRelacaoAoPai {
                case .esquerda:
                    noASerRemovido.pai?.esquerda = nil
                default:
                    noASerRemovido.pai?.direita = nil
                }
            }
            print("💀  O número \(chave) foi removido.")
            
        // Caso 2: O nó a ser removido só tem 1 filho.
        } else if (noASerRemovido.esquerda == nil) || (noASerRemovido.direita == nil) {
            var filho: No? = nil
            if noASerRemovido.esquerda != nil {
                filho = noASerRemovido.esquerda!
            } else if noASerRemovido.direita != nil {
                filho = noASerRemovido.direita!
            }
            
            if noASerRemovido.chave == raiz?.chave {
                raiz = filho
                filho!.pai = nil
            } else {
                switch noASerRemovido.orientacaoEmRelacaoAoPai {
                case .esquerda:
                    noASerRemovido.pai?.esquerda = filho
                default:
                    noASerRemovido.pai?.direita = filho
                }
                filho!.pai = noASerRemovido.pai
            }
            print("💀  O número \(chave) foi removido.")
            
        // Caso 3: O nó a ser removido tem 2 filhos.
        } else if (noASerRemovido.esquerda != nil) && (noASerRemovido.direita != nil) {
            let sucessorEmOrdem = getMenorADireita(noASerRemovido.direita!)
            remover(sucessorEmOrdem.chave)
            
            sucessorEmOrdem.pai = noASerRemovido.pai
            sucessorEmOrdem.esquerda = noASerRemovido.esquerda
            sucessorEmOrdem.direita = noASerRemovido.direita
            
            if noASerRemovido.chave == raiz?.chave {
                raiz = sucessorEmOrdem
            } else {
                switch noASerRemovido.orientacaoEmRelacaoAoPai {
                case .esquerda:
                    noASerRemovido.pai?.esquerda = sucessorEmOrdem
                default:
                    noASerRemovido.pai?.direita = sucessorEmOrdem
                }
            }
            print("💀  O número \(chave) foi removido.")
        }
        
        verificarBalanceamento(raiz, balancear: true)
    }
    
    func getNo(comChave chave: String, aPartirDe no: No?) -> No? {
        guard let no = no else {
            return nil
        }
                
        if chave < no.chave {
            return getNo(comChave: chave, aPartirDe: no.esquerda)
        } else if chave > no.chave {
            return getNo(comChave: chave, aPartirDe: no.direita)
        }
        return no
    }
    
    func getMenorADireita(_ no: No) -> No {
        var atual = no
        while (atual.esquerda != nil) {
            atual = atual.esquerda!
        }
        return atual
    }
    
    // MARK: - Caminhamento
    
    func exibirCaminhamentoPreOrdem() {
        guard let raiz = raiz else {
            return print("Não é possível exibir o caminhamento pois a árvore está vazia.")
        }
        if !self.caminhamento.isEmpty {
            self.caminhamento.removeAll()
        }
        subarvorePreOrdem(raiz)
        print("🥾  Caminhamento em Pré-Ordem: " + self.caminhamento.joined(separator: ", "))
    }
    
    func exibirCaminhamentoPosOrdem() {
        guard let raiz = raiz else {
            return print("Não é possível exibir o caminhamento pois a árvore está vazia.")
        }
        if !self.caminhamento.isEmpty {
            self.caminhamento.removeAll()
        }
        subarvorePosOrdem(raiz)
        print("🥾  Caminhamento em Pós-Ordem: " + self.caminhamento.joined(separator: ", "))
    }
    
    func exibirCaminhamentoEmOrdem() {
        guard let raiz = raiz else {
            return print("Não é possível exibir o caminhamento pois a árvore está vazia.")
        }
        if !self.caminhamento.isEmpty {
            self.caminhamento.removeAll()
        }
        subarvoreEmOrdem(raiz)
        print("🥾  Caminhamento Em Ordem: " + self.caminhamento.joined(separator: ", "))
    }
    
    func subarvorePreOrdem(_ no: No?) {
        guard let no = no else {
            return
        }
        caminhamento.append("\(no.chave)")
        subarvorePreOrdem(no.esquerda)
        subarvorePreOrdem(no.direita)
    }
    
    func subarvorePosOrdem(_ no: No?) {
        guard let no = no else {
            return
        }
        subarvorePosOrdem(no.esquerda)
        subarvorePosOrdem(no.direita)
        caminhamento.append("\(no.chave)")
    }
    
    func subarvoreEmOrdem(_ no: No?) {
        guard let no = no else {
            return
        }
        subarvoreEmOrdem(no.esquerda)
        caminhamento.append("\(no.chave)")
        subarvoreEmOrdem(no.direita)
    }
    
    // MARK: - Funções auxiliares
    func imprimirVariavelAuxiliar(_ variavel: No?, _ nome: String) {
        guard let variavel = variavel else {
            return print(nome + ": -")
        }
        print(nome + ": \(variavel.chave)")
    }
}
