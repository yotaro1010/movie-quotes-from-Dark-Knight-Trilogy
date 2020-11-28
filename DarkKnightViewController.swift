//
//  DarkKnightViewController.swift
//  movieQuotesFromDarkKnightTrilogy
//
//  Created by Yotaro Ito on 2020/11/26.
//

import AVFoundation
import UIKit

class DarkKnightViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, AVAudioPlayerDelegate{

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        self.navigationItem.title = "Dark Knight"
        
        view.addSubview(collectionView)
        collectionView.register(DarkKnightCollectionViewCell.self, forCellWithReuseIdentifier: DarkKnightCollectionViewCell.identifier)
        collectionView.register(HeaderForDarkKnightCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderForDarkKnightCollectionReusableView.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                               withReuseIdentifier: HeaderForDarkKnightCollectionReusableView.identifier,
                                                               for: indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 100, height: 25)
    }

//   　cellのレイアウト
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row <= 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DarkKnightCollectionViewCell", for: indexPath) as! DarkKnightCollectionViewCell
            cell.configure(with: UIImage(named: "batman_darkknight"))
            return cell
        }
        if indexPath.row <= 9 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DarkKnightCollectionViewCell", for: indexPath) as! DarkKnightCollectionViewCell
            cell.configure(with: UIImage(named: "joker_darkknight"))
            return cell
        }
        if indexPath.row == 10 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DarkKnightCollectionViewCell", for: indexPath) as! DarkKnightCollectionViewCell
            cell.configure(with: UIImage(named: "twoface_darkknight"))
            return cell
        }
        if indexPath.row == 11 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DarkKnightCollectionViewCell", for: indexPath) as! DarkKnightCollectionViewCell
            cell.configure(with: UIImage(named: "italian_darkknight"))
            return cell
        }
        if indexPath.row == 12 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DarkKnightCollectionViewCell", for: indexPath) as! DarkKnightCollectionViewCell
            cell.configure(with: UIImage(named: "fox_darkknight"))
            return cell
        }
        if indexPath.row == 13 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DarkKnightCollectionViewCell", for: indexPath) as! DarkKnightCollectionViewCell
            cell.configure(with: UIImage(named: "alfred_darkknight"))
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DarkKnightCollectionViewCell", for: indexPath) as! DarkKnightCollectionViewCell
        cell.configure(with: UIImage(named: "gordon_darkknight"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 7, bottom: 1, right: 7)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width/3)-10, height: (view.frame.size.width/3)-10)
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
            playSound(name: "im not wearing hocky pads")
        }
        if indexPath.row == 1 {
            playSound(name: "and you gonna love me")
        }
        if indexPath.row == 2 {
            playSound(name: "where are they ")
        }
        if indexPath.row == 3 {
            playSound(name: "chaos")
        }
        if indexPath.row == 4 {
            playSound(name: "men of word ")
        }
        if indexPath.row == 5 {
            playSound(name: "look at me")
        }
        if indexPath.row == 6 {
            playSound(name: "this is my city")
        }
        if indexPath.row == 7 {
            playSound(name: "like a gravity")
        }
        if indexPath.row == 8 {
            playSound(name: "why so serious son ")
        }
        if indexPath.row == 9 {
            playSound(name: "here we go")
        }
        if indexPath.row == 10 {
            playSound(name: "fair morality")
        }
        if indexPath.row == 11 {
            playSound(name: "bathmans")
        }
        if indexPath.row == 12 {
            playSound(name: "black mailing ")
        }
        if indexPath.row == 13 {
            playSound(name: "just wanna watch world burn")
        }
        if indexPath.row == 14 {
            playSound(name: "the Dark Knight")
        }
    }
}
