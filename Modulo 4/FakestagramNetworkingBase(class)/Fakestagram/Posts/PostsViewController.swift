//
//  This file is for educational purposes only. It may contain code snippets, examples, images, and explanations
//  intended to help understand concepts and improve programming skills.
//

import UIKit
import Combine

enum Section {
    case main
}

class PostsViewController: UITableViewController {
    
    private var postsModel = PostsModel()
    private var cancelLables = Set<AnyCancellable>()
    private var dataSource: UITableViewDiffableDataSource<Section, PostDTO>!
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        tabBarItem.image = UIImage(systemName: "text.viewfinder")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Post"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        dataSource = UITableViewDiffableDataSource(tableView: tableView) {tableView, indexPath, post in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "\(post.title)\n\n\(post.body)"
            cell.textLabel?.numberOfLines = 0
            return cell
        }
        
        postsModel.$posts
            .receive(on: RunLoop.main)
            .sink { [weak self] posts in
                self?.applySnapshot(with: posts)
            }
            .store(in: &cancelLables)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        try? postsModel.getPosts()
    }
    
    func applySnapshot(with post: [PostDTO]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, PostDTO>()
        snapshot.appendSections([.main])
        snapshot.appendItems(post)
        dataSource.apply(snapshot, animatingDifferences: true)
    }

}


