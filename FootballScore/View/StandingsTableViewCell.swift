//
//  StandingsTableViewCell.swift
//  FootballScore
//
//  Created by MacBook on 30.12.2020.
//

import UIKit

class StandingsTableViewCell: UITableViewCell {

    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var games: UILabel!
    @IBOutlet weak var win: UILabel!
    @IBOutlet weak var draw: UILabel!
    @IBOutlet weak var lose: UILabel!
    @IBOutlet weak var goalsH: UILabel!
    @IBOutlet weak var goalsA: UILabel!
    @IBOutlet weak var points: UILabel!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupStandingsViewCell(_ standings: Standings){
        rank.text = String(standings.rank)
        name.text = standings.teamName
        games.text = String(standings.played)
        win.text = String(standings.win)
        draw.text = String(standings.draw)
        lose.text = String(standings.lose)
        goalsH.text = String(standings.goalsFor)
        goalsA.text = String(standings.goalsAgainst)
        points.text = String(standings.points)
    }
    
    
    
}
