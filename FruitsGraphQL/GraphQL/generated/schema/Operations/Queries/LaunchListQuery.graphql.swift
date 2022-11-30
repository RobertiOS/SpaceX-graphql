// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension FruitsGraphQL {
  class LaunchListQuery: GraphQLQuery {
    public static let operationName: String = "LaunchList"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        query LaunchList($after: String) {
          launches(after: $after) {
            __typename
            cursor
            hasMore
            launches {
              __typename
              id
              site
              mission {
                __typename
                missionPatch
              }
            }
          }
        }
        """
      ))

    public var after: GraphQLNullable<String>

    public init(after: GraphQLNullable<String>) {
      self.after = after
    }

    public var __variables: Variables? { ["after": after] }

    public struct Data: FruitsGraphQL.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { FruitsGraphQL.Objects.Query }
      public static var __selections: [Selection] { [
        .field("launches", Launches.self, arguments: ["after": .variable("after")]),
      ] }

      public var launches: Launches { __data["launches"] }

      /// Launches
      ///
      /// Parent Type: `LaunchConnection`
      public struct Launches: FruitsGraphQL.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { FruitsGraphQL.Objects.LaunchConnection }
        public static var __selections: [Selection] { [
          .field("cursor", String.self),
          .field("hasMore", Bool.self),
          .field("launches", [Launch?].self),
        ] }

        public var cursor: String { __data["cursor"] }
        public var hasMore: Bool { __data["hasMore"] }
        public var launches: [Launch?] { __data["launches"] }

        /// Launches.Launch
        ///
        /// Parent Type: `Launch`
        public struct Launch: FruitsGraphQL.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { FruitsGraphQL.Objects.Launch }
          public static var __selections: [Selection] { [
            .field("id", ID.self),
            .field("site", String?.self),
            .field("mission", Mission?.self),
          ] }

          public var id: ID { __data["id"] }
          public var site: String? { __data["site"] }
          public var mission: Mission? { __data["mission"] }

          /// Launches.Launch.Mission
          ///
          /// Parent Type: `Mission`
          public struct Mission: FruitsGraphQL.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { FruitsGraphQL.Objects.Mission }
            public static var __selections: [Selection] { [
              .field("missionPatch", String?.self),
            ] }

            public var missionPatch: String? { __data["missionPatch"] }
          }
        }
      }
    }
  }

}