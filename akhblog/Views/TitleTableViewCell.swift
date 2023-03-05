//
//  TitleTableViewCell.swift
//  akhblog
//
//  Created by Aung Kyaw Htay on 14/02/2023.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    static let identifier = "TitleTableViewCell"
    
    private let playButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let posterImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playButton)
        
        applyConstraints()
    }
    
    private func applyConstraints() {
        let posterImageViewConstraint = [
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            posterImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let titleLabelConstraint = [
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        let playButtonConstraint = [
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
//        
        NSLayoutConstraint.activate(posterImageViewConstraint)
        NSLayoutConstraint.activate(titleLabelConstraint)
        NSLayoutConstraint.activate(playButtonConstraint)
    }
    
    public func configure(with model: TitleViewModel ) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model.titlePath)") else { return }
        posterImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "netflexlogo"), progress: nil)
        
        titleLabel.text = model.titleName
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
