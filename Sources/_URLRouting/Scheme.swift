import Foundation

/// Parses a request's scheme.
///
/// Used to require a particular scheme at a particular endpoint. This is useful
/// when building deeplinking support for your app, which declares a specific
/// scheme used to launch the app, e.g. "myApp" as seen in example below:
///
/// ```swift
/// let appRouter = Parse {
/// 	Scheme("myApp") // match app's declared scheme
/// 	OneOf {
/// 		Route(.case(AppRoute.home)) {
/// 			Path { "home" }
/// 			homeRouter
/// 		}
/// 		Route(.case(AppRoute.settings)) {
/// 			Path { "settings" }
/// 			settingsRouter
/// 		}
/// 	}
/// }
/// ```
public struct Scheme: ParserPrinter {
	@usableFromInline
	let name: String
	
	/// Initializes a request scheme parser with a scheme name.
	///
	/// - Parameter name: A scheme name.
	@inlinable
	public init(
		_ name: String
	) {
		self.name = name
	}
	
	@inlinable
	public func parse(_ input: inout URLRequestData) throws {
		guard let scheme = input.scheme else { throw RoutingError() }
		try self.name.parse(scheme)
		input.scheme = nil
	}
	
	@inlinable
	public func print(_ output: (), into input: inout URLRequestData) {
		input.scheme = self.name
	}
}
