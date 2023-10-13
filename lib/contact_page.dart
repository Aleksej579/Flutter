import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  bool showName = false;
  bool showStandartDialog = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: Switch(
                  value: showName,
                  onChanged: (bool isShowName) {
                    setState(() {
                      showName = isShowName;
                    });
                  }),
            ),
            showName
                ? Image.network(
                    "https://media.istockphoto.com/id/1411542401/photo/banana-leaf.webp?b=1&s=170667a&w=0&k=20&c=IKErFvdLeYTcoeEk9BB5tYJ6K72RP2q9eJ4YMcRohSw=")
                : Image.network(
                    "https://us.123rf.com/450wm/lamyai/lamyai1707/lamyai170700590/82885147-feuille-de-bananier-isol%C3%A9-sur-fond-blanc-le-fichier-contient-un-trac%C3%A9-de-d%C3%A9tourage.jpg?ver=6"),
            const Text(
              "SYPIX",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
                letterSpacing: 10.0,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: showName ? Colors.yellow : Colors.green,
                border: Border.all(
                  width: 3,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const SizedBox(
              height: 60.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Checkbox(
                    value: showStandartDialog,
                    onChanged: (bool? newBool) {
                      setState(() {
                        showStandartDialog = newBool!;
                      });
                    }),
                const Text("Show standart Dialog"),
                showStandartDialog
                    ? OutlinedButton(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('AlertDialog Title'),
                            content: const Text('AlertDialog description'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                        child: const Text('Open Dialog'),
                      )
                    : ElevatedButton(
                        child: const Text('Basic Alert'),
                        onPressed: () => _onBasicAlertPressed(context),
                      ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Pressed Follow on Instagram button"),
                    duration: Duration(seconds: 3),
                  ),
                );
              },
              child: const Text("Open alert"),
            ),
          ],
        ),
      ),
    );
  }
}

_onBasicAlertPressed(context) {
  Alert(
    context: context,
    title: "RFLUTTER ALERT",
    desc: "Flutter is more awesome with RFlutter Alert.",
  ).show();
}
