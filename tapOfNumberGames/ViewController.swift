//
//  ViewController.swift
//  tapOfNumberGames
//
//  Created by R&W on 22/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchForDarkMode: UISwitch!
    @IBOutlet var progressForLoadingPlay: UIProgressView!
    @IBOutlet weak var loadingLabel: UILabel!
    var time = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        progressForLoadingPlay.progress = 0.0
        switchForDarkMode.isOn = true
    }
    @IBAction func SwitchAction(_ sender: UISwitch) {
        if switchForDarkMode.isOn == true
        {
            view.backgroundColor = .black
            switchForDarkMode.tintColor = .red
        }
        
        else
        {
            view.backgroundColor = .white
        }
    }

  
    @IBAction func playButtonAction(_ sender: UIButton) {
        var a : Float = 0.0
        self.progressForLoadingPlay.progress = a
        time = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { (_)in
            a += 0.05
            self.progressForLoadingPlay.progress = a
            if self.progressForLoadingPlay.progress == 1.0{
                self.time.invalidate()
                self.navigation()
            }
        })
    }
    func navigation(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.pushViewController(navigation, animated: true)
    }
   
}

