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
```
VesticoKit.prepare(with: "https://widget.vestico.co", with: "<#vestico-shop-id#>")
```
- `<#vestico-shop-id#>` is your unique shop id. In case you can't find the shop id, reach out to [Vestico support](help@vestico.co) to retrieve the shop id.

### Receiving Widget Events

```
VesticoKit.delegate = self
```

In your ViewController, you set the VesticoKit delegate to the View Controller to receive `VesticoSessionDelegate` events from VesticoKit

```
public protocol VesticoSessionDelegate {
	func didReceiveFitMatchUpdate(forProduct product: String, enabled: Bool)
	func didLoadProduct(_ product: String)
}
```


### Loading Products
Load products by passing the product id and widget type.
```
VesticoKit.configure(for: "<#product-id#>", presenting: <#vestico-widget-type#>)
```
- `<#product-id#>` is the uid of the product in your shop
- `<#vestico-widget-type#>` is the type of widget you want to load. On PDPs this is usually `.carousel` for the Vestico carousel


## Author

Vestico Ltd, info@vestico.co

## License

VesticoKit is available under the GNU Lesser General Public License v3 (LGPL-3.0) license. See the LICENSE file for more info.
