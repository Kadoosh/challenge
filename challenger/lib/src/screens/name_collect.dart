import 'package:flutter/material.dart';
import 'one_player.dart';

class CollectName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();

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
                  hintText: 'Digite seu nome...',
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => OnePlayer(player1Name: _nameController.text),
                      ),
                    );
                  },
                  child: Text('Enviar', textAlign: TextAlign.center),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                height: 320,
                width: 320,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/ring.png',
                    ),
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black),
                ),
                child: Container(
                  alignment: Alignment(0, 0),
                  child: Image.asset(
                    'assets/ppt.png',
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
