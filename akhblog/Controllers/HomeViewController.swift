//
//  HomeViewController.swift
//  akhblog
//
//  Created by Aung Kyaw Htay on 11/02/2023.
//

import UIKit

enum Sections: Int {
    case TrendingMovies = 0
    case Popular = 1
    case TrendingTv = 2
    case UpcomingMovie = 3
    case TopRated = 4
}

class HomeViewController: UIViewController {
    
    let sectionTitles: [String] = ["Trending Movies", "Popular", "Trending Tv", "Upcoming Movies", "Top rated"]
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        // Navbar
        configureNavbar()
        
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView

    }
    
    private func configureNavbar() {
        var image = UIImage(named: "netflexlogo")
        image = image?.withTintColor(UIColor.red)
    
//        image = image?.withRenderingMode(.alwaysOriginal)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        navigationItem.leftBarButtonItem?.tintColor = .red
        navigationController?.navigationBar.tintColor = .white
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
//    private func getTrendingMovies() {
//        APICaller.shared.getTrendingMovies { results in
//            switch results {
//                case .success(let movies) :
//                    print(movies)
//                case .failure(let error) :
//                     print(error)
//            }
//
//        }
//    }
//
//    private func getTrendingTv() {
//        APICaller.shared.getTrendingTv { results in
//
//
//        }
//    }
//
//    private func getUpcomingMovie() {
//        APICaller.shared.getUpcomingMovie { results in
//            switch results {
//            case .success(let success):
//                print(success)
//            case .failure(let failure):
//                print(failure)
//            }
//        }
//    }
//
//    private func getPopularMovie() {
//        APICaller.shared.getPopularMovie { results in
//            switch results {
//            case .success(let success):
//                print(success)
//            case .failure(let failure):
//                print(failure)
//            }
//        }
//    }
//
//    private func getTopRatedMovie() {
//        APICaller.shared.getTopRatedMovie { results in
//            switch results {
//            case .success(let success):
//                print(success)
//            case .failure(let failure):
//                print(failure)
//            }
//        }
//    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableVeiw: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Use Custom view cell
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
                return UITableViewCell()
        }
        
        switch indexPath.section {
        case Sections.TrendingMovies.rawValue:
            APICaller.shared.getTrendingMovies{ results in
                switch results {
                case .success(let success):
                    cell.configure(with: success)
                case .failure(let failure):
                    print(failure)
                }
            }
        case Sections.Popular.rawValue:
            APICaller.shared.getPopularMovie { results in
                switch results {
                case .success(let success):
                    cell.configure(with: success)
                case .failure(let failure):
                    print(failure)
                }
            }
        case Sections.TrendingTv.rawValue:
            APICaller.shared.getTrendingTv { results in
                switch results {
                case .success(let success):
                    cell.configure(with: success)
                case .failure(let failure):
                    print(failure)
                }
            }
        case Sections.UpcomingMovie.rawValue:
            APICaller.shared.getUpcomingMovie { results in
                switch results {
                case .success(let success):
                    cell.configure(with: success)
                case .failure(let failure):
                    print(failure)
                }
            }
        case Sections.TopRated.rawValue:
            APICaller.shared.getTopRatedMovie { results in
                switch results {
                case .success(let success):
                    cell.configure(with: success)
                case .failure(let failure):
                    print(failure)
                }
            }
        default:
            return UITableViewCell()
        }
        
        return cell
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//        // use show content
//        var content = cell.defaultContentConfiguration()
//        content.text = "Hello World"
//
//        cell.contentConfiguration = content
//
//        // Use for UI
//        cell.backgroundColor = .systemRed
//        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
//        var content = header.defaultContentConfiguration()
//        content.text = sectionTitles[section].lowercased()
//        content.textProperties.font = .systemFont(ofSize: 18, weight: .semibold)
//        content.textProperties.color = .white
//        header.contentConfiguration = content
//        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.height, width: 100, height: header.bounds.height)
//        header.textLabel?.text = header.textLabel?.text?.lowercased()
        
        header.textLabel?.text = sectionTitles[section]
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.height, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    // Scrollview
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
}
