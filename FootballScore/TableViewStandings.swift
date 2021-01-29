//
//  TableStandings.swift
//  FootballScore
//
//  Created by MacBook on 09.01.2021.
//

import UIKit

class TableViewStandings: UITableView, UITableViewDataSource, UITableViewDelegate{
    
   
    let standingsProvider = StandingsProvider()
    var standingsArray:[Standings] = []
    
   
    
    
   //TODO: add description to team
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return standingsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.register(UINib(nibName: "StandingsTableViewCell", bundle: nil), forCellReuseIdentifier: "StandingsTableViewCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StandingsTableViewCell", for: indexPath) as! StandingsTableViewCell
        
        let standings = standingsArray[indexPath.row]
        //setup cell inside standingsTableViewCell
        cell.setupStandingsViewCell(standings)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        tableView.register(UINib(nibName: "StandingsHeader", bundle: nil), forCellReuseIdentifier: "StandingsHeader")
        
        let header = tableView.dequeueReusableCell(withIdentifier: "StandingsHeader")
    
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
   
    
    
    
}
