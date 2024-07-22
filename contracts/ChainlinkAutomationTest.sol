// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ChainlinkAutomationTest {
    /*
     *  Events
     */
    event AddNum(uint256 indexed num);
    event SetNum(uint256 indexed num);
    /*
     *  Constants
     */

    /*
     *  Storage
     */
    address immutable i_owner;
    uint256 currentNum;
    /*
     *  Modifiers
     */

    modifier onlyOwner() {
        require(msg.sender == i_owner);
        _;
    }

    /// @dev Fallback function allows to deposit ether.
    receive() external payable {}

    fallback() external {}

    /*
     * Public functions
     */
    /// @dev Contract constructor .
    constructor(){
        i_owner = msg.sender;
    }

    function addNum(
        uint256 num
    ) public {
        currentNum+=num;
        emit AddNum(currentNum);
    }

    function setNum(uint256 num) external onlyOwner{
        currentNum = num;
        emit SetNum(currentNum);
    }

    /// @dev Returns owner.
    /// @return i_owner address.
    function getOwner() public view returns (address) {
        return i_owner;
    }

    /// @dev Returns Current Number.
    /// @return currentNum Returns currentNum.
    function getCurrentNumber() public view returns (uint256) {
        return currentNum;
    }
}
