//
//  ViewController.swift
//  JahongirQori
//
//  Created by Faxriddin Mo'ydinxonov on 13/01/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //MARK: - Proporties
    
    let backgroundImage: UIImageView = {
        let image  = UIImageView()
        image.image = UIImage(named: "background")
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view settings
        view.backgroundColor = .systemBackground
        setUp()
        
        title = "Jahongir Qori"
    }

    //setUpItems
    
    func setUp() {
        
        //backgroundImage
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.centerX.top.width.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.4)
        }
        
        //layout and mainCV
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        
        let mainCV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(mainCV)
        
        //shadow for collection view
        mainCV.layer.shadowColor = UIColor.black.cgColor
        mainCV.layer.shadowOpacity = 0.5
        mainCV.layer.shadowOffset = CGSize(width: 0, height: 2)
        mainCV.layer.shadowRadius = 4
        mainCV.layer.masksToBounds = false
        mainCV.layer.cornerRadius = 10
        //delegate
        mainCV.delegate = self
        mainCV.dataSource = self
        mainCV.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        mainCV.snp.makeConstraints { make in
            make.top.equalTo(view.snp.centerY).multipliedBy(0.68)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.height.equalTo(view.snp.height).multipliedBy(0.6)
        }
    }

}

extension ViewController: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    //UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as! MainCollectionViewCell
        
        //cell.udateUI(item: viewModel.getData(index: indexPath.item))
        
        //cell settings
        cell.layer.cornerRadius = 10
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowRadius = 4
        cell.backgroundColor = .systemBackground
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width) - 60, height: (view.frame.height) / 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
    }
    
}
