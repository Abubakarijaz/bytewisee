import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task08/boxes.dart';
import 'package:task08/person.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  boxPersons = await Hive.openBox<Person>('personBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Center(child: Text('HIVE Storage',style: TextStyle(fontWeight: FontWeight.bold),)),
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all( 10.0),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Name",
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all( 10.0),
                  child: TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide()
                      ),
                      hintText: "Age",
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      boxPersons.put(
                        'key_${nameController.text}',
                        Person(
                          name: nameController.text,
                          age: int.parse(ageController.text),
                        ),
                      );
                    });
                  },
                  child: Text('Add'),
                )
              ],
            ),
          ),
          Expanded(
            child: Card(
              child: ListView.builder(
                  itemCount: boxPersons.length,
                  itemBuilder: (context,index){
                    Person person=boxPersons.getAt(index);
                    return ListTile(
                      leading: IconButton(

                        onPressed: (){
                          setState(() {
                            boxPersons.deleteAt(index);
                          });

                        },
                        icon: Icon(Icons.remove,color: Colors.red),
                      ),
                      title:Text(person.name) ,
                      subtitle: Text('Name'),
                      trailing: Text('age ${person.age.toString()}'),
                    );
                  }
              ),

            ),
          )
        ],
      ),
    );
  }
}
