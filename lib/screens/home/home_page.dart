import 'package:flutter/material.dart';
import 'package:public_toilets/modles/toilet.dart';
import 'package:public_toilets/repositories/toilet_repository.dart';
import 'package:public_toilets/screens/home/toilet_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _toiletNameController = TextEditingController();
  final _toiletPointController = TextEditingController();
  final _toiletDistanceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Public Toilets'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: TolietRepository.toilets.length,
              itemBuilder: (ctx, i) {
                Toilet toilet = TolietRepository.toilets[i];

                return ToiletListItem(
                  toilet: toilet,
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _toiletNameController,
                  decoration: InputDecoration(
                    hintText: 'ชื่อห้องน้ำ',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _toiletPointController,
                        decoration: InputDecoration(
                          hintText: 'ให้คะแนน',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.greenAccent,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _toiletDistanceController,
                        decoration: InputDecoration(
                          hintText: 'ระยะทาง',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.greenAccent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      var toiletName = _toiletNameController.text;
                      var toiletPoint =
                      double.parse(_toiletPointController.text);
                      var toiletDistance = double.parse(_toiletDistanceController.text);
                      var toilet = Toilet(
                        name: toiletName,
                        point: toiletPoint,
                        distance: toiletDistance,
                      );

                      setState(() {
                        TolietRepository.toilets.add(toilet);
                      });

                      _toiletNameController.clear();
                      _toiletPointController.clear();
                      _toiletDistanceController.clear();
                    },
                    child: Text('ADD'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}