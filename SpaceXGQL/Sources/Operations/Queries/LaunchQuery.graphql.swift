// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class LaunchQuery: GraphQLQuery {
  public static let operationName: String = "Launch"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query Launch($launchId: ID!) {
        launch(id: $launchId) {
          __typename
          ...LaunchDetails
        }
      }
      """,
      fragments: [LaunchDetails.self]
    ))

  public var launchId: ID

  public init(launchId: ID) {
    self.launchId = launchId
  }

  public var __variables: Variables? { ["launchId": launchId] }

  public struct Data: SpaceXGQL.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { SpaceXGQL.Objects.Query }
    public static var __selections: [Selection] { [
      .field("launch", Launch?.self, arguments: ["id": .variable("launchId")]),
    ] }

    public var launch: Launch? { __data["launch"] }

    /// Launch
    ///
    /// Parent Type: `Launch`
    public struct Launch: SpaceXGQL.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { SpaceXGQL.Objects.Launch }
      public static var __selections: [Selection] { [
        .fragment(LaunchDetails.self),
      ] }

      public var id: ID { __data["id"] }
      public var site: String? { __data["site"] }
      public var mission: LaunchDetails.Mission? { __data["mission"] }
      public var rocket: LaunchDetails.Rocket? { __data["rocket"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public var launchDetails: LaunchDetails { _toFragment() }
      }
    }
  }
}
