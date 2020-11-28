//
//  DarkKnightCollectionViewCell.swift
//  movieQuotesFromDarkKnightTrilogy
//
//  Created by Yotaro Ito on 2020/11/26.
//

import UIKit
class DarkKnightCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DarkKnightCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
     public func configure(with image: UIImage?){
        imageView.image = image
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 30.0
        contentView.addSubview(imageView)
        contentView.clipsToBounds = true
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
}
