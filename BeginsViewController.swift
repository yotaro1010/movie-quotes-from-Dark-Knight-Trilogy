//
//  BeginsViewController.swift
//  movieQuotesFromDarkKnightTrilogy
//
//  Created by Yotaro Ito on 2020/11/26.
//

import AVFoundation
import UIKit

class BeginsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, AVAudioPlayerDelegate{

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        self.navigationItem.title = "Batman Begins"
        view.addSubview(collectionView)
        collectionView.register(BeginsCollectionViewCell.self, forCellWithReuseIdentifier: BeginsCollectionViewCell.identifier)
        collectionView.register(HeaderForBeginsCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderForBeginsCollectionReusableView.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    
//    Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                               withReuseIdentifier: HeaderForBeginsCollectionReusableView.identifier,
                                                               for: indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 100, height: 30)
    }

//   　cellのレイアウト
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row <= 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeginsCollectionViewCell", for: indexPath) as! BeginsCollectionViewCell
            cell.configure(with: UIImage(named: "batman_begins"))
            return cell
        }
        if indexPath.row == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeginsCollectionViewCell", for: indexPath) as! BeginsCollectionViewCell
            cell.configure(with: UIImage(named: "ra's_begins"))
            return cell
        }
        if indexPath.row == 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeginsCollectionViewCell", for: indexPath) as! BeginsCollectionViewCell
            cell.configure(with: UIImage(named: "alfred_begins"))
            return cell
        }
        if indexPath.row == 5 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeginsCollectionViewCell", for: indexPath) as! BeginsCollectionViewCell
            cell.configure(with: UIImage(named: "scarecrow_begins"))
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeginsCollectionViewCell", for: indexPath) as! BeginsCollectionViewCell
        cell.configure(with: UIImage(named: "fox_begins"))
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


//    タップしたら音が出る機能
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
            playSound(name: "im batman ")
        }
        if indexPath.row == 1 {
            playSound(name: "do i look like a cop")
        }
        if indexPath.row == 2 {
            playSound(name: "i never said thank you")
        }
        if indexPath.row == 3 {
            playSound(name: "legend")
        }
        if indexPath.row == 4 {
            playSound(name: "why do we fall")
        }
        if indexPath.row == 5 {
            playSound(name: "you need to lighten up")
        }
        if indexPath.row == 6 {
            playSound(name: "didnt you get the memo")
        }
    }
}

