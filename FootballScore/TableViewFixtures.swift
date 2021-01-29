//
//  TableViewFixtures.swift
//  FootballScore
//
//  Created by MacBook on 11.01.2021.
//

import UIKit

class TableViewFixtures: UITableView, UITableViewDataSource, UITableViewDelegate {
   
   
    let fixturesProvider = FixturesProvider()
    var fixturesArray:[Fixtures] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fixturesArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "FixturesTableViewCell", bundle: nil), forCellReuseIdentifier: "FixturesTableViewCell" )
        let cell = tableView.dequeueReusableCell(withIdentifier: "FixturesTableViewCell", for: indexPath) as! FixturesTableViewCell
     
        //sorted by date, JSON not sorted by date
        fixturesArray.sort { (fixtureFirst, fixtureSecond) -> Bool in
            fixtureFirst.date < fixtureSecond.date
        }
        let fixture = fixturesArray[indexPath.row]
        //setup cell inside fixturestableviewcell class
        cell.setupFixturesViewCell(fixture)
        return cell
    }
    
}
