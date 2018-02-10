pragma solidity 0.4.19;

import 'zeppelin-solidity/contracts/ownership/rbac/RBAC.sol';
import './StandardAssetRegistry.sol';

contract Curator is StandardAssetRegistry, RBAC {
  
  string constant ROLE_CURATOR = "curator"; 

  modifier onlyCurator() {
    require(
      hasRole(msg.sender, ROLE_CURATOR)
    );
    _;
  }

  function Curator(address[] _curators) public {
    _name = "Curator";
    _symbol = "CRTR";
    _description = "ERC 821-compliant smart contract for digital art";

    removeRole(msg.sender, ROLE_ADMIN);
    addRole(msg.sender, ROLE_CURATOR);

    for (uint256 i = 0; i < _curators.length; i++) {
      addRole(_curators[i], ROLE_CURATOR);
    }
  }

  function isContractProxy(address addr) public view returns (bool) {
    return _isContract(addr);
  }

  function generate(uint256 assetId, address beneficiary, string data) 
    onlyCurator
    public
  {
    _generate(assetId, beneficiary, data);
  }

  function update(uint256 assetId, string data)
    onlyCurator
    public 
  {
    _update(assetId, data);
  }

  function transferTo( 
    address to, uint256 assetId, bytes userData, bytes operatorData
  ) 
    public
  {
    return transfer(to, assetId, userData, operatorData);
  }
}
