//
//  PersistenceDataInteractorProtocol.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

public protocol PersistenceDataInteractorProtocol {
  func getAll<T: RunTimeModelProtocol>(of type: T.Type) -> AnyPublisher<[T], DatabaseError>

  func addOrUpdate(objects: [RunTimeModelProtocol]) -> AnyPublisher<Void, DatabaseError>

  func allCacheIdentifiableModelsPublisher<T: RunTimeModelProtocol>(
    of type: T.Type
  ) -> AnyPublisher<[T], DatabaseError>

  func cacheIdentifiableModel<T: RunTimeModelProtocol>(
    for requestKey: String,
    of type: T.Type
  ) -> AnyPublisher<T, DatabaseError>

  func setCacheIdentifiable(model: RunTimeModelProtocol) -> AnyPublisher<Void, DatabaseError>

  func remove<T: RunTimeModelProtocol>(object: T) -> AnyPublisher<Void, DatabaseError>
  func removeAll<T: RunTimeModelProtocol>(of type: T.Type) -> AnyPublisher<T.Type, DatabaseError>
}
