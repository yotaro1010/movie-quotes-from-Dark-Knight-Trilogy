//
//  ViewController.swift
//  movieQuotesFromDarkKnightTrilogy
//
//  Created by Yotaro Ito on 2020/11/26.
//

import UIKit

class ViewController: UIViewController {
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 90))
        let image = UIImage(named: "logo")
        
        button.setImage(image, for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
    }
    
    @objc func didTapButton(){
        animate()
    }
    
    func animate(){
        UIView.animate(withDuration: 2, animations: {
            let size = self.view.frame.size.width * 100
            let diffx = size - self.view.frame.size.width
            let diffy = self.view.frame.size.height - size
            self.button.frame = CGRect(
                x: -(diffx/2),
                y: diffy/2,
                width: size ,
                height: size
            )
        })
        UIView.animate(withDuration: 1.7, animations: {
            self.button.alpha = 0
        }, completion: { done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now()+0, execute: {
                    
                    let tabBarController = UITabBarController()
                    let vc1 = UINavigationController(rootViewController: BeginsViewController())
                    let vc2 = UINavigationController(rootViewController: DarkKnightViewController())
                    let vc3 = UINavigationController(rootViewController: RisesViewController())
//
                   
//                    vc1.title = "Begins"
//                    vc2.title = "Dark Knight"
//
//                    vc3.title = "Rises"
                    tabBarController.setViewControllers([vc1, vc2, vc3], animated: false)
                   
                    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
                    (UINavigationBar.appearance() as UINavigationBar).setBackgroundImage(UIImage(), for: .default)
                    UITabBar.appearance().tintColor = .white
                    UITabBar.appearance().backgroundImage = UIImage()
                    UITabBar.appearance().shadowImage = UIImage()
                    
                    vc1.tabBarItem.image = UIImage(named: "logo")
                    vc1.tabBarItem.imageInsets = UIEdgeInsets(top:410, left: 410, bottom: 410, right: 410)
                    
                    
                    vc2.tabBarItem.image = UIImage(named: "logo")
                    vc2.tabBarItem.imageInsets = UIEdgeInsets(top:410, left: 410, bottom: 410, right: 410)
                  
                    
                    vc3.tabBarItem.image = UIImage(named: "logo")
                    vc3.tabBarItem.imageInsets = UIEdgeInsets(top:410, left: 410, bottom: 410, right: 410)
                    
                    
                    tabBarController.modalTransitionStyle = .crossDissolve
                    tabBarController.modalPresentationStyle = .fullScreen
                    self.present(tabBarController, animated: true)
                })
            }
        })
       
    }
}

