//
//  CellCollectionView.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 9.04.25.
//

import UIKit

class CellCollectionView: UICollectionView {
    
    let viewController = ViewController()
    let countCellLine = 1
    let countCell = 10
    let flowLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: flowLayout)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.collectionViewLayout = flowLayout
        self.translatesAutoresizingMaskIntoConstraints = false
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = .zero
        
        self.register(Cell.self, forCellWithReuseIdentifier: "cell")
        delegate = self
        dataSource = self
    }
}

extension CellCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewController.historyArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? Cell else {
            return UICollectionViewCell()
        }
        cell.expressionLabel.text = viewController.historyArray[indexPath.row].joined()
        return cell
    }
}

extension CellCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width / CGFloat(countCellLine)
        return CGSize(width: width, height: 80)
    }
}

extension CellCollectionView: UICollectionViewDelegate {
    
}
