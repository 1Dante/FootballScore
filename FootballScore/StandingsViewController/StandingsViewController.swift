//
//  StandingsTableViewController.swift
//  FootballScore
//
//  Created by MacBook on 30.12.2020.
//

import UIKit

class StandingsViewController: UIViewController {
    
    
    @IBOutlet var standingsBattons: [UIButton]!
    @IBOutlet weak var tableViewStandings: TableViewStandings!
    @IBOutlet weak var tableViewFixtures: TableViewFixtures!
    @IBOutlet weak var tableViewResults: TableViewResults!
    
    
    let tableViewStandingsReference = TableViewStandings()
    let tableViewFixturesReference = TableViewFixtures()
    let tableViewResultsReference = TableViewResults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtonsStyle()
        
        tableViewStandings.delegate = tableViewStandingsReference
        tableViewStandings.dataSource = tableViewStandingsReference
        tableViewFixtures.delegate = tableViewFixturesReference
        tableViewFixtures.dataSource = tableViewFixturesReference
        tableViewResults.delegate = tableViewResultsReference
        tableViewResults.dataSource = tableViewResultsReference
        
        
        tableViewStandingsReference.standingsProvider.fetchJson { (json) in
            
            _ = json?.response?.compactMap({ (league) -> [Standings]? in
                league.standings.flatMap { (groupes) -> [Standings] in
                    groupes.flatMap { (standings) -> [Standings] in
                            self.tableViewStandingsReference.standingsArray = standings
                        DispatchQueue.main.async {
                            self.tableViewStandings.reloadData()
                        }
                        return standings
                    }
                }
            })
        }
}

// use three button with tag: stadings = 0, results = 1, fixtures = 2
@IBAction private func tapButtons(_ sender: UIButton){
    switch (sender.tag) {
    case 0:
        tableViewStandings.isHidden = false
        tableViewFixtures.isHidden = true
        tableViewResults.isHidden = true
    case 1:
        tableViewResults.isHidden = false
        tableViewStandings.isHidden = true
        tableViewFixtures.isHidden = true
        
        tableViewResultsReference.resultsProvider.fetchJson { (json) in
            _ = json.flatMap { (fixture) in
                if let fixture = fixture.response{
                self.tableViewResultsReference.resultsArray = fixture
                    DispatchQueue.main.async {
                        self.tableViewResults.reloadData()
                    }
                }
            }
        }

    case 2:
        tableViewStandings.isHidden = true
        tableViewResults.isHidden = true
        tableViewFixtures.isHidden = false
        
        tableViewFixturesReference.fixturesProvider.fetchJson { (json) in
            _ = json.flatMap { (fixture) in
                if let fixture = fixture.response{
                    self.tableViewFixturesReference.fixturesArray = fixture
                    DispatchQueue.main.async {
                        self.tableViewFixtures.reloadData()
                    }
            }
            }
        }
        
    default:
        break
    }
}

//add to button some additional design
func setupButtonsStyle(){
    standingsBattons.forEach { (button) in
        button.layer.borderColor = UIColor(red: 0.14, green: 0.33, blue: 0.23, alpha: 0.8).cgColor
        button.layer.borderWidth = 0.7
        
        button.layer.cornerRadius = button.bounds.size.height / 3
    }
}









}
