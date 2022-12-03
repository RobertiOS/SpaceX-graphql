// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct LaunchDetails: SpaceXGQL.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment LaunchDetails on Launch {
      __typename
      id
      site
      mission {
        __typename
        missionPatch
        name
      }
      rocket {
        __typename
        name
      }
    }
    """ }

  public let __data: DataDict
  public init(data: DataDict) { __data = data }

  public static var __parentType: ParentType { SpaceXGQL.Objects.Launch }
  public static var __selections: [Selection] { [
    .field("id", ID.self),
    .field("site", String?.self),
    .field("mission", Mission?.self),
    .field("rocket", Rocket?.self),
  ] }

  public var id: ID { __data["id"] }
  public var site: String? { __data["site"] }
  public var mission: Mission? { __data["mission"] }
  public var rocket: Rocket? { __data["rocket"] }

  /// Mission
  ///
  /// Parent Type: `Mission`
  public struct Mission: SpaceXGQL.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { SpaceXGQL.Objects.Mission }
    public static var __selections: [Selection] { [
      .field("missionPatch", String?.self),
      .field("name", String?.self),
    ] }

    public var missionPatch: String? { __data["missionPatch"] }
    public var name: String? { __data["name"] }
  }

  /// Rocket
  ///
  /// Parent Type: `Rocket`
  public struct Rocket: SpaceXGQL.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { SpaceXGQL.Objects.Rocket }
    public static var __selections: [Selection] { [
      .field("name", String?.self),
    ] }

    public var name: String? { __data["name"] }
  }
}
