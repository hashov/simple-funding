// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {SimpleFoundation} from "../src/SimpleFoundation.sol";
import {DeploySimpleFoundation} from "../script/DeploySimpleFoundation.s.sol";

contract SimpleFoundationTest is Test {
    SimpleFoundation internal fundMe;

    function setUp() external {
        //The test setup uses the deployment script so,
        //we can setup the deployment on 1 place and it will be reused for tests as well.
        DeploySimpleFoundation deploySimpleFoundation = new DeploySimpleFoundation();
        fundMe = deploySimpleFoundation.run();
    }

    function testMinimumUsdIsFive() public view {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMessageSender() public view {
        assertEq(fundMe.i_owner(), msg.sender);
    }

    function testPriceFeedVersionIsAccurate() public view {
        uint256 version = fundMe.getVersion();
        assertEq(version, 4);
    }
}
