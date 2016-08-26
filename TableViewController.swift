//
//  TableViewController.swift
//  iTunesMusicApp
//
//  Created by Ameer Amer on 25/08/2016.
//  Copyright © 2016 Ameer Amer. All rights reserved.
//

import UIKit


class TableViewController: UITableViewController {
    
    var songs: [Song] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    
    let songClient = SongClient()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songClient.fetchTracks { result in
            switch result {
            case .Success(let songs):
                self.songs = songs
            case .Failure(let error):
                print("\(error)")
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songs.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 78
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! SongCell
        // Configure the cell...
        
        let path: String = songs[indexPath.row].artworkPath
        
        let url = NSURL(string: path)
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        
        cell.songNameLabel.text = songs[indexPath.row].songName
        cell.artistLabel.setTitle(songs[indexPath.row].artistName, forState: .Normal)
        cell.artistLabel.tag = indexPath.row
        cell.artwork.image = UIImage(data: data!)
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowAlbums" {
            if let button = sender as? UIButton {
                let row = button.tag
                let AlbumView = segue.destinationViewController as! AlbumTableViewController
                    
                let song = songs[row]
                AlbumView.artistID = song.artistId                
            }
        }
    }


}
