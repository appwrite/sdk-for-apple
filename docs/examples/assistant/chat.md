import Appwrite

let client = Client()
    .setEndpoint("https://cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("5df5acd0d48c2") // Your project ID

let assistant = Assistant(client)

let result = try await assistant.chat(
    prompt: "[PROMPT]"
)

