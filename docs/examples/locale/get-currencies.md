```swift
import Appwrite

func main() async throws {
    let client = Client()
      .setEndpoint("https://[HOSTNAME_OR_IP]/v1") // Your API Endpoint
      .setProject("5df5acd0d48c2") // Your project ID
    let locale = Locale(client)
    let currencyList = try await locale.getCurrencies()

    print(String(describing: currencyList)
}
```
