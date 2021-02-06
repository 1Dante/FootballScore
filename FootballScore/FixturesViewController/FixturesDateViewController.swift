//
//  FixturesDateViewController.swift
//  FootballScore
//
//  Created by MacBook on 30.01.2021.
//

import UIKit

class FixturesDateViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableViewAllFixturesDate: TableViewAllFixturesDate!
    
    var tableViewAllFixturesDateReference = TableViewAllFixturesDate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewAllFixturesDate.delegate = tableViewAllFixturesDateReference
        tableViewAllFixturesDate.dataSource = tableViewAllFixturesDateReference
        
        tableViewAllFixturesDateReference.todayFixturesProvider.fetchJson { (fixture) in
            _ = fixture.flatMap { (fixture) in
                if let fixture = fixture.response{
                    self.tableViewAllFixturesDateReference.arrayFixtures = fixture
                    self.group()
                    DispatchQueue.main.async {
                        self.tableViewAllFixturesDate.reloadData()
                    }
                }
            }
        }
        
    }
    
    func group(){
        
        let group = Dictionary(grouping: tableViewAllFixturesDateReference.arrayFixtures) { (fixture) -> (String) in
            
            return fixture.leagueName
        }
        
        tableViewAllFixturesDateReference.sections = group.map({ (key,value) in
            return SectionForTable(leagueName: key, fixture: value)
        })
    }
    
    
}
