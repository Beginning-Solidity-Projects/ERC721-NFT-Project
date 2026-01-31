// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {NFTTest} from "../src/NFTTest.sol";
import {Script} from "lib/forge-std/src/Script.sol";

contract DeployNFT is Script {

    function run() external returns(NFTTest) {
        vm.startBroadcast();
        NFTTest nftTest = new NFTTest();

        vm.stopBroadcast();
        return nftTest;
    }
}

