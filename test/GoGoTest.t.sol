//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


import { Test } from "lib/forge-std/src/Test.sol";
import { GoGoNft } from "../src/GoGoNft.sol";
import { Script } from "lib/forge-std/src/Script.sol";
import { DeployNft } from "../script/DeployNFT.s.sol";


contract GoGoTest is Test {
    DeployNft public deployer;
    GoGoNft public gogoNft;
    address public USER = makeAddr("user");
    string public constant GOGO = "ipfs://bafybeifbwfbxsyxeuabtg4bz5kj6z34b2knsz73tv6cpvqkoexi5dfbxmy/?filename=0-metadata.json";

    function setUp () public {
        deployer = new DeployNft();
        gogoNft = deployer.run();
    }
    
    function testNameIsCorrect () public view {
        string memory expectedName = "Get Offline Go Outside";
        string memory actualName = gogoNft.name();

        assert (keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
    }

    function testCanMintAndHaveABalance () public {
        vm.prank (USER);
        gogoNft.mintNft(GOGO);

        assert(gogoNft.balanceOf(USER) == 1);
        assert(keccak256(abi.encodePacked(GOGO)) == keccak256(abi.encodePacked(gogoNft.tokenURI(0))));
    }

}

