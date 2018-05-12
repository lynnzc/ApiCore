//
//  LocalClient.swift
//  FileCore
//
//  Created by Ondrej Rafaj on 12/05/2018.
//

import Foundation
import Vapor
import ErrorsCore


/// Local filesystem client
public class LocalClient: FileManagement, Service {
    
    typealias Error = FileCoreManager.Error
    
    /// Configuration
    let config: LocalConfig
    
    /// Save file
    public func save(file: Data, to path: String, on container: Container) throws -> EventLoopFuture<Void> {
        let url = self.path(file: path)
        let promise = container.eventLoop.newPromise(Void.self)
        Async.dispatchQueue.async {
            do {
                try file.write(to: url)
                promise.succeed()
            } catch {
                promise.fail(error: Error.failedWriting(url.path, error))
            }
        }
        return promise.futureResult
    }
    
    /// Retrieve file
    public func get(file path: String, on container: Container) throws -> EventLoopFuture<Data> {
        let url = self.path(file: path)
        let promise = container.eventLoop.newPromise(Data.self)
        Async.dispatchQueue.async {
            do {
                if FileManager.default.fileExists(atPath: url.path) {
                    let data = try Data(contentsOf: url)
                    promise.succeed(result: data)
                } else {
                    promise.fail(error: Error.fileNotFound(url.path))
                }
            } catch {
                promise.fail(error: Error.failedWriting(url.path, error))
            }
        }
        return promise.futureResult
    }
    
    /// Delete file
    public func delete(file path: String, on container: Container) throws -> EventLoopFuture<Void> {
        let url = self.path(file: path)
        let promise = container.eventLoop.newPromise(Void.self)
        Async.dispatchQueue.async {
            do {
                if FileManager.default.fileExists(atPath: url.path) {
                    try FileManager.default.removeItem(at: url)
                    promise.succeed()
                } else {
                    promise.fail(error: Error.fileNotFound(url.path))
                }
            } catch {
                promise.fail(error: Error.failedWriting(url.path, error))
            }
        }
        return promise.futureResult
    }
    
    /// Initializer
    init(_ config: LocalConfig) {
        self.config = config
    }
    
}

// MARK: Private interface

extension LocalClient {
    
    func path(file path: String) -> URL {
        let url = URL(fileURLWithPath: config.root).appendingPathComponent(path)
        return url
    }
    
}
