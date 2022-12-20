//
//  UserFollowTableViewCell.swift
//  ParentingSNS
//
//

import UIKit

protocol UserFollowTableViewCellDelegate: AnyObject {
    func didTapFollowUnfollowButton(model: UserRelationship)
}

enum FollowState {
    case following // current user is following the other user
    case not_following // current user is not following the other user
}

struct UserRelationship {
    let username: String
    let name: String
    let type: FollowState
}

class UserFollowTableViewCell: UITableViewCell {

    static let identifier = "UserFollowTableViewCell"
    
    weak var delegate: UserFollowTableViewCellDelegate?
    
    private var model: UserRelationship?
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.text = "Kristina"
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
//        label.font = .systemFont(ofSize: 16, weight: .regular)
//        label.textColor = .secondaryLabel
//        label.text = "@Kristina"
        label.font = .circularBold(size: 16)
        label.textColor = .greyishBrown()
        label.text = "emjaypee"
        
        return label
    }()
    
    private let followButton: UIButton = {
        let button = UIButton()
//        button.backgroundColor = .link
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(profileImageView)
//        contentView.addSubview(nameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(followButton)
        
        followButton.addTarget(self,
                               action: #selector(didTapFollowButton),
                               for: .touchUpInside)
    }
    
    @objc private func didTapFollowButton() {
        guard let model = model else {
            return
        }
        delegate?.didTapFollowUnfollowButton(model: model)
    }
    
    public func configure(with model: UserRelationship) {
        self.model = model
        nameLabel.text = model.name
        usernameLabel.text = model.username
        switch model.type {
        case .following:
            // show unfollow button
            followButton.clipsToBounds = true
            followButton.tintColor = .systemRed
            followButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
//            followButton.setTitle("Unfollow", for: .normal)
//            followButton.setTitleColor(.label, for: .normal)
//            followButton.backgroundColor = .systemBackground
//            followButton.layer.borderWidth = 1
//            followButton.layer.borderColor = UIColor.label.cgColor
        case .not_following:
            // show follow button
            followButton.clipsToBounds = true
            followButton.tintColor = .label
            followButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
//            followButton.setTitle("Follow", for: .normal)
//            followButton.setTitleColor(.white, for: .normal)
//            followButton.backgroundColor = .label
//            followButton.layer.borderWidth = 0
//            followButton.layer.borderColor = UIColor.label.cgColor
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
        nameLabel.text = nil
        usernameLabel.text = nil
        followButton.setTitle(nil, for: .normal)
        followButton.layer.borderWidth = 0
        followButton.backgroundColor = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageView.frame = CGRect(x: safeAreaInsets.left + 24,
                                        y: (contentView.height - 36) / 2,
                                        width: 36,
                                        height: 36)
//                                        width: contentView.height - 6,
//                                        height: contentView.height - 6)
        profileImageView.layer.cornerRadius = profileImageView.height / 2.0
    
//        let buttonWidth = contentView.width > 500 ? 220.0 : contentView.width / 3
        let buttonWidth = CGFloat(28)
        let userLabelWidth = CGFloat(225)
        followButton.frame = CGRect(x: profileImageView.right + 22 + userLabelWidth + 16,
                                    y: profileImageView.top + 4,
                                    width: buttonWidth,
                                    height: buttonWidth)
//        followButton.frame = CGRect(x: contentView.width - 5 - buttonWidth,
//                                    y: (contentView.height - 40) / 2,
//                                    width: buttonWidth,
//                                    height: 40)

      
//        let labelHeight = contentView.height / 2
//        nameLabel.frame = CGRect(x: profileImageView.right + 5,
//                                 y: 0,
//                                 width: contentView.width - 8 - profileImageView.width - buttonWidth,
//                                 height: labelHeight)
        let labelHeight = CGFloat(22)
        usernameLabel.frame = CGRect(x: profileImageView.right + 22,
                                     y: profileImageView.top + 7,
                                     width: userLabelWidth,
                                     height: labelHeight)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
