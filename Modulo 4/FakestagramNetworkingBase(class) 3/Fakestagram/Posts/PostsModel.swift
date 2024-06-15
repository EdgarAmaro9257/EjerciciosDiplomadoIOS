import Foundation

enum Error_Posts: Error {
    case fileError
    case badRequest
    case unexpectedResponse
    case badResponse(Int)
    case userNotFound
}

struct Post {
    let title: String
    let body: String
}

struct PostDTO: Decodable {
    let title: String
    let body: String
}

class PostsModel {
    var posts: [Post]?
    let requestHandler: RequestHandlerProtocol = RequestHandler()

    func post(for index: Int) -> Post? {
        posts?[index]
    }

    func getNumberOfPosts() -> Int {
        posts?.count ?? 0
    }

    func getPosts(userID: Int, completionHandler: @escaping (Error?) -> Void) {
        requestHandler.get(buildEndpoint(userID: userID)) { (result: Result<[PostDTO], Error>) in
            switch result {
            case .success(let postsDTO):
                self.posts = postsDTO.map { Post(title: $0.title, body: $0.body) }
                completionHandler(nil)
            case .failure(let error):
                completionHandler(error)
            }
        }
    }

    func buildEndpoint(userID: Int) -> EndpointProtocol {
        let queries = [
            URLQueryItem(name: "_page", value: "1"),
            URLQueryItem(name: "_limit", value: "10"),
            URLQueryItem(name: "userId", value: "\(userID)")
        ]
        return UserBaseEndpoint(path: "/posts", queries: queries)
    }
}
