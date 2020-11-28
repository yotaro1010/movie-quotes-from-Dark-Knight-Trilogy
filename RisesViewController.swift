//
//  RisesViewController.swift
//  movieQuotesFromDarkKnightTrilogy
//
//  Created by Yotaro Ito on 2020/11/26.
//

import AVFoundation
import UIKit

class RisesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, AVAudioPlayerDelegate{

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .black
        self.navigationItem.title = "Dark Knight Rises"
        view.addSubview(collectionView)
        collectionView.register(RisesCollectionViewCell.self, forCellWithReuseIdentifier: RisesCollectionViewCell.identifier)
        collectionView.register(HeaderForRisesCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderForRisesCollectionReusableView.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    
///    Headerのレイアウトなど
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                               withReuseIdentifier: HeaderForRisesCollectionReusableView.identifier,
                                                               for: indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 100, height: 20)
    }

//   　cellのレイアウト
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row <= 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RisesCollectionViewCell", for: indexPath) as! RisesCollectionViewCell
            cell.configure(with: UIImage(named: "batman_rises"))
            return cell
        }
        if indexPath.row <= 11 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RisesCollectionViewCell", for: indexPath) as! RisesCollectionViewCell
            cell.configure(with: UIImage(named: "bane_rises"))
            return cell
        }
        if indexPath.row <= 13 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RisesCollectionViewCell", for: indexPath) as! RisesCollectionViewCell
            cell.configure(with: UIImage(named: "alfred_rises"))
            return cell
        }
        if indexPath.row == 14 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RisesCollectionViewCell", for: indexPath) as! RisesCollectionViewCell
        cell.configure(with: UIImage(named: "catwoman_rises"))
        return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RisesCollectionViewCell", for: indexPath) as! RisesCollectionViewCell
        cell.configure(with: UIImage(named: "batman_rises"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 2, bottom: 5, right: 2)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width/4)-3, height: (view.frame.size.width/2.5)-1)
    }

    var audioPlayer: AVAudioPlayer!
    func playSound(name: String){
            guard let player = Bundle.main.path(forResource: name, ofType: "mp3")else{
                return
            }
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: player))
                audioPlayer.delegate = self
                audioPlayer.play()
            } catch  {
            }
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if indexPath.row == 0 {
            playSound(name: "wear a mask")
        }
        if indexPath.row == 1 {
            playSound(name: "no guns no killing ")
        }
        if indexPath.row == 2 {
            playSound(name: "war")
        }
        if indexPath.row == 3 {
            playSound(name: "light it up")
        }
        if indexPath.row == 4 {
            playSound(name: "the matter")
        }
        if indexPath.row == 5 {
            playSound(name: "no one care till put on the mask")
        }
        if indexPath.row == 6 {
            playSound(name: "i am a  league of shadows")
        }
        if indexPath.row == 7 {
            playSound(name: "permission to die")
        }
        if indexPath.row == 8 {
            playSound(name: "speak of the devil")
        }
        if indexPath.row == 9 {
            playSound(name: "do you feel in charge ")
        }
        if indexPath.row == 10 {
            playSound(name: "im necessary evil")
        }
        if indexPath.row == 11 {
            playSound(name: "impossible")
        }
        if indexPath.row == 12 {
            playSound(name: "alfreds fantasy")
        }
        if indexPath.row == 13 {
            playSound(name: "i wont bury you")
        }
        if indexPath.row == 14 {
            playSound(name: "about the gun thing")
        }
        if indexPath.row == 15 {
            playSound(name: "hero can be anyone")
        }
    }
}
