pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import"../contracts/Adoption.sol";

contract TestAdoption {
    Adoption adoption = Adoption(DeployedAddresses.Adoption());


    uint expectedPetId = 8;
    address expectedAdopter = address(this);

    function testUserCanAdoptPet() public {
        uint returnedId = adoption.adopt(expectedPetId);
        Assert.equal(returnedId, expectedPetId, "Adoption of the expexted pet ");
        
    }
    function testGetAdopterAddressByPetId() public {
        address adopter = adoption.adopters(expectedPetId);
        Assert.equal(adopter , expectedAdopter, " Error message");
    }

    function testGetAdopterAddressByPetIdInArray() public {
        address[16] memory adopter = adoption.getAdopters();
        Assert.equal(adopter[expectedPetId], expectedAdopter," Error message");

    }


}