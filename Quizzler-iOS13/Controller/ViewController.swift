//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var score: UILabel!
    
    var timer:Timer!
    var quiz = Quiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func resetAnswerColor(){
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }

    @IBAction func answeredButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quiz.checkAnswer(userAnswer)
        
        // change bg color of button based on user answer
        if userGotItRight{
            trueButton.backgroundColor = UIColor.green
        }else{
            falseButton.backgroundColor = UIColor.red
        }
        quiz.countQuestionNumber()
        updateUI()
    }
    
    func updateUI(){
        trueButton.layer.cornerRadius = 20
        falseButton.layer.cornerRadius = 20
        
        score.text = String("Score: \(quiz.getScore()), Answered: \(quiz.questionNumber)")
        questionLabel.text = quiz.getQuestionLabel()
        progressBar.progress = quiz.getProgress()
        Timer.scheduledTimer(withTimeInterval: 0.15, repeats: false) { Timer in
            self.resetAnswerColor()
        }
    }
}

