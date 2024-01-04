//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import { Script } from "lib/forge-std/src/Script.sol";
import { GoGoNft } from "../src/GoGoNft.sol";
import { DevOpsTools } from "lib/foundry-devops/src/DevOpsTools.sol";

contract MintGoGo is Script {
    string public constant GOGO = "ipfs://bafybeifbwfbxsyxeuabtg4bz5kj6z34b2knsz73tv6cpvqkoexi5dfbxmy/?filename=0-metadata.json";
    function run () external {
        address mostRecetlyDeployed = DevOpsTools.get_most_recent_deployment("GoGoNft", block.chainid);
        mintNftOnContract (mostRecetlyDeployed);
    } 

    function mintNftOnContract (address contractAddress) public{
        vm.startBroadcast();
        GoGoNft(contractAddress).mintNft(GOGO);
        vm.stopBroadcast();
    }
    
        
} 