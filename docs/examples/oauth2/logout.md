```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let oauth2 = Oauth2(client)

let result = try await oauth2.logout(
    id_token_hint: "<ID_TOKEN_HINT>", // optional
    logout_hint: "<LOGOUT_HINT>", // optional
    client_id: "<CLIENT_ID>", // optional
    post_logout_redirect_uri: "https://example.com", // optional
    state: "<STATE>", // optional
    ui_locales: "<UI_LOCALES>" // optional
)

```
