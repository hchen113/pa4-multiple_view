import SpriteKit
import GameplayKit

class GameScene: SKScene {

    var player = SKSpriteNode(imageNamed: "player")
    let displayWidth = UIScreen.main.bounds.width
    var move = false;
    
    
    override func sceneDidLoad() {
        
        let floor = SKSpriteNode(color: UIColor.black, size: CGSize(width: frame.width, height: 100))
        floor.alpha = 0.0
        floor.position = CGPoint(x: 0, y: -330)
        floor.physicsBody = SKPhysicsBody(rectangleOf: floor.size)
        floor.physicsBody!.isDynamic = false
        self.addChild(floor)


        player.setScale(0.35)
        player.position = CGPoint(x:0, y: 100)
        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: player.size.width,height: player.size.height));
        player.physicsBody?.isDynamic = true
        addChild(player)
        

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
            addChild(food)
            return
        }else if(randomNumber == 1){
            let food = SKSpriteNode(imageNamed: "sushi_2")
            food.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: food.size.width,height: food.size.height));
            food.position = CGPoint(x: -Int(arc4random_uniform(upper - lower) + lower), y: 330)
            food.physicsBody?.isDynamic = true
            food.setScale(0.1)
            addChild(food)
            return
        }
        else{
            let food = SKSpriteNode(imageNamed: "sushi_3")
            food.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: food.size.width,height: food.size.height));
            food.position = CGPoint(x: Int(arc4random_uniform(upper - lower) + lower), y: 330)
            food.physicsBody?.isDynamic = true
            food.setScale(0.1)
            addChild(food)
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
                     player.physicsBody?.applyForce(CGVector(dx: -100000, dy: 0))
                    if(touchLocation.y > 1) {
                        player.physicsBody?.applyForce(CGVector(dx: 0, dy: 55000))
                    }

                } else if touchLocation.x > self.frame.midX{
                    player.physicsBody?.applyForce(CGVector(dx: 100000, dy: 0))
                    if(touchLocation.y > 1) {
                        player.physicsBody?.applyForce(CGVector(dx: 0, dy: 55000))
                    }
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
        
        //rain_food()
        
        
    }

}
