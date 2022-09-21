//
//  StateMachineEventType.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

/// Modules events - uses only with custom `CustomEvent`.
public enum StateMachineEventType<CustomEvent: StateMachineTypesProtocol>: StateMachineTypesProtocol {
  /// Custom event.
  case custom(CustomEvent)
  /// Any event.
  case any
}

/// Empty custom events.
public struct StateMachineNoCustomEvent: StateMachineTypesProtocol {}

/// Custom events protocol. All custom events should be subscribed on it.
public protocol StateMachineCustomEvent: StateMachineTypesProtocol {}
