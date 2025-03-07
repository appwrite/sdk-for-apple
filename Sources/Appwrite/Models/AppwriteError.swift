import Foundation

open class AppwriteError : Swift.Error, Decodable {

    public let message: String
    public let code: Int?
    public let type: String?
    public let response: String

    init(message: String, code: Int? = nil, type: String? = nil, response: String = "") {
        self.message = message
        self.code = code
        self.type = type
        self.response = response
    }
}

extension AppwriteError: CustomStringConvertible {
    public var description: String {
        get {
            return self.message
        }
    }
}

extension AppwriteError: LocalizedError {
    public var errorDescription: String? {
        get {
            return self.message
        }
    }
}
