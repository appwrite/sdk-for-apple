```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProjectQuery("<YOUR_PROJECT_ID>") // Your project ID

let oauth2 = Oauth2(client)

let oauth2Authorize = try await oauth2.authorize(
    project_id: "<PROJECT_ID>",
    client_id: "<CLIENT_ID>",
    redirect_uri: "https://example.com",
    response_type: "code",
    scope: "<SCOPE>",
    state: "<STATE>", // optional
    nonce: "<NONCE>", // optional
    code_challenge: "<CODE_CHALLENGE>", // optional
    code_challenge_method: "s256", // optional
    prompt: "<PROMPT>", // optional
    max_age: 0, // optional
    authorization_details: "<AUTHORIZATION_DETAILS>" // optional
)

```
