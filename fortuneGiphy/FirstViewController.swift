import UIKit
import SwiftyJSON

class FirstViewController: UIViewController {
    
    var keywordArray = []
    var giphyFile = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource("keywords", ofType: "txt")
        if let dico = String(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil) {
            keywordArray = dico.componentsSeparatedByString("\n")
            
            //this makes the contents of my text file an array that I can pull from
            
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
            //making the API call in viewDidAppear so that everytime the user navigates back to the first screen, a new gif is loaded on the second screen
        
        var randomNumber = Int(arc4random_uniform(268) + 1)
        var keyword = keywordArray[randomNumber]
        
            //getting random keyword from the array to pass thru my api call to giphy
        
        let url = NSURL(string: "http://api.giphy.com/v1/gifs/search?q=\(keyword)&api_key=dc6zaTOxFJmzC&limit=1")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
           
            let json = JSON(data: data, options: NSJSONReadingOptions.allZeros, error: nil)
            
            if let imageURL = json["data"]["images"]["fixed_height_small"]["url"].string{
                println(json)
            }
          
           
        })
        task.resume()

    }
}

