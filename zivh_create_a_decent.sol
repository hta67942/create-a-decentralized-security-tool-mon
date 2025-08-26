pragma solidity ^0.8.0;

contract DecentMonitor {
    // Mapping of nodes to their public keys
    mapping (address => bytes) public nodeKeys;

    // Mapping of monitored contracts to their owners
    mapping (address => address) public contractOwners;

    // Event emitted when a new node is registered
    event NodeRegistered(address indexed node, bytes publicKey);

    // Event emitted when a contract is monitored
    event ContractMonitored(address indexed contractAddress, address indexed owner);

    // Event emitted when a security alert is triggered
    event SecurityAlert(address indexed contractAddress, string alertMessage);

    // Function to register a new node
    function registerNode(bytes memory publicKey) public {
        nodeKeys[msg.sender] = publicKey;
        emit NodeRegistered(msg.sender, publicKey);
    }

    // Function to monitor a contract
    function monitorContract(address contractAddress) public {
        contractOwners[contractAddress] = msg.sender;
        emit ContractMonitored(contractAddress, msg.sender);
    }

    // Function to trigger a security alert
    function triggerAlert(address contractAddress, string memory alertMessage) public {
        emit SecurityAlert(contractAddress, alertMessage);
    }

    // Test case: register a node, monitor a contract, and trigger a security alert
    function testDecentMonitor() public {
        // Register a node
        registerNode(hex"1234567890abcdef");

        // Monitor a contract
        monitorContract(address(0x742d35Cc6634C0532925a3b844Bc454e4438f44e));

        // Trigger a security alert
        triggerAlert(address(0x742d35Cc6634C0532925a3b844Bc454e4438f44e), "Potential reentrancy attack detected");
    }
}