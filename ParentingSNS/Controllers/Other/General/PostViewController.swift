//
//  PostViewController.swift
//  ParentingSNS
//
//

import UIKit

/*
 
 Section
 - Header Model
 Section
 - Post Cell Model
 Section
 - Action Buttons Cell Model
 Section
 - n Number of General Models for Comments
 
 */

/// States of a Rendered Cell
enum PostRenderType {
    case header(provider: User)
    case primaryContent(provider: UserPost) // post
    case actions(provider: String) // like, comment, share
    case comments(comments: [PostComment])
}

/// Model of a Rendered Post
struct PostRenderViewModel {
    let renderType: PostRenderType
}

class PostViewController: UIViewController {

    private let model: UserPost?
    
    private var renderModels = [PostRenderViewModel]()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
                
        // Register cells
        tableView.register(FeedPostTableViewCell.self,
                           forCellReuseIdentifier: FeedPostTableViewCell.identifier)
        tableView.register(FeedPostHeaderTableViewCell.self,
                           forCellReuseIdentifier: FeedPostHeaderTableViewCell.identifier)
        tableView.register(FeedPostActionTableViewCell.self,
                           forCellReuseIdentifier: FeedPostActionTableViewCell.identifier)
        tableView.register(FeedPostGeneralTableViewCell.self,
                           forCellReuseIdentifier: FeedPostGeneralTableViewCell.identifier)
        
        
        return tableView
    }()
    
    // MARK: Init
    
    init(model: UserPost?) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        configureModels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureModels() {
        
        guard let userPostModel = self.model else {
            return
        }
        // Header
        renderModels.append(PostRenderViewModel(renderType: .header(provider: userPostModel.owner)))
        
        // Post
        renderModels.append(PostRenderViewModel(renderType: .primaryContent(provider: userPostModel)))
        
        // Actions
        renderModels.append(PostRenderViewModel(renderType: .actions(provider: "")))
        
        // Comments
        var comments = [PostComment]()
        for x in 0..<4 {
            comments.append(
                PostComment(identifier: "123_\(x)",
                            username: "@Kris",
                            text: "Great Photo!",
                            createdDate: Date(),
                            likes: []))
        }
        renderModels.append(PostRenderViewModel(renderType: .comments(comments: comments)))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    

}

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return renderModels.count
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch renderModels[section].renderType {
            case .actions(_): return 1
            case .comments(let comments): return comments.count > 4 ? 4 : comments.count
            case .primaryContent(_): return 1
            case .header(_): return 1
        }
//        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = renderModels[indexPath.section]
        
        switch model.renderType {
            case .actions(let actions):
                let cell = tableView.dequeueReusableCell(withIdentifier: FeedPostActionTableViewCell.identifier,
                                                         for: indexPath) as! FeedPostActionTableViewCell
                return cell
                
            case .comments(let comments):
                let cell = tableView.dequeueReusableCell(withIdentifier: FeedPostGeneralTableViewCell.identifier,
                                                         for: indexPath) as! FeedPostGeneralTableViewCell
                return cell
                
            case .primaryContent(let post):
                let cell = tableView.dequeueReusableCell(withIdentifier: FeedPostTableViewCell.identifier,
                                                         for: indexPath) as! FeedPostTableViewCell
                return cell
                
            case .header(let user):
                let cell = tableView.dequeueReusableCell(withIdentifier: FeedPostHeaderTableViewCell.identifier,
                                                         for: indexPath) as! FeedPostHeaderTableViewCell
                return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = renderModels[indexPath.section]
        
        switch model.renderType {
            case .actions(_): return 60
                
            case .comments(_): return 50
                
        case .primaryContent(_): return tableView.width
                
            case .header(_): return 70
        }
    }
}