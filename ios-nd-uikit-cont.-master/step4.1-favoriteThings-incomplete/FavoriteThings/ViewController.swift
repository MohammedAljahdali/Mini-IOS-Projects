//
//  ViewController.swift
//  FavoriteThings
//
//  Created by Jason Schatz on 11/18/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Model
    
    let favoriteThings: [String] = [
        "Playing video games",
        "Learning about the things that i like",
        "Machine Learning",
        "Programming",
        "Data Science"
    ]

    // MARK: Table View Data Source Methods
    
    // number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteThings.count
    }
    
    // cell for row at index path
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteThingCell")!
        let favoriteThingForRow = self.favoriteThings[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = favoriteThingForRow
        return cell
    }
}
