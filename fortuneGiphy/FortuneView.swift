import UIKit

class FortuneView: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var fortuneMessage: UILabel!
    
    var giphyURL : String = ""
    var keyword : String = ""
    var imageData : NSData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageData = NSData(contentsOfURL: NSURL(string: giphyURL)!)
        
        imageView.sd_setImageWithURL(NSURL(string: giphyURL)!)
        
        showMessage()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func shareButtonTapped(sender: AnyObject) {
        let textToShare = "I'm going to feel \(keyword) today. What about you?"
        let textPromo = "Download fortuneGiphy from the App Store to find out!"
        
        
//            if let linkToApp = NSURL(string: "http://itunes.apple.com")
                
        
        let objectsToShare : [AnyObject] = [imageData, textToShare, textPromo]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        
        self.presentViewController(activityVC, animated: true, completion: nil)
        
    }
    
    func showMessage() {
        fortuneMessage.text = "You will feel \(keyword) today."
    }
    
}