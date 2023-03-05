//
//  CollectionViewTableViewCell.swift
//  akhblog
//
//  Created by Aung Kyaw Htay on 11/02/2023.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

    static let identifier = "CollectionViewTableViewCell"
    
//    private var tMovieTitle: [Movie] = [Movie]()
//    private var pMovietitle: [Popular] = [Popular]()
//    private var tvTitle: [Tv] = [Tv]()
//    private var upMovietitle: [Upcoming] = [Upcoming]()
//    private var topRatedTitle: [TopRated] = [TopRated]()
    
    private var titles: [Title] = [Title]()

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSizeMake(140, 200)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        collectionView.frame = contentView.bounds
    }
    
    public func configure(with title: [Title]) {
        self.titles = title
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
//    public func topMovieConfigure(with title: [Movie]) {
//        self.tMovieTitle = title
//    }
//
//    public func popularMovieConfigure(with title: [Popular]) {
//        self.pMovietitle = title
//    }
//
//    public func tvConfigure(with title: [Tv]) {
//        self.tvTitle = title
//    }
//
//    public func upComingMovieConfigure(with title: [Upcoming]) {
//        self.upMovietitle = title
//    }
//
//    public func topRatedConfigure(with title: [TopRated]) {
//        self.topRatedTitle = title
//    }

}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        cell.backgroundColor = .green
//        return cell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        guard let model = titles[indexPath.row].poster_path else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: model)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
}
