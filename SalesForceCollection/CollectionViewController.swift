//
//  ViewController.swift
//  SalesForceCollection
//
//  Created by Mufakkharul Islam Nayem on 5/11/20.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
}

extension CollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let noOfItemsInRow: CGFloat = 2

        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let itemSpacing: CGFloat
        switch flowLayout.scrollDirection {
        case .horizontal:
            itemSpacing = flowLayout.minimumLineSpacing
        case .vertical:
            itemSpacing = flowLayout.minimumInteritemSpacing
        @unknown default:
            itemSpacing = 0
        }
        
        let leftRightInset = flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let totalSpace = leftRightInset + (itemSpacing * noOfItemsInRow - 1)

        let width = (collectionView.bounds.width - totalSpace) / noOfItemsInRow
        return CGSize(width: width, height: width)
        
    }
}
