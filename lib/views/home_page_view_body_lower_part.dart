import 'package:flutter/material.dart';
import 'package:to_do_list_app/constants.dart';

class HomePageViewBodyUpperPart extends StatelessWidget {
  const HomePageViewBodyUpperPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.35,
      decoration:BoxDecoration(
        // image: DecorationImage(image: NetworkImage('')),
        color: kPriamryColor,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
      ),
      child: Column(
        children: [
          SizedBox(height: 35,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:  8.0),
            child: Row(
              children: [Text('To Do List App', style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),),
              Spacer(),
              Text('Hi, user'),
              SizedBox(width: 10,),
              CircleAvatar(
                child: Icon(Icons.person),
              )
            
              ],
            ),
          )
        ],
      ),
    );
  }
}

