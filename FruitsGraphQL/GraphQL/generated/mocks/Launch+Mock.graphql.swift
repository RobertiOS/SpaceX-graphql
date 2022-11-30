// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import FruitsGraphQL

public class Launch: MockObject {
  public static let objectType: Object = FruitsGraphQL.Objects.Launch
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Launch>>

  public struct MockFields {
    @Field<ID>("id") public var id
    @Field<Mission>("mission") public var mission
    @Field<Rocket>("rocket") public var rocket
    @Field<String>("site") public var site
  }
}

public extension Mock where O == Launch {
  convenience init(
    id: ID? = nil,
    mission: Mock<Mission>? = nil,
    rocket: Mock<Rocket>? = nil,
    site: String? = nil
  ) {
    self.init()
    self.id = id
    self.mission = mission
    self.rocket = rocket
    self.site = site
  }
}
