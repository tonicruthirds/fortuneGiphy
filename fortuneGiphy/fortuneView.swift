import UIKit

class FortuneView: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    var giphyURL : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageData = NSData(contentsOfURL: NSURL(string: giphyURL)!)
        
        imageView.sd_setImageWithURL(NSURL(string: giphyURL)!)
//
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func shareButtonTapped(sender: AnyObject) {
            let textToShare = "Look what I have to look forward to today. What's your day looking like?"
            let imageToShare = giphyURL
            let textPromo = "Download fortuneGiphy from the app store to find out!"
            
            if let linkToApp = NSURL(string: "http://itunes.apple.com")
            {
                let objectsToShare = [textToShare, textPromo]
                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                
                self.presentViewController(activityVC, animated: true, completion: nil)
            }
    }
    
}