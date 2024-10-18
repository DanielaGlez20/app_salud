import 'package:flutter/material.dart';
import 'package:nicamed/medico/config.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({super.key});

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF89C8E2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Material(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/4.jpg'),
                ),
                SizedBox(width: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Carlos Mendez', 
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 2,
                      ),
                      Text ('Consulta General',
                      style: TextStyle(color: Color(0xFF696969),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Config.spaceSmall,
            // Aqui coloco la tarjeta de cronograma
            Cronograma(),

           ],     
          ),
        ),
      ),
     );
   }
}


class Cronograma extends StatelessWidget {
  const Cronograma({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF416f9a),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.calendar_today,
          color: Colors.white,
          size: 15,
          ),
          SizedBox(width: 5),
          Text('Lunes, 21/10/24',
          style: TextStyle(color: Colors.white),
          ),
          SizedBox(width: 20),
          Icon(Icons.access_alarm,
          color: Colors.white,
          size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              '2:00 PM',
              style: TextStyle(color: Colors.white),
            ))
        ],
      ),
    );
  }
}