import 'package:flutter/material.dart';
import 'package:ricoms/history/data/data.dart';
import 'package:ricoms/history/model/client.dart';

class TablePage extends StatefulWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  late List<User> users;
  int? sortColumnIndex;
  bool isAscending = false;

  final columns = ['First Name', 'Last Name', 'Age', 'Blood Type'];

  @override
  void initState() {
    super.initState();

    users = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          sortAscending: isAscending,
          sortColumnIndex: sortColumnIndex,
          columns: getColumns(columns),
          rows: getRows(users),
        ),
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map(
        (String column) => DataColumn(
          label: Text(column),
          onSort: onSort,
        ),
      )
      .toList();

  List<DataRow> getRows(List<User> users) => users.map((User user) {
        final cells = [user.firstName, user.lastName, user.age, user.bloodType];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      users.sort((user1, user2) =>
          compareString(ascending, user1.firstName, user2.firstName));
    } else if (columnIndex == 1) {
      users.sort((user1, user2) =>
          compareString(ascending, user1.lastName, user2.lastName));
    } else if (columnIndex == 2) {
      users.sort((user1, user2) =>
          compareString(ascending, '${user1.age}', '${user2.age}'));
    } else if (columnIndex == 3) {
      users.sort((user1, user2) =>
          compareString(ascending, '${user1.bloodType}', '${user2.bloodType}'));
    }

    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
