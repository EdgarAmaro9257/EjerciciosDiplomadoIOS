//
//  This file is for educational purposes only. It may contain code snippets, examples, images, and explanations
//  intended to help understand concepts and improve programming skills.
//

import Foundation
import Combine

class PostsModel {
    @Published var posts: [PostDTO] = []
    
    func getPosts() throws {
        guard let url = Bundle.main.url(forResource: "Posts", withExtension: "json") else {return}
        let data = try Data(contentsOf: url)
        posts = try JSONDecoder().decode([PostDTO].self, from: data)
        
    }
}





