//
//  ApiCoreBase+Database.swift
//  ApiCore
//
//  Created by Ondrej Rafaj on 17/04/2019.
//

import Foundation
import Vapor
import FluentPostgreSQL


extension ApiCoreBase {
    
    static func setupDatabase(_ services: inout Services) throws {
        // Migrate models / tables
        add(model: Team.self, database: DatabaseIdentifier<Team.Database>.db)
        add(model: User.self, database: DatabaseIdentifier<User.Database>.db)
        add(model: TeamUser.self, database: DatabaseIdentifier<TeamUser.Database>.db)
        add(model: Token.self, database: DatabaseIdentifier<Token.Database>.db)
        add(model: ErrorLog.self, database: DatabaseIdentifier<ErrorLog.Database>.db)
        add(model: System.self, database: DatabaseIdentifier<System.Database>.db)
        add(model: Setting.self, database: DatabaseIdentifier<Setting.Database>.db)
        
        // Data migrations
        migrationConfig.add(migration: BaseMigration.self, database: .db)
        
        // Set database on tables that don't have migration
        FluentDesign.defaultDatabase = .db
        
        // Database - Load database details
        let host = configuration.database.host ?? "localhost"
        let port = configuration.database.port ?? 5432
        let databaseConfig = ApiCoreDb.config(
            hostname: host,
            user: configuration.database.user,
            password: configuration.database.password,
            database: configuration.database.database,
            port: port
        )
        
        print("Configuring database '\(configuration.database.database)' on \(configuration.database.user)@\(host):\(port)")
        
        try services.register(FluentPostgreSQLProvider())
        
        self.databaseConfig = databaseConfig
        
        services.register(databaseConfig)
        services.register(migrationConfig)
    }
    
    /// Add / register model
    public static func add<Model>(model: Model.Type, database: DatabaseIdentifier<Model.Database>) where Model: Fluent.Migration, Model: Fluent.Model, Model.Database: SchemaSupporting {
        models.append(model)
        migrationConfig.add(model: model, database: database)
    }
    
}
