//SPDX-License-Identifier: MIT

pragma solidity 0.8.16;

contract Monalsu {
    struct Profile {
        string name;
        string occupation;
        uint256 hourlyRate;
        uint256 rating;
        uint256 noOfRatings;
        bool openToWork;
        string mediaURL;
    }
    mapping(address => Profile) public addressToProfile;

    function editProfile(
        string memory _name,
        string memory _occupation,
        uint256 _hourlyRate,
        string memory _mediaURL
    ) public {
        addressToProfile[msg.sender].name = _name;
        addressToProfile[msg.sender].occupation = _occupation;
        addressToProfile[msg.sender].hourlyRate = _hourlyRate;
        addressToProfile[msg.sender].mediaURL = _mediaURL;
    }

    // function openToWork(uint256 _hourlyRate) public {
    //     addressToProfile[msg.sender].openToWork = true;
    //     addressToProfile[msg.sender].hourlyRate = _hourlyRate;
    // }

    function rateProfile(uint256 _rating, address _profileAddress) public {
        addressToProfile[_profileAddress].rating =
            (addressToProfile[_profileAddress].rating *
                addressToProfile[_profileAddress].noOfRatings *
                10 +
                _rating) /
            ((addressToProfile[_profileAddress].noOfRatings + 1) * 10);

        ///////////////////////////
        addressToProfile[_profileAddress].noOfRatings =
            addressToProfile[_profileAddress].noOfRatings +
            1;
    }
}
