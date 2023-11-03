// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract StudCoin is Ownable {
    // mapping token address -> staker address -> amount 
    mapping(string => mapping(address => uint256)) public TokenStudentBalance;
    // mapping(address => uint256) public uniqueTokensStaked;
    // mapping(address => address) public tokenPriceFeedMapping;
    address[] public users;
    address[] public allowedTokens;
    IERC20 public thaparToken;
    IERC20 public dtuToken;
// stakeTokens - DONE!
// unStakeTokens - DONE
// issueTokens - DONE!
// addAllowedTokens - DONE!
// getValue - DONE!

// 100 ETH 1:1 for every 1 ETH, we give 1 DappToken
// 50 ETH and 50 DAI staked, and we want to give a reward of 1 DAPP / 1 DAI

    constructor(address _thaparTokenAddress, address _dtuTokenAdress){
        thaparToken = IERC20(_thaparTokenAddress);
        dtuToken = IERC20(_dtuTokenAdress);
    }


    
    

    // function getUserTotalValue(address _user) public view returns (uint256){
    //     uint256 totalValue = 0;
    //     require(uniqueTokensStaked[_user] > 0, "No tokens staked!");
    //     for (
    //         uint256 allowedTokensIndex = 0;
    //         allowedTokensIndex < allowedTokens.length;
    //         allowedTokensIndex++
    //     ){
    //         totalValue = totalValue + getUserSingleTokenValue(_user, allowedTokens[allowedTokensIndex]);
    //     }
    //     return totalValue;
    // }

    // function getUserSingleTokenValue(address _user, address _token) 
    // public
    // view 
    // returns (uint256) {
    //     if (uniqueTokensStaked[_user] <= 0){
    //         return 0;
    //     }
    //     // price of the token * stakingBalance[_token][user]
    //     (uint256 price, uint256 decimals) = getTokenValue(_token);
    //     return 
    //         // 10000000000000000000 ETH
    //         // ETH/USD -> 10000000000
    //         // 10 * 100 = 1,000
    //         (stakingBalance[_token][_user] * price / (10**decimals));
    // }

    // function getTokenValue(address _token) public view returns (uint256, uint256) {
    //     // priceFeedAddress
    //     address priceFeedAddress = tokenPriceFeedMapping[_token];
    //     AggregatorV3Interface priceFeed = AggregatorV3Interface(priceFeedAddress);
    //     (,int256 price,,,)= priceFeed.latestRoundData();
    //     uint256 decimals = uint256(priceFeed.decimals());
    //     return (uint256(price), decimals);
    // }

    // function stakeTokens(uint256 _amount, address _token) public {
    //     require(_amount > 0, "Amount must be more than 0");
    //     require(tokenIsAllowed(_token), "Token is currently no allowed");
    //     IERC20(_token).transferFrom(msg.sender, address(this), _amount);
    //     updateUniqueTokensStaked(msg.sender, _token);
    //     stakingBalance[_token][msg.sender] = stakingBalance[_token][msg.sender] + _amount;
    //     if (uniqueTokensStaked[msg.sender] == 1){
    //         stakers.push(msg.sender);
    //     }
    // }
    
   

    

    // function tokenIsAllowed(address _token) public view returns (bool) {
    //     for( uint256 allowedTokensIndex=0; allowedTokensIndex < allowedTokens.length; allowedTokensIndex++){
    //         if(allowedTokens[allowedTokensIndex] == _token){
    //             return true;
    //         }
    //     }
    //     return false; 
    // }

    function intialIssue (address recipient) public onlyOwner{
        thaparToken.transfer(recipient, 10);
        users.push(recipient);
        TokenStudentBalance["thaparToken"][recipient]=TokenStudentBalance["thaparToken"][recipient]+10;
        


        
    }
    function CGPADistributeThapar (address recipient, uint256 _amt) public onlyOwner {
          thaparToken.transfer(recipient, _amt);
          TokenStudentBalance["thaparToken"][recipient]=TokenStudentBalance["thaparToken"][recipient]+_amt;

    }

    function interCollegeTransfer(address recipent1, address recipent2, uint256 amt1, uint256 amt2, uint256) public onlyOwner {
        thaparToken.transferFrom(recipent1, recipent2, amt1);
        dtuToken.transferFrom(recipent2,recipent1, amt2);
        TokenStudentBalance["thaparToken"][recipent2]=TokenStudentBalance["thaparToken"][recipent2]+ amt1;
        TokenStudentBalance["thaparToken"][recipent1]=TokenStudentBalance["thaparToken"][recipent1]- amt1;
        TokenStudentBalance["dtuToken"][recipent1]=TokenStudentBalance["thaparToken"][recipent1]+ amt2;
        TokenStudentBalance["dtuToken"][recipent2]=TokenStudentBalance["thaparToken"][recipent2]- amt2;

    }

    function buyPassThapar(uint256 amt1) public onlyOwner{
        thaparToken.transferFrom(msg.sender, address(this), amt1);
        TokenStudentBalance["thaparToken"][msg.sender]=TokenStudentBalance["thaparToken"][msg.sender]- amt1;



    }

    
}