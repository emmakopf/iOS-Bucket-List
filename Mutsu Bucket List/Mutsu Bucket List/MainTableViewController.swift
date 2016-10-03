//
//  MainTableViewController.swift
//  Mutsu Bucket List
//
//  Created by Richard Dizon on 9/25/16.
//  Copyright © 2016 Team Mutsu. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    var bucketList = ["Streak the Lawn", "Attend Rotunda Sing", "See the River on the Lawn", "Go to UPC's Springfest", "See the Purple Shadows on TJ's Birthday", "Fill in the Blank"]
    var Duration2: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
//        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
//        swipeRight.direction = UISwipeGestureRecognizerDirection.right
//        self.view.addGestureRecognizer(swipeRight)
        
        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(gesture:)))
        recognizer.direction = UISwipeGestureRecognizerDirection.right
        self.tableView.addGestureRecognizer(recognizer)
        
        let leftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipe(gesture:)))
        leftRecognizer.direction = UISwipeGestureRecognizerDirection.left
        self.tableView.addGestureRecognizer(leftRecognizer)
    }
    
    func didSwipe(gesture: UISwipeGestureRecognizer) {
        // Recognizes right swipe and checks box
        if gesture.direction == UISwipeGestureRecognizerDirection.right {
            if gesture.state == UIGestureRecognizerState.ended {
                let swipeLocation = gesture.location(in: self.tableView)
                if let swipedIndexPath = tableView.indexPathForRow(at: swipeLocation) {
                    if let swipedCell = self.tableView.cellForRow(at: swipedIndexPath) {
                        if swipedCell.accessoryType == UITableViewCellAccessoryType.checkmark {
//                            swipedCell.accessoryType = UITableViewCellAccessoryType.none
                        }
                        else {
                            swipedCell.accessoryType = UITableViewCellAccessoryType.checkmark
                        }
                    }
                }
            }
            else {
            }
            
            print("Did swipe")
        }
    }
    
    func leftSwipe(gesture: UISwipeGestureRecognizer) {
        // Recognizes left swipe and un-checks box
        if gesture.direction == UISwipeGestureRecognizerDirection.left {
            if gesture.state == UIGestureRecognizerState.ended {
                let swipeLocation = gesture.location(in: self.tableView)
                if let swipedIndexPath = tableView.indexPathForRow(at: swipeLocation) {
                    if let swipedCell = self.tableView.cellForRow(at: swipedIndexPath) {
                        if swipedCell.accessoryType == UITableViewCellAccessoryType.checkmark {
                            swipedCell.accessoryType = UITableViewCellAccessoryType.none
                        }
                    }
                }
            }
            else {
            }
            print("Left Swipe")
        }
    }

    
    /*
    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        if buttonSegue == unwindSegue {
            print("amazing")
        }
    }
     */

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bucketList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        cell.textLabel?.text = bucketList[indexPath.row]
        
        return cell
    }

    /***************
    Keep the following comments in case we need them for the full, final project"
    ***************/
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
