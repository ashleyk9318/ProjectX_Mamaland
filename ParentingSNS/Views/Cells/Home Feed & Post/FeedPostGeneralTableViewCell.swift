//
//  FeedPostGeneralTableViewCell.swift
//  ParentingSNS
//
//

import UIKit

/// Comments
class FeedPostGeneralTableViewCell: UITableViewCell {

    static let identifier = "FeedPostGeneralTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemOrange
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        // configure the cell
         
    }
   
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}
