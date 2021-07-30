// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface DataV1Interface{
    function writePublicIIIMap(uint256 k1,uint256 k2) external view returns(uint256);
    function writePublicIIBMap(uint256 k1,uint256 k2)  external view returns(bool);
    function writePublicIIIIMap(uint256 k1,uint256 k2, uint256 k3) external view returns(uint256);
    function writePublicIIIBMap(uint256 k1,uint256 k2, uint256 k3) external view returns(bool);
    function writePrivateAIIMap(address k1,uint256 k2) external view returns(uint256);
    function writePrivateAIBMap(address k1,uint256 k2) external view returns(bool);
    function writePrivateAIIIMap(address k1,uint256 k2, uint256 k3) external view returns(uint256);
    function writePrivateAIIBMap(address k1,uint256 k2, uint256 k3) external view returns(bool);
}

contract DataV1{
    address Router;
    mapping(uint256 => mapping(uint256 => uint256)) PublicIIIMap;
    mapping(uint256 => mapping(uint256 => bool)) PublicIIBMap;
    mapping(uint256 =>  mapping(uint256 => mapping(uint256 => uint256))) PublicIIIIMap;
    mapping(uint256 =>  mapping(uint256 => mapping(uint256 => bool))) PublicIIIBMap;
    mapping(address => mapping(uint256 => uint256)) PrivateAIIMap;
    mapping(address => mapping(uint256 => bool)) PrivateAIBMap;   
    mapping(address => mapping(uint256 => mapping(uint256 => uint256))) PrivateAIIIMap;
    mapping(address => mapping(uint256 => mapping(uint256 => bool))) PrivateAIIBMap;
    constructor(address router){
        Router = router;
    }
    modifier onlyRoter() {
        require(Router == msg.sender, "Router == msg.sender");
        _;
    }
    function writePublicIIIMap(uint256 k1,uint256 k2, uint256 v) onlyRoter() public {
        PublicIIIMap[k1][k2] = v;
    }
    function writePublicIIBMap(uint256 k1,uint256 k2, bool v) onlyRoter() public {
        PublicIIBMap[k1][k2] = v;
    }
    function writePublicIIIIMap(uint256 k1,uint256 k2, uint256 k3, uint256 v) onlyRoter() public {
        PublicIIIIMap[k1][k2][k3] = v;
    }
    function writePublicIIIBMap(uint256 k1,uint256 k2, uint256 k3, bool v) onlyRoter() public {
        PublicIIIBMap[k1][k2][k3] = v;
    }
    function writePrivateAIIMap(address k1,uint256 k2, uint256 v) onlyRoter() public {
        PrivateAIIMap[k1][k2] = v;
    }
    function writePrivateAIBMap(address k1,uint256 k2, bool v) onlyRoter() public {
        PrivateAIBMap[k1][k2] = v;
    }
    function writePrivateAIIIMap(address k1,uint256 k2, uint256 k3, uint256 v) onlyRoter() public {
        PrivateAIIIMap[k1][k2][k3] = v;
    }
    function writePrivateAIIBMap(address k1,uint256 k2, uint256 k3, bool v) onlyRoter() public {
        PrivateAIIBMap[k1][k2][k3] = v;
    }
}