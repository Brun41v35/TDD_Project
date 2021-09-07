//
//  AvaliadorTests.swift
//  LeilaoTests
//
//  Created by Bruno Silva on 05/09/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import XCTest
@testable import Leilao

class AvaliadorTests: XCTestCase {
    
    //MARK: - Variables
    var leiloeiro: Avaliador!
    private var joao: Usuario!
    private var jose: Usuario!
    private var maria: Usuario!
    
    //MARK: Utilizamos esse método antes dos testes
    override func setUpWithError() throws {
        initializeVariables()
    }

    //MARK: Utilizamos esse método depois dos testes
    override func tearDownWithError() throws {
        
    }
    
    //MARK: - Functions
    private func initializeVariables() {
        joao = Usuario(nome: "Joao")
        jose = Usuario(nome: "Jose")
        maria = Usuario(nome: "Maria")
        leiloeiro = Avaliador()
    }
    
    //MARK: - Test Functions
    func testDeveEntenderLancesEmOrdemCrescente() {
        
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(maria, 250.0))
        leilao.propoe(lance: Lance(joao, 300.0))
        leilao.propoe(lance: Lance(jose, 400.0))
        
        leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(250.00, leiloeiro.menorLance())
        XCTAssertEqual(400.00, leiloeiro.maiorLance())
    }
    
    func testDeveEntederLeilaoComApenasUmLance() {
        
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(joao, 1000.0))
        
        leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(1000.0, leiloeiro.menorLance())
        XCTAssertEqual(1000.0, leiloeiro.maiorLance())
    }
    
    func testeDeveEncontrarOsTresMaioresLances() {
        let leilao = CriadorDeLeilao()
            .para(descricao: "Playstation 4")
            .lance(joao, 300.0)
            .lance(maria, 400.0)
            .lance(joao, 500.0)
            .lance(joao, 600.0)
            .constroi()
        
        leiloeiro.avalia(leilao: leilao)
        
        let listaLances = leiloeiro.tresMaiores()
        
        XCTAssertEqual(3, listaLances.count)
        XCTAssertEqual(500.0, listaLances[0].valor)
        XCTAssertEqual(400.0, listaLances[1].valor)
        XCTAssertEqual(300.0, listaLances[2].valor)
    }
}
