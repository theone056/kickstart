pragma solidity >=0.6.6;


contract CampaignFactory{
    address[] public deployedCampaigns;

    function createCampaign(uint minimum) public {
        address newCampain =address(new Campaign(minimum,msg.sender));

        deployedCampaigns.push(newCampain);
    }


    function getDeployedCampaigns() public view returns (address[] memory){
        return deployedCampaigns;
    }


}


contract Campaign{

    struct Request{
        string description;
        uint value;
        address payable recipient;
        bool complete;
        uint approvalCount;
        mapping(address=>bool) approvals;
    }

    address public manager;
    uint public minimumContribution;
    mapping(address => bool) public approvers;
    Request[] public requests;
    uint public approversCount;

    modifier restricted {
        require(msg.sender == manager);
        _;
    }

    constructor(uint minimum, address creator) public{
        manager = creator;
        minimumContribution = minimum;
    }

    function contribute() public payable {
        require(msg.value > minimumContribution);

        approvers[msg.sender] = true;
        approversCount++;
    }

    function createRequest(string memory description, uint value, address payable recipient) public restricted{
        Request memory request = Request({
            description: description,
            value:value,
            recipient: recipient,
            complete:false,
            approvalCount: 0
        });

        requests.push(request);
    }

    function approveRequest(uint index) public {
        Request storage req = requests[index];

        require(approvers[msg.sender]);
        require(!req.approvals[msg.sender]);

        req.approvals[msg.sender] = true;
        req.approvalCount++;
    }

    function finalzeProject(uint index) public restricted{
        Request storage req = requests[index];

        require(req.approvalCount > (approversCount / 2));
        require(!req.complete);

        req.recipient.transfer(req.value);
        req.complete = true;
    }

}