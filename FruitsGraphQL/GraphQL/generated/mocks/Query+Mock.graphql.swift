// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import FruitsGraphQL

public class Query: MockObject {
  public static let objectType: Object = FruitsGraphQL.Objects.Query
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Query>>

  public struct MockFields {
    @Field<Launch>("launch") public var launch
    @Field<LaunchConnection>("launches") public var launches
  }
}

public extension Mock where O == Query {
  convenience init(
    launch: Mock<Launch>? = nil,
    launches: Mock<LaunchConnection>? = nil
  ) {
    self.init()
    self.launch = launch
    self.launches = launches
  }
}