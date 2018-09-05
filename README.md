# IGDBWrapper
A Swift wrapper for the IGDB.com Free Video Game Database API.

## About IGDB
One of the principles behind IGDB.com is accessibility of data. We wish to share the data with anyone who wants to build cool videogame oriented websites, apps and services. This means that the information you contribute to IGDB.com can be used by other projects as well.

Thus, you are not only contributing to the value of this site but to thousands of other projects as well. We are looking forward to see what exciting game related projects you come up with. Happy coding!

More info here:
* [About the API](https://www.igdb.com/api)
* [API Documentation](https://igdb.github.io/api/about/welcome/)

# Installation and setup
### CocoaPods
[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```
To integrate IGDBWrapper into your Xcode project using CocoaPods, specify it in your `Podfile`:
```ruby
pod 'IGDBWrapper', git: "https://github.com/igdb/igdb-api-swift.git"
```

Then, run the following command:

```bash
$ pod install
```

## Using your API key
* Create a new IGDBWrapper Object by passing you 3Scale key
```swift
let wrapper: IGDBWrapper = IGDBWrapper(apiKey: "YOUR_API_KEY")
```

* If you have a 3Scale Pro key set the Pro version
```swift
let wrapper: IGDBWrapper = IGDBWrapper(apiKey: "YOUR_API_KEY", apiVersion: .Pro)
```

## Usage
All API endpoints are available as methods in the IGDBWrapper object. Each method has the following signature:
### wrapper.endpoint(Parameters, onSuccessClousure, onErrorClosure)
__Arguments__
* Parameters - An object specifying the operations to be performed, ex. expander, filter, ordering etc. These Operations can be found in the API documentation under References: (https://igdb.github.io/api/references/)
* onSuccessClosure - The closure is used to return to the previous method once the wrapper has retrieved the desired data from the API.
* onErrorClosure  -  The closure is used to return to the previous method if the wrapper falies to retrieved the desired data from the API.

__Example__ 
* Requesting games from API
```swift
let wrapper: IGDBWrapper = IGDBWrapper(apiKey: "YOUR_API_KEY")
let params: Parameters = Parameters()
	.add(fields: "*")
	.add(order: "published_at:desc")
	
wrapper.games(params: params, onSuccess: {(jsonResponse: [Game]) -> (Void) in
      // Do something with resulting jsonResponse (JsonArray)
}, onError: {(Error) -> (Void) in
     // Do something on error
})

/* The sent request will look like this:
https://api-2445582011268.apicast.io/games/?fields=*&order=published_at:desc */

```
The rest of the endpoints work similarly to the Games endpoint except for two cases presented bellow.

* Requesting search from the API
```swift
let wrapper: IGDBWrapper = IGDBWrapper(apiKey: "YOUR_API_KEY")
let params: Parameters = Parameters()
	.add(search: "searchQuery")
	.add(fields: "*")
	.add(order: "published_at:desc")

wrapper.search(endpoint: .GAMES, params: params, onSuccess: {(jsonResponse: [Game]) -> (Void) in
      // Do something with resulting jsonResponse (JsonArray)
}, onError: {(Error) -> (Void) in
      // Do something on error
})

/* The sent request will look like this:
https://api-2445582011268.apicast.io/games/?search=searchQuery&fields=*&order=published_at:desc */

```
The search endpoint need an extra parameter, Endpoint, as you can search any endpoint for information.

* Filtering a request result
```swift
let wrapper: IGDBWrapper = IGDBWrapper(apiKey: "YOUR_API_KEY")
let params: Parameters = Parameters()
	.add(fields: "*")
	.add(filter: "[themes][not_in]=42")
	.add(order: "published_at:desc")

wrapper.games(params: params, onSuccess: {(jsonResponse: [Game]) -> (Void) in
      // Do something with resulting jsonResponse (JsonArray)
}, onError: {(Error) -> (Void) in
     // Do something on error
})

/* The sent request will look like this:
https://api-2445582011268.apicast.io/games/?search=searchQuery&fields=*&filter[themes][not_in]=42&order=published_at:desc */

```
Filtering requires extra information in the arguments and needs to be written out like in the example above. 
Information about Filtering and the postfixes like 'not_in' can be found [here](https://igdb.github.io/api/references/filters/).

The rest of the available Endpoints are [Available Here](https://igdb.github.io/api/endpoints/).
The IGDB API documentation provides [details on search parameters](https://igdb.github.io/api/references/filters/).

## Expander Example
To use the expander api in structs you have to use the `expand()` function
```swift
var userReviews: [Review] = []

let params: Parameters = Parameters()
	    .add(fields: "*")
            .add(expand: "game")
            .add(order: "created_at:desc")
        
wrapper.reviews(params: params, onSuccess: { (reveiewResponse: [Review]) -> (Void) in
		self.userReviews = reveiewResponse
}, onError: {(Error) -> (Void) in
		// Do something on error
})

let review = userReviews[1]
let expandedGame = review.game?.expand() // <- Returns the expanded Struct
print(expandedGame.name)

/* The sent request will look like this:
https://api-2445582011268.apicast.io/reveiws/?fields=*&expand=game&order=created_at:desc */

```

## More examples
```swift

let wrapper: IGDBWrapper = IGDBWrapper(apiKey: "YOUR_API_KEY")

/*
Search for up to two Atari platforms and return their names
*/
let params: Parameters = Parameters()
	.add(search: "Atari")
	.add(fields: "name")
	.add(limit: "2")

wrapper.search(endpoint: .PLATFORMS, params: params, onSuccess: {(jsonResponse: [Platform]) -> (Void) in
      // JSONArray containing 2 Atari platforms
}, onError: {(Error) -> (Void) in
      // Do something on error
})

/* The sent request will look like this:
https://api-2445582011268.apicast.io/platforms/?search=Atari&fields=name&limit=2 */

/*
Search for up to five Zelda games with release dates between 1 Jan and
31 Dec 2011, sorted by release date in descending order.
*/
let params: Parameters = Parameters()
	.add(search: "Zelda")
	.add(fields: "name,release_dates.date,rating,hypes,cover")
	.add(filter: "[release_dates.date][gt]=2010-12-31")
	.add(filter: "[release_dates.date][lt]=2012-01-01")
	.add(limit: "2")
	.add(offset: "0")
	.add(order: "release_dates.date:desc")

wrapper.search(endpoint: .PLATFORMS, params: params, onSuccess: {(jsonResponse: [Platform]) -> (Void) in
      // JSONArray containing 5 Zelda games
}, onError: {(Error) -> (Void) in
      // Do something on error
})

/* The sent request will look like this:
https://api-2445582011268.apicast.io/games/?search=Zelda&fields=name,release_dates.date,rating,hypes,cover&filter[release_dates.date][gt]=2010-12-31&filter[release_dates.date][lt]=2012-01-01&limit=5&order=release_dates.date:desc */

/*
Search for two specific games by their IDs
*/
let params: Parameters = Parameters()
	.add(ids: "18472,18228")
	.add(fields: "name,cover")

wrapper.games(params: params, onSuccess: {(jsonResponse: [Game]) -> (Void) in
      // JSONArray containing 2 games
}, onError: {(Error) -> (Void) in
     // Do something on error
})

/*
The sent request will look like this:
https://api-2445582011268.apicast.io/games/18472,18228?fields=name,cover
*/

/*
Search for companies with 'rockstar' in their name. Return up to five
results sorted by name in descending order
*/
let params: Parameters = Parameters()
	.add(search: "rockstar")
	.add(fields: "name,logo")
	.add(filter: "[name][in]=rockstar")
	.add(limit: "5")
	.add(offset: "0")
	.add(order: "name:desc")

wrapper.search(endpoint: .COMPANIES, params: params, onSuccess: {(jsonResponse: [Company]) -> (Void) in
      // JSONArray containing five companies with rockstar in their name
}, onError: {(Error) -> (Void) in
      // Do something on error
})

/* The sent request will look like this:
https://api-2445582011268.apicast.io/companies/?search=rockstar&fields=name,logo&filter[name][in]=rockstar&limit=5&offset=0&order=name:desc */
```
