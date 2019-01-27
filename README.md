# SwiftyHawk

[![Version](https://img.shields.io/cocoapods/v/SwiftyHawk.svg?style=flat)](https://cocoapods.org/pods/SwiftyHawk)
[![License](https://img.shields.io/cocoapods/l/SwiftyHawk.svg?style=flat)](https://cocoapods.org/pods/SwiftyHawk)
[![Platform](https://img.shields.io/cocoapods/p/SwiftyHawk.svg?style=flat)](https://cocoapods.org/pods/SwiftyHawk)

#### Based on the original implementation of Hawk: https://github.com/hueniverse/hawk.

## Installation

SwiftyHawk is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftyHawk'
```

## Usage

Usage is easy and straight forward, here is the basic usage:

```swift
let creds = HawkCredentials(id: "123456", key: "2983d45yun89q", algorithm: .SHA1)
let client = try! HawkClient(creds: creds)
let options = HawkOptions(url: URL(string: "http://www.example.com/resource/q?x=z&y=r"), method: .post)
let header = try! client.generateAuthorizationHeader(usingOptions: options) // example output: Hawk id=\"123456\", ts=\"1353809207\", nonce=\"Ygvqdz\", ext=\"Bazinga!\", mac=\"qbf1ZPG/r/e06F4ht+T77LXi5vw=\"
```


##### Based on the server implementation and your own requirements, you can change the following properties in the `options` class:

```swift
/// Extra information to pass to the server
public var ext: String?

/// A pre-calcualated hash of the payload, if the payload validation is required.
public var payloadHash: String?

/// If the payload validation is required, and the hash not calcualted.
public var payload: String?

/// Payload ContentType, If the payload validation is required, and the hash not calcualted.
public var contentType: String?

/// Optional Timestamp, if not provided HawkClient will get the current TimeStamp
public var ts: Int?

/// Optional Nonce, if not provided HawkClient will generate a random nonce.
public var nonce: String?

/// Oz Application Id
public var app: String?

/// Oz delegator
public var dlg: String?
```

## Tests

Few client tests are included in the project to test the output of the `generateAuthorizationHeader` method for now, PRs are welcome to have a more structured, inclusive tests!


## What's Next?

Only `generateAuthorizationHeader` is implemented for now, so there's a lot of work to be done..

#### How to contribute?

There're open issues for the missing parts of Hawk, you can start with that.. PRs are welcome!

As a reference, clone `https://github.com/hueniverse/hawk` for specs (or you can read it from github directly)..
