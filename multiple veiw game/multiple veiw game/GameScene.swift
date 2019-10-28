import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var player = SKSpriteNode(imageNamed: "player")
    var background = SKSpriteNode(imageNamed: "background")
    let displayWidth = UIScreen.main.bounds.width
    var move = false;
    var high_score_label = UILabel()
    var inst = IntroViewController()
    

    override func sceneDidLoad() {
        
        background.size = self.frame.size;
        background.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
        self.scaleMode = .aspectFit
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        background.zPosition = 0
        addChild(background)
        
        let floor = SKSpriteNode(color: UIColor.black, size: CGSize(width: frame.width, height: 100))
        floor.alpha = 0.0
        floor.position = CGPoint(x: 0, y: -330)
        floor.physicsBody = SKPhysicsBody(rectangleOf: floor.size)
        floor.physicsBody!.isDynamic = false
        floor.zPosition = 1
        self.addChild(floor)
        
        
        player.setScale(0.35)
        player.position = CGPoint(x:0, y: 100)
        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: player.size.width,height: player.size.height));
        player.physicsBody?.isDynamic = true
        player.zPosition = 2
        addChild(player)
        
        let w = UIScreen.main.bounds.width
        let h = UIScreen.main.bounds.height
        high_score_label = UILabel(frame: CGRect(x: w / 2, y: h / 2, width: 120, height: 30))
        high_score_label.text = String(inst.high_score)
        high_score_label.center = CGPoint(x: w / 4, y: 0.07 * h)
        high_score_label.textColor = UIColor.red
        view?.addSubview(high_score_label)
        
        
    }
    
    func rain_food(){
        let randomNumber = arc4random_uniform(3)
        let screenScale: CGFloat = UIScreen.main.scale
        let lower : UInt32 = UInt32(1 * Int(screenScale))
        let upper : UInt32 = UInt32(Int(self.frame.width) - (1 * Int(screenScale)))
        if (randomNumber == 0){
            let food = SKSpriteNode(imageNamed: "sushi_1")
            food.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: food.size.width,height: food.size.height));
            food.position = CGPoint(x: Int(arc4random_uniform(upper - lower) + lower), y:  330)
            food.physicsBody?.isDynamic = true
            food.setScale(0.1)
            food.zPosition = 3
            if (food.position.y == 100){
                food.removeFromParent()
            }
            self.addChild(food)
            return
        }else if(randomNumber == 1){
            let food = SKSpriteNode(imageNamed: "sushi_2")
            food.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: food.size.width,height: food.size.height));
            food.position = CGPoint(x: -Int(arc4random_uniform(upper - lower) + lower), y: 330)
            food.physicsBody?.isDynamic = true
            food.setScale(0.1)
            food.zPosition = 3
            if (food.position.y == 0){
                food.removeFromParent()
            }
            self.addChild(food)
            return
        }
        else{
            let food = SKSpriteNode(imageNamed: "sushi_3")
            food.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: food.size.width,height: food.size.height));
            food.position = CGPoint(x: Int(arc4random_uniform(upper - lower) + lower), y: 330)
            food.physicsBody?.isDynamic = true
            food.setScale(0.1)
            food.zPosition = 3
            if (food.position.y == -100){
                food.removeFromParent()
            }
            self.addChild(food)
            
            return
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,with event: UIEvent?) {
        for touch in touches{
            let touchLocation = (touch as AnyObject).location(in:self)
            
            if touchLocation.y > 400{
                move = true
            }else{
                if touchLocation.x < self.frame.midX{
                    if (player.xScale > 0){
                        player.xScale = player.xScale * -1;
                    }
                    player.physicsBody?.applyForce(CGVector(dx: -100000, dy: 0))

                } else if touchLocation.x > self.frame.midX{
                    if (player.xScale < 0){
                        player.xScale = player.xScale * -1;
                    }
                    player.physicsBody?.applyForce(CGVector(dx: 100000, dy: 0))
                }
            }
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>,with event: UIEvent?) {
        move = false
        player.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if(move){player.physicsBody?.applyForce(CGVector(dx: 100, dy: 0))}
        
        
        let randomNumber = arc4random_uniform(10)
        if (randomNumber == 1){
            rain_food()
        }

    }
}
