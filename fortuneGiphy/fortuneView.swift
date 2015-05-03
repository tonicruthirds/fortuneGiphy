import UIKit



class fortuneView: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func shareButtonTapped(sender: AnyObject) {
            let textToShare = "I'm going to have a /(keyword) day. What about you?"
            
            if let linkToApp = NSURL(string: "http://itunes.apple.com")
            {
                let objectsToShare = [textToShare, linkToApp]
                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                
                self.presentViewController(activityVC, animated: true, completion: nil)
            }
    }
    
}