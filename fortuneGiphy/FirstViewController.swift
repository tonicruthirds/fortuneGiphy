import UIKit
import SwiftyJSON

class FirstViewController: UIViewController {
    
    var keywordArray = []
    var giphyFile = String()
    var giphyURL = "Unknown"
    
    
    @IBOutlet weak var cookieOne: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource("keywords", ofType: "txt")
        if let dico = String(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil) {
            keywordArray = dico.componentsSeparatedByString("\n")
            
            //this turns the contents of my text file into an array that I can pull from
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
            //making the API call in viewDidAppear so that everytime the user navigates back to the first screen, a new gif is loaded on the second screen
        
        fadeInImage()
       
       
        
        var randomNumber = Int(arc4random_uniform(267) + 1)
        var keyword = keywordArray[randomNumber]
        
            //getting random keyword from the array to pass thru my api call to giphy
        
        let url = NSURL(string: "http://api.giphy.com/v1/gifs/search?q=\(keyword)&api_key=dc6zaTOxFJmzC&limit=1")
        
            println("url from giphy request \(url)")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
           
            let json = JSON(data: data, options: NSJSONReadingOptions.allZeros, error: nil)
            
            if let giphyURL = json["data"][0]["images"]["downsized_large"]["url"].string{
                println(giphyURL)
                self.giphyURL = giphyURL
            }
           
        })
        task.resume()

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "giphyResponse" {
            var destinationVC = segue.destinationViewController as! FortuneView
            destinationVC.giphyURL = giphyURL 
        
        }
    }
    
    func fadeInImage() {

        let animationImages:[AnyObject] = [UIImage(named: "fortune1")!, UIImage(named: "fortune2")!, UIImage(named: "swiperight")!]
        cookieOne.animationImages = animationImages
        cookieOne.animationDuration = 2
        cookieOne.animationRepeatCount = 1
        cookieOne.startAnimating()
        
   }
    
    func setImage() {
        
    }

}