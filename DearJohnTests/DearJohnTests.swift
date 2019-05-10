//
//  DearJohnTests.swift
//  DearJohnTests
//
//  Created by Lahai on 5/9/19.
//  Copyright © 2019 lolo. All rights reserved.
//

import XCTest
@testable import DearJohn

class DearJohnTests: XCTestCase {

    func testControllerHasTableView() {
        let controller = ArticleTableViewController()
        XCTAssertNotNil(controller.tableView,
                        "Controller should have a tableview")
    }
    
    func testControllerHasCells() {
        let controller = ArticleTableViewController()
        XCTAssert(((controller.tableView?.visibleCells) != nil), "Controller should have table cells")
    }
    
    func testControllerTitle(){
        let controller = ArticleTableViewController()
        guard let title = controller.navigationController?.navigationItem.title else {return}
        XCTAssertEqual(title, "Dear John")
    }
}
