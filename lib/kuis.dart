import 'package:flutter/material.dart';


void main() {
 runApp(const MyApp());
}


class MyApp extends StatefulWidget {
 const MyApp({Key? key}) : super(key: key);
 @override
 MyAppState createState() {
   return MyAppState();
 }
}

class MyAppState extends State<MyApp> {
  final textEditController = TextEditingController();
  String _nama = "";
  String pilihanSalam = "satu";
  String pilihanSalamOut = "";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textEditController.dispose();
    super.dispose();
  }

 @override
 Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> salam = [];
      var itm1 = const DropdownMenuItem<String>(
        value: "satu",
        child: Text("1 Januari 2023"),
      );
      var itm2 = const DropdownMenuItem<String>(
        value: "dua",
        child: Text("2 Januari 2023"),
      );
      salam.add(itm1);
      salam.add(itm2);

   return MaterialApp(
     title: 'Hello App',
     home: Scaffold(
       appBar: AppBar(
           leading: FlutterLogo(),
           backgroundColor: Colors.blueGrey,
           title: Text('Quiz Flutter'),
           actions: <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
           body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton(
              value: pilihanSalam,
              items: salam,
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue != null) {
                    pilihanSalam = newValue;
                  }
                });
              },
            ),
            Text(
              _nama != "" ? 'selamat $pilihanSalamOut' : "",
              style: const TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
            ), //hasil disini
          ],
        )), //column center
      ), //Scaffold
    ); //Material APP
  }
}



class ButtonNamaKelompok extends StatelessWidget {
 const ButtonNamaKelompok({Key? key}) : super(key: key);


 @override
 Widget build(BuildContext context) {
   return IconButton(
     icon: Icon(Icons.account_circle_rounded),
     onPressed: () {
       // icon account di tap
       showDialog<String>(
         context: context,
         builder: (BuildContext context) => AlertDialog(
           title: const Text('Kelompok 17'),
           content: const Text('Salsabila Kanaya (salsabilak28@upi.edu) ; Sukma Julianti(sukmajulianti@upi.edu)'),
           actions: <Widget>[
             TextButton(
               onPressed: () => Navigator.pop(context, 'OK'),
               child: const Text('OK'),
             ),
             
           ],
         ),
       );
     },
   );
 }
}


class ButtonPerjanjian extends StatelessWidget {
 const ButtonPerjanjian({Key? key}) : super(key: key);


 @override
 Widget build(BuildContext context) {
   return IconButton(
     icon: Icon(Icons.access_alarm_rounded),
     onPressed: () {
       // icon setting ditap
       const snackBar = SnackBar(
         duration: Duration(seconds: 20),
         content: Text('Kami berjanji  tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
       );
       ScaffoldMessenger.of(context).showSnackBar(snackBar);
     },
   );
 }
}

