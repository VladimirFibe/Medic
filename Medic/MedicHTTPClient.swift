import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

struct EmailResponse: Codable {
    let message: String?
    let errors: String?
}

struct CodeResponse: Codable {
    let token: String?
    let errors: String?
}

struct Catalog: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: String
    let time_result: String
    let preparation: String
    let bio: String
}

struct News: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: String
    let image: String
}

final class MedicHTTPClient {
    static let shared = MedicHTTPClient()
    private init(){}
    
    func sendCode(email: String) async throws {
        guard let url = URL(string: "https://medic.madskill.ru/api/sendCode") else { throw NetworkError.invalidURL}
        var request = URLRequest(url: url)
        request.setValue(email, forHTTPHeaderField: "email")
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.httpMethod = "POST"
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        guard let response = try? JSONDecoder().decode(EmailResponse.self, from: data) else {
            throw NetworkError.decodingError
        }
        print(response)
    }
    func signin(email: String, code: String) async throws -> String{
        guard let url = URL(string: "https://medic.madskill.ru/api/signin") else { throw NetworkError.invalidURL}
        var request = URLRequest(url: url)
        request.setValue(code, forHTTPHeaderField: "code")
        request.setValue(email, forHTTPHeaderField: "email")
        request.setValue("application/json", forHTTPHeaderField: "accept")
        
        request.httpMethod = "POST"
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        guard let response = try? JSONDecoder().decode(CodeResponse.self, from: data) else {
            throw NetworkError.decodingError
        }
        return response.token ?? ""
    }
    func catalog() async throws -> [Catalog] {
        guard let url = URL(string: "https://medic.madskill.ru/api/catalog") else { throw NetworkError.invalidURL}
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.httpMethod = "GET"
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        guard let response = try? JSONDecoder().decode([Catalog].self, from: data) else {
            throw NetworkError.decodingError
        }
        return response
    }
    func news() async throws -> [News] {
        guard let url = URL(string: "https://medic.madskill.ru/api/news") else { throw NetworkError.invalidURL}
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.httpMethod = "GET"
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        guard let response = try? JSONDecoder().decode([News].self, from: data) else {
            throw NetworkError.decodingError
        }
        return response
    }
}
