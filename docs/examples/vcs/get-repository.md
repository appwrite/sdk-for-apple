import Appwrite

let client = Client()
    .setEndpoint("https://cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("5df5acd0d48c2") // Your project ID

let vcs = Vcs(client)

let providerRepository = try await vcs.getRepository(
    installationId: "[INSTALLATION_ID]",
    providerRepositoryId: "[PROVIDER_REPOSITORY_ID]"
)

