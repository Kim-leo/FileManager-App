//
//  ViewController.swift
//  project1
//
//  Created by 김승현 on 2021/08/25.
//

import UIKit    //This file will reference the iOS user interface toolkit.

class ViewController: UITableViewController {
    /**
     creating a new screen of data called ViewController, based on UITableViewController.
     When you see a data type that starts with "UI", it means it comes from UIKit.
     + UIViewController is Apple's default screen type, which is empty and white until we change it.
     
     */

    var pictures = [String]()
    
    override func viewDidLoad() {
        /**
        viewDidLoad() is called by UIKit when the screen has loaded, and is ready for you to customize.
        */
        super.viewDidLoad()
        
        //The title of the tableView
        title = "Storm Viewer"
        //Making the title bigger and in DetailViewController the image titles are also big.
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        /**
         It declares a constant called fm and assigns it the value returned by FileManager.default.
         This is a data type that lets us work with the filesystem, and in our case we'll be using it to look for files.
         */
        let path = Bundle.main.resourcePath!
        /**
         It declares a constant called path that is set to the resource path of our app's bundel.
         A bundle is a directory containing our compiled program and all our assets.
         This line says "tell me where I can find all those images I added to my app."
         */
        let items = try! fm.contentsOfDirectory(atPath: path)
        /**
         It declares a third constant called items that is set to the contents of the directory at a path, the one that was returned by the line before.
         The items constant will be an array of strings containing filenames.
         */
        
        for item in items {
            if item.hasPrefix("nssl") {
                // this is a picture to load!
                pictures.append(item)
            }
        }
        pictures.sort()
        
        print(pictures)
        
    }

    //Showing lots of rows in tableView.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    //Dequeuing cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    //Typecasting DetailViewController to storyboard
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //2: success! Set its selectedImage property
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            
            //3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    
    
}

