//
//  ViewController2.swift
//  tapOfNumberGames
//
//  Created by R&W on 16/02/23.
//

import UIKit

class ViewController2: UIViewController {

    var time = Timer()

    @IBOutlet weak var easyGame: UIButton!
    @IBOutlet weak var mediumGame: UIButton!
    @IBOutlet weak var hardGame: UIButton!
    @IBOutlet weak var loadinglabel: UILabel!
    @IBOutlet weak var gameModeProgressView: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        gameModeProgressView.progress = 0.0
        easyGame.layer.cornerRadius = 15
    }
    
    
    @IBAction func easyGameButtonAction(_ sender: UIButton) {
        
        
        var a : Float = 0.0
        self.gameModeProgressView.progress = a
        time = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { (_)in
            a += 0.05
            self.gameModeProgressView.progress = a
            if self.gameModeProgressView.progress == 1.0{
                self.time.invalidate()
                self.navigation()
            }
        })
        
    }
    @IBAction func mediumGameButtonAction(_ sender: UIButton) {
        var a : Float = 0.0
        self.gameModeProgressView.progress = a
        time = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { (_)in
            a += 0.05
            self.gameModeProgressView.progress = a
            if self.gameModeProgressView.progress == 1.0{
                self.time.invalidate()
                self.navigation()
            }
        })
        
        
    }
    @IBAction func hardGameButtonAction(_ sender: UIButton) {
        var a : Float = 0.0
        self.gameModeProgressView.progress = a
        time = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { (_)in
            a += 0.05
            self.gameModeProgressView.progress = a
            if self.gameModeProgressView.progress == 1.0{
                self.time.invalidate()
                self.navigation()
            }
        })
    }
    func navigation(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "ViewController3EsayGames") as! ViewController3EsayGames
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    

}
