// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {SimpleFoundation} from "../src/SimpleFoundation.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeploySimpleFoundation is Script {
    function run() external returns (SimpleFoundation) {
        //Before startBroadcast -> not a real transaction (not spending gas)
        HelperConfig helperConfig = new HelperConfig();
        vm.startBroadcast();

        //After startBroadcast -> a real transaction (spending gas)
        SimpleFoundation simpleFoundation = new SimpleFoundation(
            helperConfig.activeNetworkConfig()
        );
        vm.stopBroadcast();
        return simpleFoundation;
    }
}
