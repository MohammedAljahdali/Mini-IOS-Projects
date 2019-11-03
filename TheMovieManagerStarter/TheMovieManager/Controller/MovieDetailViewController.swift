//
//  MovieDetailViewController.swift
//  TheMovieManager
//
//  Created by Owen LaRosa on 8/13/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var watchlistBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var favoriteBarButtonItem: UIBarButtonItem!
    
    var movie: Movie!
    
    var isWatchlist: Bool {
        return MovieModel.watchlist.contains(movie)
    }
    
    var isFavorite: Bool {
        return MovieModel.favorites.contains(movie)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = movie.title
        
        toggleBarButton(watchlistBarButtonItem, enabled: isWatchlist)
        toggleBarButton(favoriteBarButtonItem, enabled: isFavorite)
        imageView.image =  UIImage(named: "PosterPlaceholder")
        if let path = movie.posterPath {
            TMDBClient.downloadPoster(path: path, completion: donwloadPosterHelper(data:error:))
        }
    }
    
    func donwloadPosterHelper(data: Data?, error: Error?) {
        guard let data = data else {return}
        DispatchQueue.main.async {
            self.imageView.image = UIImage(data: data)
        }
    }
    
    @IBAction func watchlistButtonTapped(_ sender: UIBarButtonItem) {
        TMDBClient.addToWatchlist(body: MarkWatchlist(mediaType: "movie", mediaId: movie.id, watchlist: !isWatchlist), completion: addToWatchlistHelper(success:error:))
    }
    
    func addToWatchlistHelper(success: Bool, error: Error?) {
        if success {
            if isWatchlist {
                MovieModel.watchlist = MovieModel.watchlist.filter() {$0 != self.movie}
            } else {MovieModel.watchlist.append(movie)}
            toggleBarButton(watchlistBarButtonItem, enabled: isWatchlist)
        }
    }
    
    @IBAction func favoriteButtonTapped(_ sender: UIBarButtonItem) {
        TMDBClient.addToFavorite(body: MarkFavorite(mediaType: "movie", mediaId: movie.id, favorite: !isFavorite), completion: addToFavoriteHelper(success:error:))
    }
    
    func addToFavoriteHelper(success: Bool, error: Error?) {
        if success {
            if isFavorite {
                MovieModel.favorites = MovieModel.favorites.filter() {$0 != self.movie}
            } else {MovieModel.favorites.append(movie)}
            toggleBarButton(favoriteBarButtonItem, enabled: isFavorite)
        }
    }
    
    func toggleBarButton(_ button: UIBarButtonItem, enabled: Bool) {
        if enabled {
            button.tintColor = UIColor.primaryDark
        } else {
            button.tintColor = UIColor.gray
        }
    }
    
    
}
