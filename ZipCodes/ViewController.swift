//
//  ViewController.swift
//  ZipCodes
//
//  Created by Vincent Cubit on 3/6/22.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var zipcode: UITextField!
    @IBOutlet weak var enterZip: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }

    
    @IBAction func findCity(_ sender: Any) {
        print("Hey")
        if let text = self.zipcode.text {
            if text.count >= 5 {
                if let url = NSURL(string: "https://www.zipwise.com/webservices/zipinfo.php?key=a3nfsyqxrgdgswvg&zip=\(text)&format=json") {
                    if let data = NSData(contentsOf: url as URL) {
                        do {
                            let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.fragmentsAllowed) as! [ String: AnyObject ]
                            
                            
                            let newDict = parsed
                            
                            
                                self.enterZip.text = "\(text) belongs to \(newDict["results"]!["county"]!! as! String) County "

                            
                            
                        } catch _ as NSError {
                            print()
                        }
            } else {
                let alert = UIAlertController(title: "Oops", message: "Invalid zip code", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
}
        
    }
    
    
}

