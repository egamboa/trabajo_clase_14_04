//
//  ViewController.swift
//  shakemagic
//
//  Created by Andrés Gamboa on 4/14/18.
//  Copyright © 2018 Andrés Gamboa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var indexAnswer : Int = 0
    let answerBalls : Array = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    
    @IBOutlet weak var answer: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateRandom() -> String {
        let indexAnswer = Int(arc4random_uniform(5))
        for answerBall in answerBalls {
            let indexForLast = answerBall.index(answerBall.startIndex, offsetBy: 4)
            let ballNumberString = String(answerBall[indexForLast...])
            if(ballNumberString == String(indexAnswer)) {
                return answerBall
            }
        }
        return answerBalls[0]
    }
    
    
    @IBAction func btnAnswerAction(_ sender: Any) {
        answer.image = UIImage(named: generateRandom())
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        answer.image = UIImage(named: generateRandom())
    }
}

