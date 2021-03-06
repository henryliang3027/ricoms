import 'package:flutter/material.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';

class RealTimeAlarmPage extends StatefulWidget {
  const RealTimeAlarmPage({Key? key}) : super(key: key);

  @override
  State<RealTimeAlarmPage> createState() => _RealTimeAlarmPageState();
}

class _RealTimeAlarmPageState extends State<RealTimeAlarmPage> {
  final String _title = 'Real-Time Alarm';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: const Center(
        child: Text('My page'),
      ),
      drawer: SafeArea(
        child: DeviceManager(),
      ),
    );
  }
}

class DeviceManager extends StatelessWidget {
  DeviceManager({Key? key}) : super(key: key);

  final scrollController = ScrollController();
  final horizationalScrollController = ScrollController();
  final networkTreeController = TreeController(allNodesExpanded: false);

  Row addGroup({required String name}) {
    return Row(
      children: <Widget>[
        Container(
          width: 10.0,
          height: 10.0,
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        const Icon(
          Icons.groups_outlined,
          color: Colors.blue,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(name),
      ],
    );
  }

  Row addDevice({required String name}) {
    return Row(
      children: <Widget>[
        Container(
          width: 10.0,
          height: 10.0,
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        const Icon(
          Icons.online_prediction_outlined,
          color: Colors.blue,
        ),
        const SizedBox(
          width: 1.0,
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 14),
          ),
          onPressed: () {},
          child: Text(
            name,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        controller: scrollController,
        child: SingleChildScrollView(
          controller: horizationalScrollController,
          scrollDirection: Axis.horizontal,
          child: TreeView(
            treeController: networkTreeController,
            nodes: [
              TreeNode(
                content: addGroup(name: '1'),
                children: [
                  TreeNode(
                    content: addGroup(name: '2'),
                    children: [
                      TreeNode(
                        content: addGroup(name: '3'),
                        children: [
                          TreeNode(
                            content: addGroup(name: '4'),
                            children: [
                              TreeNode(
                                content: addGroup(name: '5'),
                                children: [
                                  TreeNode(
                                    content: addGroup(name: '6'),
                                    children: [
                                      TreeNode(
                                        content: addGroup(name: '7'),
                                        children: [
                                          TreeNode(
                                            content: addGroup(name: '8'),
                                            children: [
                                              TreeNode(
                                                content: addGroup(name: '9'),
                                                children: [
                                                  TreeNode(
                                                    content:
                                                        addGroup(name: '10'),
                                                    children: [
                                                      TreeNode(
                                                        content: addDevice(
                                                          name: 'A8K@27.202',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              TreeNode(
                content: addGroup(name: 'HomePlus'),
                children: [
                  TreeNode(
                    content: addDevice(name: 'A8K@29.202'),
                  ),
                ],
              ),
              TreeNode(
                content: addGroup(name: 'Indonesia-Group'),
                children: [
                  TreeNode(
                    content: addDevice(name: 'A8K@29.202'),
                  ),
                  TreeNode(
                    content: addDevice(name: 'A8K@29.202'),
                  ),
                  TreeNode(
                    content: addDevice(name: 'A8K@29.202'),
                  ),
                  TreeNode(
                    content: addDevice(name: 'A8K@29.202'),
                  ),
                ],
              ),
              TreeNode(
                content: addGroup(name: 'Romania-EDFA'),
              ),
              TreeNode(
                content: addGroup(name: 'Romania-OPTX'),
              ),
              TreeNode(
                content: addGroup(name: 'Thailand-EDFA'),
              ),
              TreeNode(
                content: addGroup(name: 'Thailand-OPTX'),
              ),
              TreeNode(
                content: addGroup(name: 'Thailand-OSW'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
