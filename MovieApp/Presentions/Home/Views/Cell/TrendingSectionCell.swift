//
//  TrendingSectionCell.swift
//  MovieApp
//
//  Created by Kenan on 05.01.25.
//

import UIKit
protocol TrandingSectionCellProtocol: AnyObject {
    func didClickSegment(index: Int)
}

final class TrandingSectionCell: UICollectionViewCell {
    
    private lazy var titleLabel = UILabel().withUsing {
        $0.text = "Tranding"
        $0.textColor = .label
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    private lazy var segmentView = UISegmentedControl(
        items: ["Day", "Week"]
    ).withUsing {
        $0.selectedSegmentIndex = 0
        $0.addTarget(self, action: #selector(segmentClicked), for: .valueChanged)
        $0.backgroundColor = .blue
    }
    
    private lazy var stackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [titleLabel, segmentView])
        s.alignment = .fill
        s.distribution = .fill
        s.axis = .vertical
        s.spacing = 4
        return s
    }()
    
    weak var delegate: TrandingSectionCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func configureUI() {
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    @objc
    private func segmentClicked() {
        print(#function, segmentView.selectedSegmentIndex)
        delegate?.didClickSegment(index: segmentView.selectedSegmentIndex)
    }
}
