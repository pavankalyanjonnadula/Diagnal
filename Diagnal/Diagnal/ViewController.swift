//
//  ViewController.swift
//  Diagnal
//
//  Created by Pavan Kalyan Jonnadula on 06/06/20.
//  Copyright © 2020 Pavan Kalyan Jonnadula. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var moviesCollectionView: UICollectionView!
    var moveContent : [Content] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.moviesCollectionView.delegate = self
        self.moviesCollectionView.dataSource = self
        readLocalFile(forName: "PAGE1")
        readLocalFile(forName: "PAGE2")
        readLocalFile(forName: "PAGE3")

    }

    func readLocalFile(forName name: String){
        do {
            if let bundlePath = Bundle.main.path(forResource: name,ofType: "json"),let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let decodedData = try JSONDecoder().decode(Movies.self,from: jsonData)
                self.moveContent += decodedData.page.content_items.content
                print("the data",decodedData.page.content_items.content[0].name)
              
                self.moviesCollectionView.reloadData()
            }
        } catch {
            print(error)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MoviesCollectionViewCell
        let movieAtIndex = moveContent[indexPath.item]
        cell.movieNameLabel.text = movieAtIndex.name
        cell.moviesImage.image = UIImage(named: movieAtIndex.poster_image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moveContent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width/3.0 , height: 214)
    }
}

class MoviesCollectionViewCell : UICollectionViewCell{
    
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var moviesImage: UIImageView!
}
