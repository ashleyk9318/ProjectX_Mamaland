//
//  Checkbox.swift
//  ParentingSNS
//
//

import UIKit

final class Checkbox: UIView {
    
    var isChecked = false
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isHidden = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemBlue
        imageView.image = UIImage(systemName: "checkmark")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemRed
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public func toggle() {
        self.isChecked = !isChecked
        
        imageView.isHidden = !isChecked
    }
}
