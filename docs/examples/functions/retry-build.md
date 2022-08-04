```swift
import Appwrite

func main() async throws {
    let client = Client()
      .setEndpoint("https://[HOSTNAME_OR_IP]/v1") // Your API Endpoint
      .setProject("5df5acd0d48c2") // Your project ID
    let functions = Functions(client)
    let result = try await functions.retryBuild(
        functionId: "[FUNCTION_ID]",
        deploymentId: "[DEPLOYMENT_ID]",
        buildId: "[BUILD_ID]"
    )

    print(String(describing: result)
}
```
