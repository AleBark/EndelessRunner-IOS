//
//  GameScene.swift
//  Aula2
//
//  Created by PUCPR on 23/05/16.
//  Copyright (c) 2016 PUCPR. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    let velocidadeFundo = 5.0
    let velocidadeChao = 3.0
    let velocidadeFrame = 0.02
    
    var personagem: SKSpriteNode? = nil
    var enemy: SKSpriteNode? = nil
    var sequence : SKAction? = nil;
    
    override func didMove(to view: SKView) {
        let background = SKNode()
        
        let background1 = SKSpriteNode(imageNamed: "introBackground")
        background1.position = CGPoint(x: 0.0, y: 0.0)
        background.addChild(background1)
        
        let background2 = SKSpriteNode(imageNamed: "introBackground")
        background2.position = CGPoint(x: 2047.0, y: 0)
        background2.xScale = -1
        background.addChild(background2)
        
        let background3 = SKSpriteNode(imageNamed: "introBackground")
        background3.position = CGPoint(x: 4095.0, y: 0)
        background.addChild(background3)
        
        background.position = CGPoint(x: 1024.0, y: self.frame.midY)
        
        background.zPosition = 0
        self.addChild(background)
        
        let moveBackground = SKAction.moveTo(x: -3072.0, duration: velocidadeFundo)
        let reiniciaBackground = SKAction.moveTo(x: 1024.0, duration: 0)
    
        background.run(SKAction.repeatForever(SKAction.sequence([moveBackground,reiniciaBackground])))
        
        let chao = SKNode()
        
        let chao1 = SKSpriteNode(imageNamed: "chao.png")
        chao1.position = CGPoint(x:0,y:0)
        chao.addChild(chao1)
        
        let chao2 = SKSpriteNode(imageNamed: "chao.png")
        chao2.position = CGPoint(x:2048,y:0)
        chao2.xScale = -1
        chao.addChild(chao2)
        
        let chao3 = SKSpriteNode(imageNamed: "chao.png")
        chao3.position = CGPoint(x:4096,y:0)
        chao.addChild(chao3)
        
        chao.position = CGPoint(x:1024,y:chao1.size.height/2)
        chao.zPosition = 1
        self.addChild(chao)
        
        let moveChao = SKAction.moveTo(x: -3072.0, duration: velocidadeChao)
        let reiniciaChao = SKAction.moveTo(x: 1024.0, duration: 0)
        
        chao.run(SKAction.repeatForever(SKAction.sequence([moveChao,reiniciaChao])))
        
        let personagemWalkAtlas = SKTextureAtlas(named:"walk")
        let enemyWalkAtlas = SKTextureAtlas(named:"enemy")
        
        
        
        var andandoFrames = [SKTexture]()
        var enemyAndandoFrames = [SKTexture]()
        
        for i in 1..<enemyWalkAtlas.textureNames.count {
            let texName = "walk_\(i)"
            enemyAndandoFrames.append(enemyWalkAtlas.textureNamed(texName))
        }
        for i in 1..<personagemWalkAtlas.textureNames.count {
            let texName = "runner_0\(i)"
            andandoFrames.append(personagemWalkAtlas.textureNamed(texName))
        }
        
        
        
        self.personagem = SKSpriteNode(texture: andandoFrames[0])
        
        self.personagem?.position = CGPoint(x: 320, y: 510)
        
        
       
        self.enemy = SKSpriteNode(texture: enemyAndandoFrames[0])
        
        self.enemy?.position = CGPoint(x: 2000, y: 510)
        
        self.enemy?.zPosition = 2
        
        
        
        let animAction = SKAction.animate(with: andandoFrames, timePerFrame: velocidadeFrame)
        let enemyAction = SKAction.animate(with: enemyAndandoFrames, timePerFrame: velocidadeFrame)
        
        personagem?.run(SKAction.repeatForever(animAction))
        enemy?.run(SKAction.repeatForever(enemyAction))
        
        self.personagem?.zPosition = 2
        
        
        let moveLeft = SKAction.move(to: CGPoint(x:(self.personagem?.position.x)!,y:0), duration: 3000)
        sequence = SKAction.sequence([moveLeft])
        
        self.addChild(self.personagem!)
        self.addChild(self.enemy!);
        
        
        let moveBackground1 = SKAction.moveTo(x: 0, duration: 0.9)
        let reiniciaBackground1 = SKAction.moveTo(x: 2000, duration: 0)
        
        self.enemy?.run(SKAction.repeatForever(SKAction.sequence([moveBackground1,reiniciaBackground1])))
        
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        print("Pula boi pula cavalo")
        //self.personagem?.run(SKAction.move(to: CGPoint(x:320,y:600), duration: 2000))
      
        // move up 20
        let jumpUpAction = SKAction.moveBy(x: 0, y:150, duration:0.3)
        // move down 20
        let jumpDownAction = SKAction.moveBy(x: 0, y:-150, duration:0.3)
        // sequence of move yup then down
        let jumpSequence = SKAction.sequence([jumpUpAction, jumpDownAction])
        self.personagem?.run(jumpSequence)
        
       
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        print("Pula cavalo e boi")
//        for i in 1..<10{
//            print("Pulo \(i)")
//            self.personagem?.position.y -= 10;
//            
//        }
        
    }
    
    
    
}
