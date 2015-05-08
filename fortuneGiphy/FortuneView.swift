import UIKit

class FortuneView: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var fortuneMessage: UILabel!
    
    var giphyURL : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageData = NSData(contentsOfURL: NSURL(string: giphyURL)!)
        
        imageView.sd_setImageWithURL(NSURL(string: giphyURL)!)
        
        showMessage()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func shareButtonTapped(sender: AnyObject) {
            let textToShare = "I'm going to feel keyword today. What about you?"
            let imageToShare = giphyURL
            let textPromo = "Download fortuneGiphy from the app store to find out!"
            
            if let linkToApp = NSURL(string: "http://itunes.apple.com")
            {
                let objectsToShare = [textToShare, textPromo]
                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                
                self.presentViewController(activityVC, animated: true, completion: nil)
            }
    }
    
    func showMessage() {
        fortuneMessage.text = "You will feel keyword."
    }
    
}