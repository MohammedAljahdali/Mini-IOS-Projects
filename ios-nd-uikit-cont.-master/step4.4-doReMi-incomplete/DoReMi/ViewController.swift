//
//  ViewController.swift
//  DoReMi
//
//  Created by Jason Schatz on 11/18/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController, UITableViewDataSource

class ViewController: UIViewController, UITableViewDataSource {

    // MARK: Properties
    
    // Use this string property as your reuse identifier, 
    // Storyboard has been set up for you using this String.
    let cellReuseIdentifier = "MyCellReuseIdentifier"
    
    
    let titleModel: [String] = [
        "COCS201",
        "COCS203",
        "COCS307",
        "COCS311",
        "COCS312",
        "COCS433"
    ]
    let detailModel: [String] = [
    "Programming I",
    "Programming II",
    "Programming III",
    "Computer Orgnaztion",
    "Computer Architucture",
    "Introducatio to Bioinformatic"
]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
        cell.textLabel?.text = titleModel[indexPath.row]
        cell.detailTextLabel?.text = detailModel[indexPath.row]
        return cell
    }
}
