import 'package:flutter/material.dart';
import 'onePlayer.dart';

TextEditingController _nameController = TextEditingController();

class CollectName extends StatefulWidget {
  @override
  _CollectNameState createState() => _CollectNameState();
}

class _CollectNameState extends State<CollectName> {
  var maxCharacter = 'Digite seu nome...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(40),
          child: ListView(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Digite seu nome abaixo:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: maxCharacter.toString(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 20),
              ButtonTheme(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OnePlayer(),
                        ),
                      );
                      maxCharacter = 'Digite seu nome...';
                    });
                  },
                  child: Text('Enviar', textAlign: TextAlign.center),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 320,
                width: 320,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/ringue.png',
                      ),
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/ppt.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Nome {
  String namePlayer = ('${_nameController.text}');
}
