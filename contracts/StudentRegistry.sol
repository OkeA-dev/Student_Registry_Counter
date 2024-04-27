// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract StudentRegistry {
    // Struct to store student information
    struct Student {
        string name;
        uint256 regNo;
        uint256 dateOfBirth;
        uint256 class;
    }

    // Mapping to store student's information
    mapping (uint256 => Student) public students;

    // Array to store registered student IDs
    uint256[] public registeredStudents;

    // Address of the school owner
    address public owner;

    // Modifier to restrict access to certain functions 
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }



    // Constructor to set the owner
    constructor() {
        owner = msg.sender;
    }

    // Function to register a new student
    function registerStudent(string memory _name, uint256 _regNo, uint256 _dateOfBirth, uint256 _class) external onlyOwner {
        Student memory newStudent = Student(_name, _regNo, _dateOfBirth, _class);
        students[_regNo] = newStudent;
        registeredStudents.push(_regNo);
        
    }

    // Function to edit student details
    function editStudent(uint256 _regNo,  string memory _name, uint256 _dateOfBirth, uint256 _class) external onlyOwner {
        require(students[_regNo].regNo != 0, "Student not registered");
        students[_regNo].name = _name;
        students[_regNo].dateOfBirth = _dateOfBirth;
        students[_regNo].class = _class;
    }

    // Function to view a student details
    function v_Student(uint256 _regNo) external view returns (string memory, uint, uint, uint) {
        require(students[_regNo].regNo != 0, "Student not registered");
        Student memory viewStudent = students[_regNo];
        return (viewStudent.name, viewStudent.regNo, viewStudent.dateOfBirth, viewStudent.class);
    }

    //Function to delete student record
    function deleteStudent(uint256 _regNo) external onlyOwner {
        require(students[_regNo].regNo != 0, "Student not registered");
        delete students[_regNo];

        // Remove the student ID for the array 
        for (uint256 i = 0; i < registeredStudents.length; i++) {
            if( registeredStudents[i] == _regNo) {
                registeredStudents[i] = registeredStudents[registeredStudents.length - 1];
                registeredStudents.pop();
                break;
            }
        }

    }
}