// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "./openzeppelin-contracts/contracts/proxy/Proxy.sol";
import "./openzeppelin-contracts/contracts/access/Ownable.sol";
contract Router is Proxy, Ownable {
    mapping(address => uint256) routers;
    bool status = false;
    constructor() Ownable(){

    }
   
    function _implementation() internal pure override returns (address) {
        address implementation;
        assembly {
            let addr := mload(0x40)
            calldatacopy(addr,4, 160)
            implementation := mload(addr)
        }
        return implementation;
    }

   
    function _fallback() internal override {
        address _implementation_addr = _implementation();
        require(routers[_implementation_addr] != 0, "routers[_implementation]");  
        require(status, "status != true");
         _delegate(_implementation_addr);
    }

    fallback() external payable override {
        _fallback();
    }

    receive() external payable override {
        _fallback();
    }

    function _beforeFallback() internal view override {}
    
    function Start()  onlyOwner() external{
        status = true;
    }

    function Stop()  onlyOwner() external{
        status = false;
    }

    function RegisterRouter(address router, uint256 id)  onlyOwner() external{
        routers[router] = id;
    }
    
}
