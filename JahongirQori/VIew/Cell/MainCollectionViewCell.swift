//
//  MainCollectionViewCell.swift
//  JahongirQori
//
//  Created by Faxriddin Mo'ydinxonov on 13/01/24.
//

import UIKit
import SnapKit

class MainCollectionViewCell: UICollectionViewCell {
    
    //MARK: - ProPorties -
    
    static let identifier: String = "MainCollectionViewCell"
    
    let mainIV: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "prayer")
        return image
    }()
    
    let minusIV: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "minus")
        return image
    }()
    
    let unitName: UILabel = {
        let label = UILabel()
        label.text = "Prayer"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .gray
        return label
    }()
    
    let unitGoal: UILabel = {
        let label = UILabel()
        label.text = "Learn how to pray"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpItems()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //setUpItems
    
    func setUpItems() {
        
        //mainIV
        self.addSubview(mainIV)
        mainIV.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.snp.left).offset(10)
            make.width.height.equalTo(50)
        }
        
        self.addSubview(minusIV)
        minusIV.snp.makeConstraints { make in
            make.top.centerY.equalToSuperview()
            make.left.equalTo(mainIV.snp.right).offset(2)
            make.width.equalTo(20)
            make.height.equalTo(50)
        }
        
        self.addSubview(unitName)
        unitName.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(5)
            make.left.equalTo(minusIV.snp.right).offset(10)
        }
        self.addSubview(unitGoal)
        unitGoal.snp.makeConstraints { make in
            make.top.equalTo(unitName.snp.bottom).offset(2)
            make.left.equalTo(minusIV.snp.right).offset(10)
        }
        
    }
}
