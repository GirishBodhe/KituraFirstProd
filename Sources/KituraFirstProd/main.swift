import Foundation
import Kitura
import LoggerAPI
import HeliumLogger
import Application
import SwiftKuery
import SwiftKueryORM
import SwiftKueryPostgreSQL



do {
    
    let pool = PostgreSQLConnection.createPool(host: "cfrricqaguiajb", port: 5432, options: [.databaseName("school")], poolOptions: ConnectionPoolOptions(initialCapacity: 10, maxCapacity: 50, timeout: 10000))
    Database.default = Database(pool)
    
   
    struct Grade: Model {
        var course: String
        var grade: Int
        
    }
    
    do {
        try Grade.createTableSync()
    } catch {
        // Error
    }
    
    let grade = Grade(course: "Computer Science", grade: 76)
    
    // Save to the database
    grade.save { student, error in
        
    }
  
//    class Grades: Table {
//        let tableName = "Grades"
//        let id = Column("id", Int32.self, primaryKey: true)
//        let course = Column("course", String.self)
//        let grade = Column("grade", Int32.self)
//    }
//    let grades = Grades()
////    let pool = PostgreSQLConnection.createPool(host: "localhost", port: 5432, options: [.databaseName("school")], poolOptions: ConnectionPoolOptions(initialCapacity: 10, maxCapacity: 50, timeout: 10000))
//    let students: [[Any]] = [[6, "computing", 921], [7, "physics", 751], [8, "history", 831]]
//
//    if let connection = pool.getConnection() {
//
//        let insertQuery = Insert(into: grades, rows: students)
//
//        connection.execute(query: insertQuery) { insertResult in
//
//            connection.execute(query: Select(from: grades)) { selectResult in
//
//                if let resultSet = selectResult.asResultSet {
//
//                    for row in resultSet.rows {
//                        print("Student \(row[0] ?? ""), studying \(row[1] ?? ""), scored \(row[2] ?? "")")
//                    }
//                }
//            }
//        }
//    }
   
    HeliumLogger.use(LoggerMessageType.info)

    let app = try App()
    try app.run()

} catch let error {
    Log.error(error.localizedDescription)
}
