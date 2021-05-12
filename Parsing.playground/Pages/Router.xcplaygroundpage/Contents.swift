import Foundation
import Parsing


struct User: Codable {
  let email: String
  let password: String
}

enum Route {
  case home
  case episodes(limit: Int?, offset: Int?)
  case episode(Int)
  case search(String?)
  case signUp(User)
}

let home = Method.get
  .skip(PathEnd())
  .map(/Route.home)

let episodes = Method.get
  .skip(PathComponent(StartsWith("episodes")))
  .skip(PathEnd())
  .take(Optional.parser(of: QueryItem("limit", Int.parser(isSigned: false))))
  .take(Optional.parser(of: QueryItem("offset", Int.parser(isSigned: false))))
  .map(/Route.episodes)

let episode = Method.get
  .skip(PathComponent(StartsWith("episodes")))
  .take(PathComponent(Int.parser(isSigned: false)))
  .skip(PathEnd())
  .map(/Route.episode)

let search = Method.get
  .skip(PathComponent(StartsWith("search")))
  .skip(PathEnd())
  .take(Optional.parser(of: QueryItem("q", Rest().map(String.fromSubsequence))))
  .map(/Route.search)

let signUp = Method.post
  .skip(PathComponent(StartsWith("sign-up")))
  .skip(PathEnd())
  .take(Body(User.fromJSON))
  .map(/Route.signUp)

let router = home
  .orElse(episodes)
  .orElse(episode)
  .orElse(search)
  .orElse(signUp)

router.parse(.init(URLRequest(url: URL(string: "/?ga=1")!)))
router.parse(.init(URLRequest(url: URL(string: "/episodes/1?ga=1")!)))
router.parse(.init(URLRequest(url: URL(string: "/episodes?limit=10")!)))
router.parse(.init(URLRequest(url: URL(string: "/episodes")!)))
router.parse(.init(URLRequest(url: URL(string: "/search?ga=1")!)))
router.parse(.init(URLRequest(url: URL(string: "/search?q=point-free&ga=1")!)))
router.parse(.init(URLRequest(url: URL(string: "/search")!)))
router.parse(.init(URLRequest(url: URL(string: "/search?q=")!)))

var req = URLRequest(url: URL(string: "/sign-up")!)
req.httpMethod = "post"
req.httpBody = Data("""
{"email":"support@pointfree.co","password":"blob8108"}
""".utf8)

router.parse(.init(req))

router.print(.search("blob"))
router.print(.search(""))
router.print(.search(nil)) // FIXME
router.print(.episode(42))
router.print(.episodes(limit: 10, offset: 10))
router.print(.episodes(limit: nil, offset: nil)) // FIXME
