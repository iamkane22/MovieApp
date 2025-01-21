//
//  TopRatedCell.swift
//  MovieApp
//
//  Created by Kenan on 18.01.25.
//

import UIKit
import Foundation

protocol TopRatedCellProtocol {
    var titleString: String {get}
    var subTitleString: String {get}
    var iconUrl: String {get}
}

final class TopRatedCell: UICollectionViewCell {
    
    private lazy var productImage = UIImageView().withUsing {
        $0.backgroundColor = .clear
        $0.image = UIImage(named: "poster")
        $0.layer.cornerRadius = 16
        $0.layer.masksToBounds = true
    }
    
    private lazy var titleLabel = UILabel().withUsing {
        $0.text = "The wolf of wall street"
        $0.textColor = .label
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    
    private lazy var subtitleLabel = UILabel().withUsing {
        $0.text = "Feb 08, 2015"
        $0.textColor = .secondaryLabel
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    }
    
    private lazy var textStack: UIStackView = {
        let s = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        s.alignment = .fill
        s.distribution = .fill
        s.axis = .vertical
        s.spacing = 4
        return s
    }()
    
    private lazy var stackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [productImage, textStack])
        s.alignment = .fill
        s.distribution = .fill
        s.axis = .vertical
        s.spacing = 12
        return s
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func configureUI() {
        addSubview(stackView)
        productImage.heightAnchor.constraint(
            equalTo: heightAnchor, multiplier: 0.8)
        .isActive = true
        stackView.fillSuperview()
    }
    
    func configureCell(model: TopRatedCellProtocol) {
        titleLabel.text = model.titleString
        subtitleLabel.text = model.subTitleString
        if model.iconUrl.isNotEmpty {
            productImage.loadImageURL(url: model.iconUrl)
        }
        
    }
}
