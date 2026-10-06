```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let oauth2 = Oauth2(client)

let oauth2Token = try await oauth2.createToken(
    grant_type: "<GRANT_TYPE>",
    code: "<CODE>", // optional
    refresh_token: "<REFRESH_TOKEN>", // optional
    device_code: "<DEVICE_CODE>", // optional
    client_id: "<CLIENT_ID>", // optional
    client_secret: "<CLIENT_SECRET>", // optional
    code_verifier: "<CODE_VERIFIER>", // optional
    redirect_uri: "https://example.com", // optional
    resource: "", // optional
    audience: "<AUDIENCE>" // optional
)

```
