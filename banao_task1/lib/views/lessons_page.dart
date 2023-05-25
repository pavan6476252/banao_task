import 'package:banao_task1/api/lessons.dart';
import 'package:flutter/material.dart';

class LessonsPage extends StatelessWidget {
  const LessonsPage({super.key, required this.data});
  final List<Lesson> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lessons for you"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 300,
            width: double.maxFinite,
            child: Card(
              child: Column(
                children: [
                  Expanded(
                    flex: 8,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image.asset(
                        "assets/images/lessons.png",
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: ListTile(
                        title: Text(data[index].name,style: TextStyle(overflow: TextOverflow.ellipsis,fontWeight: FontWeight.w500,fontSize: 18),),
                        subtitle: Text(data[index].category.toUpperCase(),style: TextStyle(color: Colors.indigoAccent),),
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
