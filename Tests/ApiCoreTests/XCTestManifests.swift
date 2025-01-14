#if !canImport(ObjectiveC)
import XCTest

extension ApiCoreTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__ApiCoreTests = [
        ("testLinuxTests", testLinuxTests),
        ("testRequestHoldsSessionID", testRequestHoldsSessionID),
    ]
}

extension AuthControllerTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__AuthControllerTests = [
        ("testExpiredGetTokenAuthRequest", testExpiredGetTokenAuthRequest),
        ("testFailingPasswordCheck", testFailingPasswordCheck),
        ("testHtmlInputRecoveryRequest", testHtmlInputRecoveryRequest),
        ("testInvalidGetAuthRequest", testInvalidGetAuthRequest),
        ("testInvalidGetTokenAuthRequest", testInvalidGetTokenAuthRequest),
        ("testInvalidPostAuthRequest", testInvalidPostAuthRequest),
        ("testInvalidPostTokenAuthRequest", testInvalidPostTokenAuthRequest),
        ("testLinuxTests", testLinuxTests),
        ("testStartRecovery", testStartRecovery),
        ("testSuccessfulPasswordCheck", testSuccessfulPasswordCheck),
        ("testValidGetAuthRequest", testValidGetAuthRequest),
        ("testValidGetTokenAuthRequest", testValidGetTokenAuthRequest),
        ("testValidPostAuthRequest", testValidPostAuthRequest),
        ("testValidPostTokenAuthRequest", testValidPostTokenAuthRequest),
    ]
}

extension GenericControllerTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__GenericControllerTests = [
        ("testLinuxTests", testLinuxTests),
        ("testPing", testPing),
        ("testTables", testTables),
        ("testTeapot", testTeapot),
        ("testUnknownDelete", testUnknownDelete),
        ("testUnknownGet", testUnknownGet),
        ("testUnknownPatch", testUnknownPatch),
        ("testUnknownPost", testUnknownPost),
        ("testUnknownPut", testUnknownPut),
    ]
}

extension StringCryptoTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__StringCryptoTests = [
        ("testPasswordHash", testPasswordHash),
    ]
}

extension TeamsControllerTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__TeamsControllerTests = [
        ("testCreateEmptyTeam", testCreateEmptyTeam),
        ("testCreateTeam", testCreateTeam),
        ("testDeleteAdminTeam", testDeleteAdminTeam),
        ("testDeleteSingleTeam", testDeleteSingleTeam),
        ("testGetSingleTeam", testGetSingleTeam),
        ("testGetTeams", testGetTeams),
        ("testGetTeamUsers", testGetTeamUsers),
        ("testInvalidTeamNameCheck", testInvalidTeamNameCheck),
        ("testLinkUser", testLinkUser),
        ("testLinkUserSingleTeamUpdateFail", testLinkUserSingleTeamUpdateFail),
        ("testLinkUserThatDoesntExist", testLinkUserThatDoesntExist),
        ("testLinuxTests", testLinuxTests),
        ("testSingleTeamDeleteFail", testSingleTeamDeleteFail),
        ("testSingleTeamUpdateFail", testSingleTeamUpdateFail),
        ("testTryLinkUserWhereHeIs", testTryLinkUserWhereHeIs),
        ("testTryUnlinkUserWhereHeIsNot", testTryUnlinkUserWhereHeIsNot),
        ("testUnableToDeleteOtherPeoplesTeam", testUnableToDeleteOtherPeoplesTeam),
        ("testUnlinkUser", testUnlinkUser),
        ("testUnlinkUserSingleTeamUpdateFail", testUnlinkUserSingleTeamUpdateFail),
        ("testUnlinkUserThatDoesntExist", testUnlinkUserThatDoesntExist),
        ("testUnlinkYourselfWhenLastUser", testUnlinkYourselfWhenLastUser),
        ("testUpdateSingleTeam", testUpdateSingleTeam),
        ("testValidTeamNameCheck", testValidTeamNameCheck),
        ("testValidTeamNameCheckSingleTeamUpdateFail", testValidTeamNameCheckSingleTeamUpdateFail),
    ]
}

extension UsersControllerTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__UsersControllerTests = [
        ("testGetUsers", testGetUsers),
        ("testIdentify", testIdentify),
        ("testInviteExistingUser", testInviteExistingUser),
        ("testInviteUser", testInviteUser),
        ("testLinuxTests", testLinuxTests),
        ("testRegisterUser", testRegisterUser),
        ("testRegisterUserInvalidDomain1", testRegisterUserInvalidDomain1),
        ("testRegisterUserInvalidDomain2", testRegisterUserInvalidDomain2),
        ("testRegisterUserValidDomain", testRegisterUserValidDomain),
        ("testRegistrationsHaveBeenDisabled", testRegistrationsHaveBeenDisabled),
        ("testSearchUsersWithoutParams", testSearchUsersWithoutParams),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ApiCoreTests.__allTests__ApiCoreTests),
        testCase(AuthControllerTests.__allTests__AuthControllerTests),
        testCase(GenericControllerTests.__allTests__GenericControllerTests),
        testCase(StringCryptoTests.__allTests__StringCryptoTests),
        testCase(TeamsControllerTests.__allTests__TeamsControllerTests),
        testCase(UsersControllerTests.__allTests__UsersControllerTests),
    ]
}
#endif
