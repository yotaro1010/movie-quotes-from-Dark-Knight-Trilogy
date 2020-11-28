//
//  HeaderCollectionReusableView.swift
//  movieQuotesFromDarkKnightTrilogy
//
//  Created by Yotaro Ito on 2020/11/26.
//

import UIKit
class HeaderForBeginsCollectionReusableView: UICollectionReusableView {
      static let identifier = "HeaderForBeginsCollectionReusableView"
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HeaderForDarkKnightCollectionReusableView: UICollectionReusableView {
    static let identifier = "HeaderForDarkKnightCollectionReusableView"
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HeaderForRisesCollectionReusableView: UICollectionReusableView {
    static let identifier = "HeaderForRisesCollectionReusableView"
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

