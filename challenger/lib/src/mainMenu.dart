import 'package:challenger/src/instructions.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent[100],
      body: Column(
        children: [
          Row(children: [
            SizedBox(
              height: 30,
            ),
          ]),
          SizedBox(
            width: 360,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.indigoAccent[400],
                image: DecorationImage(
                  image: AssetImage('assets/ppt.png'),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        SizedBox(width: 45),
                        Expanded(
                          child: ButtonTheme(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {});
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Instructions()));
                              },
                              child: Text(
                                '1 Jogador',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/1user.png'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Row(
                      children: [
                        SizedBox(width: 45),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: null,
                            child: Text(
                              '2 Jogadores',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/2user.png'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Row(
                      children: [
                        SizedBox(width: 45),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: null,
                            child: Text(
                              'Online',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/online.png'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
