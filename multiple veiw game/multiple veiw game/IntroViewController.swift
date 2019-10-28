
import UIKit
import SpriteKit

class IntroViewController: UIViewController {

    public var high_score = 0
    var high_score_label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImageView = UIImageView(image: UIImage(named: "game_intro.png"))
        backgroundImageView.frame = view.frame
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
        let w = UIScreen.main.bounds.width
        let h = UIScreen.main.bounds.height
        high_score_label = UILabel(frame: CGRect(x: w / 2, y: h / 2, width: 120, height: 30))
        high_score_label.text = String(high_score)
        high_score_label.center = CGPoint(x: w / 4, y: 0.07 * h)
        high_score_label.textColor = UIColor.red
        view.addSubview(high_score_label)
        
        // Do any additional setup after loading the view.
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
