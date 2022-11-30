// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol FruitsGraphQL_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == FruitsGraphQL.SchemaMetadata {}

public protocol FruitsGraphQL_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == FruitsGraphQL.SchemaMetadata {}

public protocol FruitsGraphQL_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == FruitsGraphQL.SchemaMetadata {}

public protocol FruitsGraphQL_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == FruitsGraphQL.SchemaMetadata {}

public extension FruitsGraphQL {
  typealias ID = String

  typealias SelectionSet = FruitsGraphQL_SelectionSet

  typealias InlineFragment = FruitsGraphQL_InlineFragment

  typealias MutableSelectionSet = FruitsGraphQL_MutableSelectionSet

  typealias MutableInlineFragment = FruitsGraphQL_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    public static func objectType(forTypename typename: String) -> Object? {
      switch typename {
      case "Query": return FruitsGraphQL.Objects.Query
      case "LaunchConnection": return FruitsGraphQL.Objects.LaunchConnection
      case "Launch": return FruitsGraphQL.Objects.Launch
      case "Mission": return FruitsGraphQL.Objects.Mission
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}