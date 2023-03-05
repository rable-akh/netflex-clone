//
//  TitleCollectionViewCell.swift
//  akhblog
//
//  Created by Aung Kyaw Htay on 13/02/2023.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"
    
    private let posterImageVeiw: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(posterImageVeiw)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        posterImageVeiw.frame = contentView.bounds
        
    }
    
    public func configure(with model: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model)") else { return }
        
        posterImageVeiw.sd_setImage(with: url, placeholderImage: UIImage(named: "netflexlogo"), progress: nil)
    }
}
