
import UIKit

class ViewController3EsayGames: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var time = Timer()
    var null = 0
    var Score = 0
    var freq = 0.20
    var arr  = [11,1,2,0,78,12,13,46,59,99,88,78,55,49,39,79]
    var ans = 0
    var color : [UIColor] = [.yellow,.red,.green,.blue,.white,.brown,.gray,.systemCyan,.systemPink,.green,.systemRed,.systemCyan,.yellow,.red,.green,.blue]

    @IBOutlet weak var lifeLine1: UIImageView!
    @IBOutlet weak var lifeLine2: UIImageView!
    @IBOutlet weak var lifeLine3: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressTimeFromGameEnd: UIProgressView!
    
    @IBOutlet weak var tapNumber: UILabel!
    var arrRandomNumber : [Int] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "0"
        progrss()
        setData()
    }
    func setData(){
        ans = [11,1,2,0,78,12,13,46,59,99,88,78,55,49,39,79].randomElement()!
        tapNumber.text = "\(ans)"
        arr.shuffle()
        collectionView.reloadData()
    }
    func progrss(){
        time.invalidate()
        var randomTime : Float = 1.0
        self.progressTimeFromGameEnd.progress = randomTime
        time = Timer.scheduledTimer(withTimeInterval: 0.10, repeats: true, block: { (_)in
        randomTime -= 0.02
            
        self.progressTimeFromGameEnd.progress = randomTime
        if self.progressTimeFromGameEnd.progress == 0.0{
            self.showAlert()
            self.time.invalidate()
        }
    })
    }
    func plusScore(){
        Score = Score + 1
        scoreLabel.text = "\(Score)"
        progrss()
    }
    func showAlert(){
        let alert = UIAlertController(title: "Score", message: "\(scoreLabel.text)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction.init(title: "game mode", style:.destructive, handler: { _ in
            self.navigationForHome()
        }))
        alert.addAction(UIAlertAction.init(title: "try Again", style:.destructive, handler:{ _ in
            self.collectionView.reloadData()
            self.progrss()
        } ))
       
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
        cell.label1.text = "\(arr[indexPath.row])"
        cell.backgroundColor = color[indexPath.row]
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        cell.layer.borderColor = UIColor.white.cgColor
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if ans != arr[indexPath.item]{
            null = null + 1
            arr.shuffle()
            showAlert()
            if null == 1{
                lifeLine1.image = UIImage(systemName: "heart" )
            }
            else if null == 2{
                lifeLine2.image = UIImage(systemName: "heart" )

            }
            else if null == 3{
                lifeLine3.image = UIImage(systemName: "heart" )

            }
            return
        }
        else{
            showAlert()
        }
        
        setData()
        plusScore()
        progrss()
    
    }
   
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
        return 16
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
}
