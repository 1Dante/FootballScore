//
//  TableViewTodayFixtures.swift
//  FootballScore
//
//  Created by MacBook on 30.01.2021.
//


import UIKit



class TableViewAllFixturesDate: UITableView, UITableViewDelegate, UITableViewDataSource{
    
    let todayFixturesProvider = TodayFixturesProvider()
    var arrayFixtures:[Fixtures] = []
    var sections = [SectionForTable]()
    var country = ""
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
      
        
        return section.fixture.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        tableView.register(UINib(nibName: "FixtureHeader", bundle: nil),forHeaderFooterViewReuseIdentifier: "FixtureHeader")
        let section = sections[section]
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FixtureHeader") as! FixtureHeader
      
        header.country.text = country
        header.league.text = section.leagueName
        var backgroundConfig = UIBackgroundConfiguration.listPlainHeaderFooter()
        backgroundConfig.backgroundColor = UIColor(cgColor: CGColor(red: 0.0196, green: 0.0667, blue: 0.0118, alpha: 1.0))
        header.backgroundConfiguration = backgroundConfig
        return header
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
       
        
        tableView.register(UINib(nibName: "FixturesTableViewCell", bundle: nil), forCellReuseIdentifier: "FixturesTableViewCell" )
        let cell = tableView.dequeueReusableCell(withIdentifier: "FixturesTableViewCell", for: indexPath) as! FixturesTableViewCell
        
        
        let section = sections[indexPath.section]
        let fixture = section.fixture[indexPath.row]
        country = section.fixture[indexPath.row].country
        
        cell.setupResultsTodayViewCell(fixture)
        return cell
    }

    
    
    
}
struct SectionForTable{
    var country = ""
    var leagueName: String
    var fixture: [Fixtures]
    
    
}
