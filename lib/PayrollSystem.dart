import 'dart:io';


class PayrollSystem {
  Map<String, String> adminUser = {
    'Admin': 'admin@123',
    'User': 'User@123'
  };
  List<Map<String, dynamic>> ftEmployees = [];
  List<Map<String, dynamic>> ptEmployees = [];

  void loginToPage() {
    print('Employee Payroll Mangement System');
    print('=================================');
    stdout.write('Enter Username:');
    String username = stdin.readLineSync()!;
    stdout.write('Enter Password:');
    String password = stdin.readLineSync()!;

    if (adminUser.containsKey(username) && adminUser[username] == password) {
      print('Login Successfull');
      mainPage();
    } else {
      print('Invalid Username Or password');
      loginToPage();
    }
  }

  void addfulltimeEmployee() {
    print('Enter Employee detail:');
    stdout.write('Fulltime Employee Name:');
    String feName = stdin.readLineSync()!;
    stdout.write('Full time Employee ID:');
    int feId = int.parse(stdin.readLineSync()!);
    stdout.write('Full time Employee Salary:');
    int feSalary = int.parse(stdin.readLineSync()!);

    ftEmployees.add({
      'Name': feName,
      'ID': feId,
      'Salary': feSalary
    });

    print('Full time Employee added Succesfully');
  }

  void addparttimeEmployee() {
    print('Enter Employee detail:');
    stdout.write('Parttime Employee Name:');
    String peName = stdin.readLineSync()!;
    stdout.write('Part time Employee ID:');
    int peId = int.parse(stdin.readLineSync()!);
    stdout.write('Part time Employee Salary:');
    int peSalary = int.parse(stdin.readLineSync()!);

    ptEmployees.add({
      'Name': peName,
      'ID': peId,
      'Salary': peSalary
    });

    print('Part time Employee added Succesfully');
  }

  void listfEmployee() {
    if (ftEmployees.isEmpty) {
      print('No Full time Employee is in the System.');
    } else {
      print('List of Full time Employee');
      for (var ftEmployee in ftEmployees) {
        print('Name: ${ftEmployee['Name']}, ID: ${ftEmployee['ID']}, Salary: ${ftEmployee['Salary']}');
      }
    }
  }

  void listpEmployee() {
    if (ptEmployees.isEmpty) {
      print('No Part time Employee is in the System.');
    } else {
      print('List of Part time Employee');
      for (var ptEmployee in ptEmployees) {
        print('Name: ${ptEmployee['Name']}, ID: ${ptEmployee['ID']}, Salary: ${ptEmployee['Salary']}');
      }
    }
  }

  void removeftEmployee() {
    if (ftEmployees.isEmpty) {
      print('No full time Employee is in the System.');
    } else {
      listfEmployee();
      stdout.write('Enter the ID of Full time Employee to Remove:');
      int iD = int.parse(stdin.readLineSync()!);
      var employeeIndex = ftEmployees.indexWhere((emp) => emp['ID'] == iD);
      if (employeeIndex != -1) {
        ftEmployees.removeAt(employeeIndex);
        print('Full time Employee is Removed successfully.');
      } else {
        print('Invalid ID');
      }
    }
  }

  void removeptEmployee() {
    if (ptEmployees.isEmpty) {
      print('No Part time Employee is in the System.');
    } else {
      listpEmployee();
      stdout.write('Enter the ID of Part time Employee to Remove:');
      int iD = int.parse(stdin.readLineSync()!);
      var employeeIndex = ptEmployees.indexWhere((emp) => emp['ID'] == iD);
      if (employeeIndex != -1) {
        ptEmployees.removeAt(employeeIndex);
        print('Part time Employee is Removed successfully.');
      } else {
        print('Invalid ID');
      }
    }
  }
  void searchEmployee() {
    print('Enter search query:');
    String query = stdin.readLineSync()!.toLowerCase();

    List<Map<String, dynamic>> results = [];

    // Search in full-time employees
    for (var employee in ftEmployees) {
      if (employee['Name'].toLowerCase().contains(query) || employee['ID'].toString().contains(query)) {
        results.add(employee);
      }
    }

    // Search in part-time employees
    for (var employee in ptEmployees) {
      if (employee['Name'].toLowerCase().contains(query) || employee['ID'].toString().contains(query)) {
        results.add(employee);
      }
    }

    if (results.isEmpty) {
      print('No matching employees found.');
    } else {
      print('Matching Employees:');
      for (var employee in results) {
        print('Name: ${employee['Name']}, ID: ${employee['ID']}, Salary: ${employee['Salary']}');
      }
    }
  }
  void modifyEmployeeDetails() {
    print('Enter the ID of the employee to modify:');
    int id = int.parse(stdin.readLineSync()!);

    // Search for the employee in full-time employees
    var employeeIndex = ftEmployees.indexWhere((emp) => emp['ID'] == id);
    if (employeeIndex != -1) {
      print('Enter new details for the employee:');
      stdout.write('New Name:');
      ftEmployees[employeeIndex]['Name'] = stdin.readLineSync()!;
      stdout.write('New ID:');
      ftEmployees[employeeIndex]['ID'] = int.parse(stdin.readLineSync()!);
      stdout.write('New Salary:');
      ftEmployees[employeeIndex]['Salary'] = int.parse(stdin.readLineSync()!);
      print('Employee details updated successfully.');
      return;
    }

    // Search for the employee in part-time employees
    employeeIndex = ptEmployees.indexWhere((emp) => emp['ID'] == id);
    if (employeeIndex != -1) {
      print('Enter new details for the employee:');
      stdout.write('New Name:');
      ptEmployees[employeeIndex]['Name'] = stdin.readLineSync()!;
      stdout.write('New ID:');
      ptEmployees[employeeIndex]['ID'] = int.parse(stdin.readLineSync()!);
      stdout.write('New Salary:');
      ptEmployees[employeeIndex]['Salary'] = int.parse(stdin.readLineSync()!);
      print('Employee details updated successfully.');
      return;
    }

    print('Employee with ID $id not found.');
  }

  void mainPage() {
    print('main Page');
    print('1. Add Full time Employee');
    print('2. Add part time Employee');
    print('3. List of Full time Employee');
    print('4. List of Part time Employee');
    print('5. Search Employee');
    print('6. Modify Employee Details');
    print('7. Remove Full time Employee');
    print('8. Remove part time Employee');
    print('9. Logout');

    stdout.write('Enter your Choice:');
    String choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        addfulltimeEmployee();
        break;
      case '2':
        addparttimeEmployee();
        break;
      case '3':
        listfEmployee();
        break;
      case '4':
        listpEmployee();
        break;
      case '5':
        searchEmployee();
        break;
      case '6':
        modifyEmployeeDetails();
      case '7':
        removeftEmployee();
        break;
      case '8':
        removeptEmployee();
        break;
      case '9':
        print('Logout');
        loginToPage();
        break;
      default:
        print('Invalid choice ');
        mainPage();
        break;
    }
    mainPage(); // Re-display main page after action
  }

  void start() {
    loginToPage();
  }
}