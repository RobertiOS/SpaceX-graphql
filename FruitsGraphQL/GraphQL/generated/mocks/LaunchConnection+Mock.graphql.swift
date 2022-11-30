// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import FruitsGraphQL

public class LaunchConnection: MockObject {
  public static let objectType: Object = FruitsGraphQL.Objects.LaunchConnection
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<LaunchConnection>>

  public struct MockFields {
    @Field<String>("cursor") public var cursor
    @Field<Bool>("hasMore") public var hasMore
    @Field<[Launch?]>("launches") public var launches
  }
}

public extension Mock where O == LaunchConnection {
  convenience init(
    cursor: String? = nil,
    hasMore: Bool? = nil,
    launches: [Mock<Launch>?]? = nil
  ) {
    self.init()
    self.cursor = cursor
    self.hasMore = hasMore
    self.launches = launches
  }
}