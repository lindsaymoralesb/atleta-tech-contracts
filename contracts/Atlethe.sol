// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract AthleteProfile {
    struct Profile {
        string name;
        string sport;
        string country;
        string bio;
        string[] nftCollections;
        uint256 createdAt;
        bool exists;
    }

    mapping(address => Profile) public athletes;
    address[] public athleteAddresses;

    event ProfileCreated(
        address indexed athlete,
        string name,
        string sport,
        string[] nftCollections
    );
    event ProfileUpdated(address indexed athlete, string name, string sport);
    event NFTCollectionLinked(
        address indexed athlete,
        string collectionAddress
    );

    function createProfile(
        string memory _name,
        string memory _sport,
        string memory _country,
        string memory _bio,
        string[] memory _nftCollections
    ) public {
        require(!athletes[msg.sender].exists, "Profile already exists");

        athletes[msg.sender] = Profile({
            name: _name,
            sport: _sport,
            country: _country,
            bio: _bio,
            nftCollections: _nftCollections,
            createdAt: block.timestamp,
            exists: true
        });

        athleteAddresses.push(msg.sender);
        emit ProfileCreated(msg.sender, _name, _sport, _nftCollections);
    }

    function updateProfile(
        string memory _name,
        string memory _sport,
        string memory _country,
        string memory _bio
    ) public {
        require(athletes[msg.sender].exists, "Profile does not exist");

        Profile storage profile = athletes[msg.sender];
        profile.name = _name;
        profile.sport = _sport;
        profile.country = _country;
        profile.bio = _bio;

        emit ProfileUpdated(msg.sender, _name, _sport);
    }

    function linkNFTCollection(string memory _collectionAddress) public {
        require(athletes[msg.sender].exists, "Profile does not exist");

        athletes[msg.sender].nftCollections.push(_collectionAddress);
        emit NFTCollectionLinked(msg.sender, _collectionAddress);
    }

    function getProfile(
        address _athlete
    )
        public
        view
        returns (
            string memory name,
            string memory sport,
            string memory country,
            string memory bio,
            string[] memory nftCollections,
            uint256 createdAt
        )
    {
        require(athletes[_athlete].exists, "Profile does not exist");

        Profile memory profile = athletes[_athlete];
        return (
            profile.name,
            profile.sport,
            profile.country,
            profile.bio,
            profile.nftCollections,
            profile.createdAt
        );
    }

    function getAthleteCount() public view returns (uint256) {
        return athleteAddresses.length;
    }

    function getAthleteAddressByIndex(
        uint256 _index
    ) public view returns (address) {
        require(_index < athleteAddresses.length, "Index out of bounds");
        return athleteAddresses[_index];
    }
}
