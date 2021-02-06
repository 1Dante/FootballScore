//
//  FixturesTableView.swift
//  FootballScore
//
//  Created by MacBook on 11.01.2021.
//

import UIKit

class FixturesTableViewCell: UITableViewCell {
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var teamHome: UILabel!
    @IBOutlet weak var teamAway: UILabel!
    @IBOutlet weak var scoreHomeTeam: UILabel!
    @IBOutlet weak var scoreAwayTeam: UILabel!
    @IBOutlet weak var logoAwayTeam: UIImageView!
    @IBOutlet weak var logoHomeTeam: UIImageView!
    @IBOutlet weak var favoritesButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupFixturesViewCell(_ fixtures: Fixtures){
        date.text = getDateFormat(dateString: fixtures.date)
        time.text = getTimeFormat(timeString: fixtures.date)
        teamHome.text = fixtures.homeTeamName
        teamAway.text = fixtures.awayTeamName
        scoreHomeTeam.isHidden = true
        scoreAwayTeam.isHidden = true
        
        DispatchQueue.main.async {

            self.logoAwayTeam.image = self.getUIImage(fixtures.awayTeamLogo)
            self.logoHomeTeam.image = self.getUIImage(fixtures.homeTeamLogo)
        }
        }
    
        func setupResultsViewCell(_ fixtures: Fixtures){
            
            time.isHidden = true
            date.text = getDateFormat(dateString: fixtures.date)
            teamHome.text = fixtures.homeTeamName
            teamAway.text = fixtures.awayTeamName
            scoreHomeTeam.text = String(format: "%d", fixtures.goalsHomeTeam ?? "")
            scoreAwayTeam.text = String(format: "%d", fixtures.goalsAwayTeam ?? "")
            favoritesButton.isEnabled = false
            
            DispatchQueue.main.async {
                self.logoAwayTeam.image =  self.getUIImage(fixtures.awayTeamLogo)
                self.logoHomeTeam.image = self.getUIImage(fixtures.homeTeamLogo)
            }
       
        
        
    }
    
    func getDateFormat(dateString: String) -> String{
        let dateFormatter = DateFormatter()
       
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSSIX")
        guard let date = dateFormatter.date(from: dateString) else {return ""}
        dateFormatter.dateFormat = "dd-MMM"
        return dateFormatter.string(from: date)
    }
    
    func getTimeFormat(timeString: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSSIX")
        guard let date = dateFormatter.date(from: timeString) else {return ""}
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
        
    }
    
    func getUIImage(_ imageString: String) -> UIImage{
       let image = UIImage(systemName: "nosign")!
        if let url = URL(string: imageString) {
            if let data = try? Data(contentsOf: url){
            if let image = UIImage(data: data){
                
               return image
            }
        }
        }
        return image
    }
     
    
    @IBAction func addToFavorites(_ sender: UIButton) {
    }
    
    
}






