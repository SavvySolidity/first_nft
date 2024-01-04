//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;


import { Script } from "lib/forge-std/src/Script.sol";
import { GoGoNft } from "../src/GoGoNft.sol";

contract DeployNft is Script {
    function run () external returns (GoGoNft) {
        vm.startBroadcast();
        GoGoNft gogoNft = new GoGoNft();
        vm.stopBroadcast();
        return gogoNft;
    }
}