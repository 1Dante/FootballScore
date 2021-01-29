//
//  TableViewResults.swift
//  FootballScore
//
//  Created by MacBook on 28.01.2021.
//


import UIKit

class TableViewResults: UITableView, UITableViewDelegate, UITableViewDataSource{
    
    let resultsProvider = ResultsProvider()
    var resultsArray:[Fixtures] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        // One cell for both tables
        tableView.register(UINib(nibName: "FixturesTableViewCell", bundle: nil), forCellReuseIdentifier: "FixturesTableViewCell" )
        let cell = tableView.dequeueReusableCell(withIdentifier: "FixturesTableViewCell", for: indexPath) as! FixturesTableViewCell
        resultsArray.sort { (fixtureFirst, fixtureSecond) -> Bool in
            fixtureFirst.date > fixtureSecond.date
        }
        let results = resultsArray[indexPath.row]

        cell.setupResultsViewCell(results)
        return cell
    }
    
    
}
