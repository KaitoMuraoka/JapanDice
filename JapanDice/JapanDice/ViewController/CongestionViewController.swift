//
//  CongestionViewController.swift
//  JapanDice
//
//  Created by 村岡海人 on 2022/01/11.
//

import UIKit

class CongestionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var dailyLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()

        dailyLabel.text = "更新日：\(CongestionSingleton.shared.sightseeing[0].date)"
        
    }
    
    func setupCollectionView(){
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CongestionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 374, height: 200)
    }
    
    //1つのセクションの中に表示するセル(要素)の数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CongestionSingleton.shared.sightseeing.count
    }
    
    //Cell(要素)に表示する内容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CongestionCell", for: indexPath) as! CollectionViewCell
        
        return cell
    }
    
}

