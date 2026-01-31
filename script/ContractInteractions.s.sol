// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "../foundry-devops/src/DevOpsTools.sol";
import {Script} from "lib/forge-std/src/Script.sol";
import {NFTTest} from "../src/NFTTest.sol";

contract ContractInteractions is Script {
    string public constant bearURI = "QmPSX4ujjarVJDjygtcQeTeWLekP9yDvhdz1cGecrot14b";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("NFTTest", block.chainid);
        mintNFTOnContract(mostRecentlyDeployed);
    }

    function mintNFTOnContract(address contractAddress) public {
        vm.startBroadcast();
        NFTTest(contractAddress).mint(bearURI);
        vm.stopBroadcast();
    }
}