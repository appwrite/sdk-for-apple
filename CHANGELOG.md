# Change Log

## 17.0.0

* Breaking: Added `unsubscribe()`, `update()`, and `close()` for Realtime subscription lifecycle.
* Added: Added `userPhone` to the `Membership` model.
* Updated: Updated `X-Appwrite-Response-Format` header to `1.9.2`.

## 16.1.0

* Added `x` OAuth provider to `OAuthProvider` enum
* Added `userType` field to `Log` model
* Added `getHeaders()` method to `Client`
* Updated `X-Appwrite-Response-Format` header to `1.9.1`
* Updated TTL description for list caching in Databases and TablesDB

## 16.0.0

* [BREAKING] Changed `$sequence` type from `Int` to `String` for `Row` and `Document` models
* Added impersonation support: `setImpersonateUserId()`, `setImpersonateUserEmail()`, `setImpersonateUserPhone()` on `Client`
* Added `impersonator` and `impersonatorUserId` optional fields to `User` model
* Updated `Log` model field descriptions to clarify impersonation behavior for `userId`, `userEmail`, `userName`
* Fixed `NIOFoundationCompat` import to be conditional with `#if canImport` for platform compatibility
* Fixed `ByteBuffer` to `Data` conversion to use `readableBytesView` throughout (Client and WebSocket handler)
* Fixed `ByteBuffer(data:)` calls replaced with `ByteBuffer(bytes:)` for file/data loading
* Updated `X-Appwrite-Response-Format` header to `1.9.0`
* Updated API version badge to `1.9.0` and compatibility note to server version `1.9.x` in README

## 15.0.0

* Breaking: RealtimeChannel API required explicit IDs and threw errors.
* Added ttl parameter to listDocuments and listRows.
* Updated compatibility notes to latest server and SDK version.
* Updated Document and Row comments for clarity.

## 14.1.0

* Add `queries` parameter to Realtime subscriptions for filtering events
* Fix `Roles` enum removed from Teams service; `roles` parameter now accepts `[String]`
* Fix doc examples with proper formatting and complete client configuration

## 14.0.0

* Add array-based enum parameters (e.g., `permissions: [BrowserPermission]`).
* Breaking change: `Output` enum has been removed; use `ImageFormat` instead.
* Add `Channel` helpers for Realtime.

## 13.5.0

* Add `getScreenshot` method to `Avatars` service
* Add `Theme`, `Timezone` and `Output` enums

## 13.4.0

* Add `total` parameter to list queries allowing skipping counting rows in a table for improved performance
* Add `Operator` class for atomic modification of rows via update, bulk update, upsert, and bulk upsert operations

## 13.3.1

* Fix `onOpen` callback not being called when the websocket connection is established
* Fix add missing `scheduled` value to `ExecutionStatus` enum

## 13.3.0

* Add `onOpen`, `onClose` and `onError` callbacks to `Realtime` service

## 13.2.2

* Fix issue: Missing AppwriteEnums dependency causing build failure

## 13.2.1

* Add transaction support for Databases and TablesDB

## 13.1.0

* Deprecate `createVerification` method in `Account` service
* Add `createEmailVerification` method in `Account` service

## 10.2.0

* Update sdk to use swift-native doc comments instead of jsdoc styled comments as per [Swift Documentation Comments](https://github.com/swiftlang/swift/blob/main/docs/DocumentationComments.md)
* Add `incrementDocumentAttribute` and `decrementDocumentAttribute` support to `Databases` service
* Add `gif` support to `ImageFormat` enum
* Remove `Content-Type`, `Content-Length` headers and body from websocket requests

## 10.1.1

* Adds warnings to bulk operation methods
* Fix select Queries by updating internal attributes like id, createdAt, updatedAt etc. to be optional in Document model.
* Fix querying datetime values by properly encoding URLs

## 10.1.0

* Add `devKeys` support to `Client` service
* Add `upsertDocument` support to `Databases` service

## 10.0.0

* Add `<REGION>` to doc examples due to the new multi region endpoints
* Add `token` param to `getFilePreview` and `getFileView` for File tokens usage
* Remove `search` param from `listExecutions` method
* Remove `Gif` from ImageFormat enum

## 9.0.1

* Fix requests failing by removing `Content-Type` header from `GET` and `HEAD` requests

## 9.0.0

* Remove redundant titles from method descriptions.
* Add `codable` models
* Ensure response attribute in `AppwriteException` is always string
