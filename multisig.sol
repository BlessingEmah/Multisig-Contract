 //SPDX- License-identifier:MIT

 /*
DESIGN ARCHITECTURE OF A MULTISIG

initiate transfer
approve transfer
Send the amount if they are enough approvers

*/
 pragma solidity ^0.8.0;

 contract Multisig {
     uint48 public Id;
     uint48 public approverRequired;

     struct TransferInfo {
         uint40 amount;
         address payable recipient;
         uint8 approvals;
         bool sent;
     }

    mapping (uint256 => TransferInfo) public TransferId;
    mapping (address => bool) public Approvers;

constructor (uint48 _approverRequired){
approverRequired = _approverRequired;
}


modifier validApprover() {
require(Approvers[msg.sender] == true, "not an approved address");
_;
}

receive() payable payable{}

//solidity shell number
function initiateTransfer( uint256 amount, address payable to) external validApprover() {
    TransferInfo storage t = TransferId[Id];
    t.amount =amount;
    t.recipient = to;
    t.approvals = 0;
    t.sent = false
    Id++;
}


function sendTransfer(uint256 amount, address payable _to) external onlyApproval(){
        require(TransferId[id].sent = true, "transfer has been sent");
        require(address(this).balance <= amount, "insufficient balance");
        TransferInfo storage t = TransferId[Id];
        if (t.approvals = approverRequired) {
            t.recipient = _to;
            t.amount = amount;
            t.sent = true;
        }
       
    }

function checkBal() external view returns(uint256) {
return (address(this).balance);
}



 }