//
//  This file is for educational purposes only. It may contain code snippets, examples, images, and explanations
//  intended to help understand concepts and improve programming skills.
//

import Foundation

enum PostsModelError: Error {
    case fileError
    case badRequest
    case unexpectedResponse
    case badResponse(Int)
    case userNotFound
}

class PostsModel {
    var posts: [Post]?
    
    func post(for index: Int) -> Post? {
        posts?[index]
    }
    
    func getNumberOfPosts() -> Int {
        posts?.count ?? 0
    }
    
    func getPosts(userID: Int, completionHandler: @escaping (Error?) -> Void) {
        guard let request = buildRequest(byQuery: true, userID: userID) else {
            completionHandler(PostsModelError.badRequest)
            return
        }
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error {
                completionHandler(error)
            } else {
                guard let httpResponse = response as? HTTPURLResponse else {
                    completionHandler(PostsModelError.unexpectedResponse)
                    return
                }
                guard httpResponse.statusCode == 200 else {
                    completionHandler(PostsModelError.badResponse(httpResponse.statusCode))
                    return
                }
                do {
                    guard let data else {
                        completionHandler(PostsModelError.userNotFound)
                        return
                    }
                    let postsDTO = try JSONDecoder().decode([PostDTO].self, from: data)
                    self?.posts = postsDTO.map { Post(title: $0.title, body: $0.body) }
                    completionHandler(nil)
                } catch {
                    completionHandler(error)
                }
            }
        }
        task.resume()
    }
    
    func buildRequest(byQuery: Bool, userID: Int) -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"
        components.queryItems = [
            URLQueryItem(name: "_page", value: "1"),
            URLQueryItem(name: "_limit", value: "10")
        ]
        if byQuery {
            components.path = "/posts"
            components.queryItems?.append(URLQueryItem(name: "userId", value: "\(userID)"))
        } else {
            components.path = "/users/\(userID)/posts"
        }
        guard let url = components.url else { return nil }
        return URLRequest(url: url)
    }
}

struct Post {
    let title: String
    let body: String
}

struct PostDTO: Decodable {
    let title: String
    let body: String
}

