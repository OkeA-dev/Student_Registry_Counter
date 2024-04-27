# Student Registry Smart Contract

This is a Solidity smart contract for managing a student registry in a decentralized manner on the Ethereum blockchain. The contract allows a school owner to register, edit, view, and delete student records.

## Features

- **Student Registration**: The school owner can register new students by providing their name, registration number, date of birth, and class.
- **Student Information Editing**: The school owner can edit the information of registered students.
- **Student Information Viewing**: Anyone can view the information of registered students.
- **Student Record Deletion**: The school owner can delete the record of a registered student.
- **Access Control**: Only the school owner (the contract deployer) can add, edit, or delete student records, ensuring data integrity and security.

## Contract Structure

The contract consists of the following components:

- `Student` struct: Defines the structure of a student record, including name, registration number, date of birth, and class.
- `students` mapping: Stores student records, where the key is the registration number, and the value is a `Student` struct.
- `registeredStudents` array: Keeps track of the registration numbers of all registered students.
- `owner` address: Stores the Ethereum address of the school owner (contract deployer).
- `onlyOwner` modifier: Restricts access to certain functions to only the school owner.

## Contract Functions

- `constructor()`: Sets the school owner's address during contract deployment.
- `registerStudent(string, uint256, uint256, uint256)`: Registers a new student by providing their name, registration number, date of birth, and class (accessible only to the school owner).
- `editStudent(uint256, string, uint256, uint256)`: Edits the information of a registered student (accessible only to the school owner).
- `viewStudent(uint256)`: Retrieves the information of a registered student by providing their registration number (accessible to anyone).
- `deleteStudent(uint256)`: Deletes the record of a registered student by providing their registration number (accessible only to the school owner).

## Usage

1. Deploy the `StudentRegistry` contract to the Ethereum blockchain.
2. The contract deployer's address will be set as the school owner.
3. Use the `registerStudent` function to add new student records.
4. Use the `editStudent` function to update the information of registered students.
5. Use the `viewStudent` function to retrieve the information of registered students.
6. Use the `deleteStudent` function to remove the record of a registered student.

Note: Only the school owner (contract deployer) can add, edit, or delete student records. Anyone can view the information of registered students.

## Requirements

- Solidity compiler version: `^0.8.24`

## License

This project is licensed under the [MIT License](LICENSE).`