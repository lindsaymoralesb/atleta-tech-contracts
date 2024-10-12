// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

// Uncomment this line to use console.log
//import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract AtletaTech is
	ERC721,
	ERC721Enumerable,
	ERC721URIStorage,
	Ownable
    {

    using Counters for Counters.Counter;

	Counters.Counter public tokenIdCounter;
	
  	 string private constant GUTTY_01_URI = "https://gateway.pinata.cloud/ipfs/QmVGGGiFwAjeF2FZdVEzMoTgWgeW6CPZNQaoc5EFXWGkhK";
	 string private constant GUTTY_02_URI = "https://gateway.pinata.cloud/ipfs/QmQUCe2td5f2PosDeGoawbn3k8WXj18Yj5DAvvk6qyMBw3";


	 constructor(address initialOwner) 
    ERC721("AtletaTech", "ETH")
	Ownable(0x1B04132D7F2427cB160AB57d0829C48D93e3fc91) 
{}

	function mintItem(address to, string memory uri) public returns (uint256) {
		tokenIdCounter.increment();
		uint256 tokenId = tokenIdCounter.current();
		_safeMint(to, tokenId);
		_setTokenURI(tokenId, uri);
		return tokenId;
	}

	    // Specific minting functions
    function mintGutty01(address to) public onlyOwner returns (uint256) {
        return mintItem(to, GUTTY_01_URI);
    }

    function mintGutty02(address to) public onlyOwner returns (uint256) {
        return mintItem(to, GUTTY_02_URI);
    }

	function tokenURI(
		uint256 tokenId
	) public view override(ERC721, ERC721URIStorage) returns (string memory) {
		return super.tokenURI(tokenId);
	}

	function supportsInterface(
		bytes4 interfaceId
	)
		public
		view
		override(ERC721, ERC721Enumerable, ERC721URIStorage)
		returns (bool)
	{
		return super.supportsInterface(interfaceId);
	}

	    function _increaseBalance(address account, uint128 value)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._increaseBalance(account, value);
    }

	    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, ERC721Enumerable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }

}
