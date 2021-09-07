//
//  LeilaoTests.swift
//  LeilaoTests
//
//  Created by Ândriu Coelho on 27/04/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import XCTest
@testable import Leilao

class LeilaoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDeveIgnorarDoisLancesSeguidosDoMesmoUsuario() {
        
        let leilao = Leilao(descricao: "Playstation 4")
        let steveJobs = Usuario(nome: "Steve Jobs")
        
        leilao.propoe(lance: Lance(steveJobs, 2000.0))
        leilao.propoe(lance: Lance(steveJobs, 2300.0))
        
        XCTAssertEqual(1, leilao.lances?.count)
        XCTAssertEqual(2000.0, leilao.lances?.first?.valor)
    }
    
    func testDeveIgnorarMaisDoCincoLancesDoMesmoUsuario() {
        
        let leilao = Leilao(descricao: "Playstation 4")
        let steveJobs = Usuario(nome: "Steve Jobs")
        let bilGates = Usuario(nome: "Bill Gates")
        
        leilao.propoe(lance: Lance(steveJobs, 2000.0))
        leilao.propoe(lance: Lance(bilGates, 3000.0))
        
        leilao.propoe(lance: Lance(steveJobs, 4000.0))
        leilao.propoe(lance: Lance(bilGates, 5000.0))
        
        leilao.propoe(lance: Lance(steveJobs, 6000.0))
        leilao.propoe(lance: Lance(bilGates, 7000.0))
        
        leilao.propoe(lance: Lance(steveJobs, 8000.0))
        leilao.propoe(lance: Lance(bilGates, 9000.0))
        
        leilao.propoe(lance: Lance(steveJobs, 9400.0))
        leilao.propoe(lance: Lance(bilGates, 9700.0))
        
        leilao.propoe(lance: Lance(steveJobs, 9300.0))
        
        XCTAssertEqual(10, leilao.lances?.count)
        XCTAssertEqual(9700.0, leilao.lances?.last?.valor)
    }
}
