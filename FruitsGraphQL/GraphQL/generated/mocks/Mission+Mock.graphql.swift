// @generated
// This file was automatically generated and should not be edited.

import FruitsGraphQL

public class Mission: MockObject {
  public static let objectType: Object = Objects.Mission
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Mission>>

  public struct MockFields {
    @Field<String>("missionPatch") public var missionPatch
    @Field<String>("name") public var name
  }
}

public extension Mock where O == Mission {
  convenience init(
    missionPatch: String? = nil,
    name: String? = nil
  ) {
    self.init()
    self.missionPatch = missionPatch
    self.name = name
  }
}
