import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  String title = "hola";
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: const Text("button"),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        backgroundColor: Colors.green,
        title: const Text("asdfg"),
      ),
      body: Column(
        children: [
          Text(title),
          const Row(
            children: [
              Flexible(
                child: Text(
                  "asdasdadssdasadsadsadasdasdasdsadasdsadsadsdasdadsasdasdasdasdasaddasdda",
                  overflow: TextOverflow.ellipsis,
                  // maxLines: 1,
                ),
              )
            ],
          ),
          TextFormField(
            obscureText: _obscureText,
            decoration: InputDecoration(
              label: const Text("password"),
              suffixIcon: IconButton(
                onPressed: () {
                  title = "adiosl";
                  _obscureText = !_obscureText;
                  setState(() {});
                },
                icon: const Icon(Icons.remove_red_eye),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("button"),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 40),
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        width: 100,
                        height: 100,
                      )))
        ],
      ),
    );
  }
}
