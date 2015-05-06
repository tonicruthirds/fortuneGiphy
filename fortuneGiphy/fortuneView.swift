import UIKit

class FortuneView: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    var giphyURL = "Unknown"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FortuneView().setGiphyURL()
        imageView.image = UIImage(named: giphyURL)
    }
    
    func setGiphyURL(giphyURL: String) {
        
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