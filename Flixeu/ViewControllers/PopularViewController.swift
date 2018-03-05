//
//  PopularViewController.swift
//  Flixeu
//
//  Created by Regie Daquioag on 3/4/18.
//  Copyright © 2018 Nicole Hipolito. All rights reserved.
//

import UIKit

class PopularViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        let cellsPerLine: CGFloat = 2
        let interItemSpacingItemTotal = layout.minimumInteritemSpacing * cellsPerLine
        let width = (collectionView.frame.size.width / cellsPerLine) - (interItemSpacingItemTotal / cellsPerLine)
        layout.itemSize = CGSize(width: width, height: width*3/2)
        fetchMovies()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCell", for: indexPath ) as! PopularCell
        let movie = movies[indexPath.item]
        let posterURL = movie.posterUrl
        cell.popularImageView.af_setImage(withURL: posterURL!)
        return cell
    }
    
    
    func fetchMovies(){
        MovieApiManager().fetchPopularMovies { (movies: [Movie]?, error: Error?) in
            if let movies = movies {
                self.movies = movies
                self.collectionView.reloadData()
            
            }
        }
    }
    
}
