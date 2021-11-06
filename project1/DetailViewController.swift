//
//  DetailViewController.swift
//  project1
//  Cocoa Touch Class
//  Created by 김승현 on 2021/08/26.
//

import UIKit

var imageNum = 0

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    var imageName = ["nssl0033.jpg", "nssl0034.jpg", "nssl0041.jpg", "nssl0042.jpg", "nssl0043.jpg", "nssl0045.jpg", "nssl0046.jpg", "nssl0049.jpg", "nssl0051.jpg", "nssl0091.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //The title of the selectedImage -> the name of the selected image
        title = selectedImage
        
        //In DetailViewController the image name is nornal, not big like the title of ViewController.
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBefore(_ sender: UIButton) {
        imageNum = imageNum - 1
        if (imageNum < 0) {
            imageNum = imageName.count - 1
        }
        imageView.image = UIImage(named: imageName[imageNum])
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        imageNum = (imageNum + 1) % imageName.count
        imageView.image = UIImage(named: imageName[imageNum])
    }
    
    
    /**
    When tapping the selectedImage screen, Swift hides the bars above.
    Tapping again, it will show the bars again.
     */
    /*
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
 */
    
    //Share button
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.0) else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
