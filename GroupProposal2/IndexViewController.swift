//
//  ViewController.swift
//  GroupProposal2
//
//  Created by Settimi, Niccolo B. on 4/6/26.
//

import UIKit

class IndexViewController: UIViewController {
    let sectionTitles = ["Project", "Team", "Example"]
    let sectionFooters = ["Project Components", "Team Members", "Example of Project UI"]
    
    let projectNames = ["Main Info", "Frontend", "Backend", "UI"]
    let teamNames = ["Nicco Settimi", "Sam Boston"]
    var selectedIndexPath: IndexPath?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = selectedIndexPath else { return }
        
        if segue.identifier == "InfoView" {
            if let destinationVC = segue.destination as? InfoViewController {
                switch(projectNames[indexPath.row])
                {
                case "Main Info":
                    destinationVC.projectDetail = TabInfo(title: "Dealership App", image: UIImage(named: "FrontEndImage"), description: "This proposal is for a car dealership app. The app allows a user to browse a selection of available cars and start the purchasing process for a specific car.")
                case "Frontend":
                    destinationVC.projectDetail = TabInfo(title: "Front End", image: UIImage(named: "FrontEndImage"), description: "The front end of the car dealership app will utilize datasources and structs to provide data about available cars to the user. The frontend will also hold onto any vehicles the user has selected to purchase.")
                case "Backend":
                    destinationVC.projectDetail = TabInfo(title: "Back End", image: UIImage(named: "BackEndImage"), description: "The car dealership will feature a fake backend as there will be no database. Classes of cars will be held and provided to the front end code from lists.")
                case "UI":
                    destinationVC.projectDetail = TabInfo(title: "UI", image: UIImage(named: "UIImage"), description: "The user will be able to select a type of car and then browse a list of cars available for that type and the price range. A car can be selected to purchase which will bring the user to a purchase screen that shows details about the selected car.")
                default:
                    break
                }
            }
        }
        else if segue.identifier == "TeamView" {
            if let destinationVC = segue.destination as? TeamViewController {
                switch(teamNames[indexPath.row])
                {
                case "Nicco Settimi":
                    destinationVC.teamInfo = TabInfo(title: "Nicco Settimi", image: UIImage(named: "NiccoImage"), description: "Main Programmer\nPrograms the back end and front end connections and some front end transitions. Responsible for making sure the project functions.")
                case "Sam Boston":
                    destinationVC.teamInfo = TabInfo(title: "Sam Boston", image: UIImage(named: "SamImage"), description: "Programmer/UI Designer\nDesigns the UI layouts and programs the connections from the front end to UI. Responsible for making sure the project looks good.")
                default:
                    break
                }
                
            }
        }
    }
}

extension IndexViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section)
        {
        case 0:
            return 4
        case 1:
            return 2
        default:
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section >= sectionTitles.count)
        {
            return nil
        }
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if (section >= sectionTitles.count)
        {
            return nil
        }
        
        return sectionFooters[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        
        var labelName: String
        
        switch (indexPath.section)
        {
        case 0:
            labelName = projectNames[indexPath.row]
        case 1:
            labelName = teamNames[indexPath.row]
        default:
            labelName = "UI Example"
            cell.imageView?.image = UIImage(named: "Example")
        }
        
        cell.textLabel?.text = "\(labelName)"
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        tableView.deselectRow(at: indexPath, animated: true)
        if (indexPath.section == 0)
        {
            performSegue(withIdentifier: "InfoView", sender: self)
        }
        else if (indexPath.section == 1)
        {
            performSegue(withIdentifier: "TeamView", sender: self)
        }
        else
        {
            performSegue(withIdentifier: "ExampleView", sender: self)
        }
    }
}
