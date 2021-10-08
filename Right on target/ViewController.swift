//
//  ViewController.swift
//  Right on target
//
//  Created by Dima Savitskiy on 28.09.21.
//

import UIKit

class ViewController: UIViewController {

    
    var game: Game!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }

    
    @IBAction func chekNumber() {
        game.calculateScore(with: Int(slider.value))
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    private func updateLabelWithSecretNumber(newText:String) {
        label.text = newText
    }

    private func showAlertWith (score: Int) {
        let alert = UIAlertController (title: "Игра окончена", message: "Вы заработали \(score) очков", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
        self.present(alert,animated: true, completion: nil)
    }
}

