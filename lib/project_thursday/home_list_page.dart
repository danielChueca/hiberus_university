import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeListPage extends StatefulWidget {
  const HomeListPage({super.key});

  @override
  State<HomeListPage> createState() => _HomeListPageState();
}

class _HomeListPageState extends State<HomeListPage> {
  List<Pokemon> pokemons = [
    Pokemon(
        name: "Charmander",
        description: "descripcion de charmander",
        picture: "assets/images/charmander.png",
        type: "fire",
        height: "120cm",
        weight: "5kg"),
    Pokemon(
        name: "Charmander",
        description: "descripcion de charmander",
        picture: "assets/images/charmander.png",
        type: "fire"),
    Pokemon(
        name: "Charmander",
        description: "descripcion de charmander",
        picture: "assets/images/charmander.png",
        type: "fire",
        height: "120cm"),
    Pokemon(
        name: "Charmander",
        description: "descripcion de charmander",
        picture: "assets/images/charmander.png",
        type: "fire"),
    Pokemon(
      name: "Charmander",
      description: "descripcion de charmander",
      picture: "assets/images/charmander.png",
      type: "fire",
      weight: "5cm",
    ),
    Pokemon(
        name: "Charmander",
        description:
            "descripcion de charmanderasdasdasdsdadasasddasadsadsasdadsasddasdsqweqweqweqwea",
        picture: "assets/images/charmander.png",
        type: "fire"),
    Pokemon(
        name: "Charmander",
        description: "descripcion de charmander",
        picture: "assets/images/charmander.png",
        type: "fire"),
    Pokemon(
        name: "Charmander",
        description: "descripcion de charmander",
        picture: "assets/images/charmander.png",
        type: "fire"),
  ];
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Lista de pokemons",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: kToolbarHeight * 2),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/back.png"),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  "Mostrar lista de Pokemons",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                leading: CupertinoSwitch(
                    activeColor: const Color(0xffB399C4),
                    value: _switchValue,
                    onChanged: (value) {
                      _switchValue = !_switchValue;
                      setState(() {});
                    }),
              ),
              if (_switchValue)
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: pokemons.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(
                          bottom: 20,
                        ),
                        decoration: BoxDecoration(
                            color: const Color(0xffB399C4).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 5),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 70,
                                child: Image.asset(pokemons[index].picture)),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pokemons[index].name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    pokemons[index].description,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.type_specimen),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        pokemons[index].type,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      if (pokemons[index].height != null)
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      if (pokemons[index].height != null)
                                        const Icon(Icons.height),
                                      if (pokemons[index].height != null)
                                        Text(
                                          pokemons[index].height!,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      if (pokemons[index].weight != null)
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      if (pokemons[index].weight != null)
                                        const Icon(Icons.balance_outlined),
                                      if (pokemons[index].weight != null)
                                        const SizedBox(
                                          width: 5,
                                        ),
                                      if (pokemons[index].weight != null)
                                        Text(
                                          pokemons[index].weight!,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  pokemons.removeAt(index);
                                  setState(() {});
                                },
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ));
  }
}

class Pokemon {
  String name;
  String type;
  String picture;
  String description;
  String? height;
  String? weight;

  Pokemon(
      {required this.name,
      required this.description,
      required this.picture,
      required this.type,
      this.height,
      this.weight});
}
