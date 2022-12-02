// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport

public class Rocket: MockObject {
  public static let objectType: Object = Objects.Rocket
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Rocket>>

  public struct MockFields {
    @Field<String>("name") public var name
  }
}

public extension Mock where O == Rocket {
  convenience init(
    name: String? = nil
  ) {
    self.init()
    self.name = name
  }
}
