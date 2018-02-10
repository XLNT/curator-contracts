pragma solidity 0.4.19;

import './StandardAssetRegistry.sol';

contract Curator is StandardAssetRegistry {

  function Curator() public {
    _name = "Curator";
    _symbol = "CRTR";
    _description = "ERC 821-compliant smart contract for digital art";
  }

  function isContractProxy(address addr) public view returns (bool) {
    return _isContract(addr);
  }

  function generate(uint256 assetId, address beneficiary, string data) public {
    _generate(assetId, beneficiary, data);
  }

  function update(uint256 assetId, string data) public {
    _update(assetId, data);
  }

  function destroy(uint256 assetId) public {
    _destroy(assetId);
  }

  function transferTo( 
    address to, uint256 assetId, bytes userData, bytes operatorData
  ) 
    public
  {
    return transfer(to, assetId, userData, operatorData);
  }
}
