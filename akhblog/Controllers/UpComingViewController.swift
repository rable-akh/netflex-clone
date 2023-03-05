//
//  UpComingViewController.swift
//  akhblog
//
//  Created by Aung Kyaw Htay on 11/02/2023.
//

import UIKit

class UpComingViewController: UIViewController {
    
    private var titles: [Title] = [Title]()

    private let upComingTable: UITableView = {
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        title = "Upcoming"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(upComingTable)
        upComingTable.delegate = self
        upComingTable.dataSource = self
        
        fetchUpcomingMovies()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        upComingTable.frame = view.bounds
    }
    
    private func fetchUpcomingMovies() {
        APICaller.shared.getUpcomingMovie { [weak self] results in
            switch results {
            case .success(let success):
                self?.titles = success
                DispatchQueue.main.async {
                    self?.upComingTable.reloadData()
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
            
        }
    }

}


extension UpComingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
            return UITableViewCell()
        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = titles[indexPath.row].original_title ?? titles[indexPath.row].original_title ?? "Unknown"
        
        let titles = titles[indexPath.row]
        
        cell.configure(with: TitleViewModel(titlePath: titles.poster_path ?? "Unknown title", titleName: titles.original_title!))
        
//        cell.configure(with: TitleViewModel(id: titles.id, poster_path: titles.poster_path ?? "Unknown", adult: titles.adult, overview: titles.overview, release_date: titles.release_date, genre_ids: titles.genre_ids, original_title: titles.original_title, original_language: titles.original_language, title: titles.title, backdrop_path: titles.backdrop_path, popularity: titles.popularity, vote_count: titles.vote_count, video: titles.video, vote_average: titles.vote_average))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}
