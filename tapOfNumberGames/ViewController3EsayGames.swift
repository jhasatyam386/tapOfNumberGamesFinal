//
//  ViewController3EsayGames.swift
//  tapOfNumberGames
//
//  Created by R&W on 16/02/23.
//

import UIKit

class ViewController3EsayGames: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var random = 0
    var randomNumber = 0
    
    var Score = 0
    var arrForCells : [Int] = []
    var time = Timer()
    var freq = 0.20
    var color : [UIColor] = [.yellow,.red,.green,.blue,.brown,.green,.yellow,.red,.green,.red,.yellow,.green,.yellow,.red,.green,.blue]
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressTimeFromGameEnd: UIProgressView!
    
    @IBOutlet weak var tapNumber: UILabel!
    var arrRandomNumber : [Int] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        progrss()
        for _ in 0..<1{
            let random = Int.random(in: 1...100)
            arrRandomNumber.append(random)
        }
        for _ in 0..<16{
            let randomNumber = Int.random(in: 1...100)
            arrForCells.append(randomNumber)
        }
        print(arrRandomNumber)
        print(arrForCells)
        tapNumber.text = "tap on \(arrRandomNumber)"
        tapNumber.text = "tap on\(arrForCells.randomElement())"
    }
    func progrss()
    {
       
        var randomTime : Float = 1.0
        self.progressTimeFromGameEnd.progress = randomTime
        time = Timer.scheduledTimer(withTimeInterval: 0.10, repeats: true, block: { (_)in
        randomTime -= 0.02
        self.progressTimeFromGameEnd.progress = randomTime
        if self.progressTimeFromGameEnd.progress == 0.0{
            self.time.invalidate()
            self.showAlert()
        }
    })
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCollectionViewCell
        
     
        if tapNumber.text == cell.label1.text{

            plus()
           // showAlert()
            //progrss()
            collectionView.reloadData()
        }
        else {
            minus()
           // progrss()
            collectionView.reloadData()
        }
    }
    func plus(){
        Score = Score + 1
        scoreLabel.text = "\(Score)"
        time.invalidate()
        progrss()
    }
    func minus(){
        Score = Score + 1
        scoreLabel.text = "\(Score)"
        time.invalidate()
        progrss()
    }
    func showAlert(){
        let alert = UIAlertController(title: "Game Over", message: "Tap of Number", preferredStyle: .alert)
       
        alert.addAction(UIAlertAction.init(title: "Home", style:.default, handler: { _ in
            self.navigationForHome()
        }))
        alert.addAction(UIAlertAction.init(title: "try Again", style:.default, handler:{ _ in
            self.navigationForGames()  } ))
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .destructive, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    func navigationForHome(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.pushViewController(navigation, animated: true)
    }
    func navigationForGames(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "ViewController3EsayGames") as! ViewController3EsayGames
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCollectionViewCell
        cell.label1.text = "\(arrForCells[indexPath.row])"

        cell.backgroundColor = color[indexPath.row]
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        cell.layer.borderColor = UIColor.red.cgColor
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
        return arrForCells.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
  
}
