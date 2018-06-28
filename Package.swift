// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "KituraFirstProd",
    dependencies: [
      .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMinor(from: "2.4.0")),
      .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", .upToNextMinor(from: "1.7.1")),
      .package(url: "https://github.com/IBM-Swift/CloudEnvironment.git", from: "7.1.0"),
      .package(url: "https://github.com/RuntimeTools/SwiftMetrics.git", from: "2.0.0"),
      .package(url: "https://github.com/IBM-Swift/Health.git", from: "1.0.0"),
      .package(url: "https://github.com/IBM-Swift/CLibpq.git", .upToNextMinor(from: "0.1.0")),
      .package(url: "https://github.com/IBM-Swift/Swift-Kuery-ORM.git", from: "0.0.1"),
      .package(url: "https://github.com/IBM-Swift/Swift-Kuery-PostgreSQL.git", from: "1.0.0"),
     .package(url: "https://github.com/IBM-Swift/SwiftKueryMySQL.git", .upToNextMinor(from: "1.0.0")),
      ],
    
    targets: [
      .target(name: "KituraFirstProd", dependencies: [ .target(name: "Application"), "Kitura" , "HeliumLogger","CLibpq", "SwiftKueryORM", "SwiftKueryPostgreSQL","SwiftKueryMySQL"]),
      .target(name: "Application", dependencies: [ "Kitura", "CloudEnvironment","SwiftMetrics","Health",      ]),
      .testTarget(name: "ApplicationTests" , dependencies: [.target(name: "Application"), "Kitura","HeliumLogger" ]),
      
      
      
//      .target(
//        name: "KituraFirstProd",
//        dependencies: ["SwiftKuery"]
//        ),
//      .target(name: "KituraFirstProd" , dependencies: ["SwiftKueryPostgreSQL"]),
    ]
)
