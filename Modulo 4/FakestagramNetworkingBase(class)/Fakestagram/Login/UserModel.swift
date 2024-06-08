//
//  This file is for educational purposes only. It may contain code snippets, examples, images, and explanations
//  intended to help understand concepts and improve programming skills.
//

import Foundation

class UserModel {
    
    var user: User?
    
    
    
}

enum UsermModelError: Error, LocalizedError {
    case userNotFound
    case fileError
    case parsingError
    
    var errorDescription: String? {
        switch self {
        case .userNotFound: return "User not found"
        case .fileError: return "File not found"
        case .parsingError: return "Could not parse response"
        }
    }
}

extension UserModel {
    func saveUser(from dto: UserDTO) {
        guard let id = dto.id, let name = dto.name, let email = dto.email, let username = dto.username else { return }
        user = User(id: id, name: name, username: username, email: email)
    }
    
    func findUser_byDictionary(by email: String) throws {
        let url = Bundle.main.url(forResource: "Users", withExtension: "json")!
        guard let data = try? Data(contentsOf: url) else { throw UsermModelError.fileError }
        guard let userFromFile = try? JSONSerialization.jsonObject(with: data) as?
                [[String: Any]] else { throw UsermModelError.parsingError }
        let userDTO = userFromFile.first { user in
                let userEmail = user["email"] as? String
                return userEmail == email
        }
        guard let userDTO,
              let id = userDTO["id"] as? Int,
              let name = userDTO["name"] as? String,
              let username = userDTO["username"] as? String else { throw UsermModelError.userNotFound } //user not found
        user = User(id: id, name: name, username: username, email: email)
        
    }
    
    func findUser(by email: String) throws {
        guard let url = Bundle.main.url(forResource: "Users", withExtension: "json"),
              let data = try? Data(contentsOf: url) else { throw UsermModelError.fileError }
        let usersDTOs = try JSONDecoder().decode([UserDTO].self, from: data)
        guard let userDTO = usersDTOs.first(where: {email == $0.email}) else {throw
            UsermModelError.userNotFound}
        saveUser(from: userDTO)
        
    }
    
    
}

