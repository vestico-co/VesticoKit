# VesticoKit

[![CI Status](https://img.shields.io/travis/557660/VesticoKit.svg?style=flat)](https://travis-ci.org/557660/VesticoKit)
[![Version](https://img.shields.io/cocoapods/v/VesticoKit.svg?style=flat)](https://cocoapods.org/pods/VesticoKit)
[![License](https://img.shields.io/cocoapods/l/VesticoKit.svg?style=flat)](https://cocoapods.org/pods/VesticoKit)
[![Platform](https://img.shields.io/cocoapods/p/VesticoKit.svg?style=flat)](https://cocoapods.org/pods/VesticoKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 13 or later
- Your Vestico client id

## Installation

VesticoKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'VesticoKit'
```

## Usage

The sample app shows how VesticoKit can be used within an eCommerce app.

### Initializing VesticoKit
The first call to VesticoKit is to initialize the SDK with the shop credentials: 
```Swift
guard let vesticoInfoURL = Bundle.main.url(forResource: "VesticoSDKInfo", withExtension: "plist") else {
    print("Cannot find Vestico SDK Info")
    return false
}
VesticoKit.register(withConfigFileURL: vesticoInfoURL)
```

**`VesticoSDKInfo.plist`** requires the following fields: 
- `environmentURLPath`: URL to the Vestico environment
- `clientID`: A unique client id provided to you by Vestico
- `apiKey`: A API key provided to you by Vestico 
 
 Send a request to the [Vestico Integration Support team](mailto:integration@vestico.co) including the app bundle identifiers you wish to enable to retrieve your account details.
 
 **NOTE**
Vestico offers demo environments allowing you to try out the SDK.


### Receiving Widget Events

```Swift
VesticoKit.delegate = self
```

In your ViewController, you set the `VesticoKit.delegate` to the View Controller to receive events from `VesticoKitDelegate`

```Swift
public protocol VesticoKitDelegate {
    func didReceiveButtonUpdate(forProductUID productUID: String, contentMatchEnabled: Bool, sizeRecommendationEnabled: Bool)
    func didLoadProduct(withUID productUID: String)
}
```


### Loading Products
Load products by passing the product id and widget type.
```Swift
VesticoKit.configure(forProductUID: "<#productUID#>", presenting: <#vesticoWidgetType#>)
```
- `<#productUID#>` is the uid of the product in your shop
- `<#vesticoWidgetType#>` is the type of widget you want to load. On PDPs this is usually `.carousel` for the Vestico carousel


### Recording conversion events
Record conversion events to understand your customers
```Swift
VesticoKit.recordConversion(forOrderUID <#orderUID#>, items: <#items#>)
```
- `<#orderUID#>` is the order UID as String
- `<#items#>` is an array of `OrderItem` objects 

## Author

Vestico Ltd, info@vestico.co

## License

VesticoKit is available under the GNU Lesser General Public License v3 (LGPL-3.0) license. See the LICENSE file for more info.
