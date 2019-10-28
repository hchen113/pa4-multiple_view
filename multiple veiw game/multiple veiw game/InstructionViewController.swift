import UIKit
import SpriteKit

class InstructionViewController: UIViewController, UIScrollViewDelegate , UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! IntructionTableViewCell
        cell.element_image.image=self.elementImages[indexPath .row]
        cell.element_label.text=self.elements[indexPath .row]
        cell.element_image.contentMode = UIView.ContentMode.scaleAspectFit
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section:Int) -> String?
    {
      return "Instructions:"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105.0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    let elements = [("Tuna Sushi : Winnie's favorite. +2 in high score. "),("Shrimp Sushi : New type of sushi, its alright. +1 in high score."),("Eel Sushi : Winnie is allergic to eel, -1 to lives"),("High Score : Self explanitory. "),("Lives : Winnie's only got three. Don't die. ezzzzzzzzzzzz!")]
    let elementImages = [UIImage(named: "sushi_2"), UIImage(named: "sushi_3"), UIImage(named: "sushi_1"), UIImage(named: "high_score"), UIImage(named: "lives")]

    var high_score_label = UILabel()
    var inst = IntroViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let w = UIScreen.main.bounds.width
        let h = UIScreen.main.bounds.height
        high_score_label = UILabel(frame: CGRect(x: w / 2, y: h / 2, width: 120, height: 30))
        high_score_label.text = String(inst.high_score)
        high_score_label.center = CGPoint(x: w / 4, y: 0.07 * h)
        high_score_label.textColor = UIColor.red
        view.addSubview(high_score_label)
        
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        
         
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
