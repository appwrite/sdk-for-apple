import Foundation

open class AppwriteError : Swift.Error, Decodable {

    public let message: String

    init(message: String) {
        self.message = message
    }
}
