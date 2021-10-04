```swift
import Appwrite

func main() {
    let client = Client()
      .setEndpoint("https://[HOSTNAME_OR_IP]/v1") // Your API Endpoint
      .setProject("5df5acd0d48c2") // Your project ID

    let users = Users(client: client)
    users.updateStatus(
        userId: "[USER_ID]",
        status: 1
    ) { result in
        switch result {
        case .failure(let error):
            print(error.message)
        case .success(var response):
            let json = response.body!.readString(length: response.body!.readableBytes)
        }
    }
}
```