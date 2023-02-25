import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ScrollController scrollController = ScrollController();

class AbonPage extends StatelessWidget {
  Color _iconColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
            actions: [],
            leading: GFG(),
            shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
            expandedHeight: MediaQuery.of(context).size.height / 2.5,
            flexibleSpace: InkWell(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(23),
                  bottomRight: Radius.circular(23)),
              onTap: () => scrollController.animateTo(0,
                  duration: Duration(milliseconds: 300), curve: Curves.linear),
              child: FlexibleSpaceBar(
                background: Container(
                  constraints: BoxConstraints.expand(
                    height:
                        Theme.of(context).textTheme.headlineMedium!.fontSize! *
                                1.1 +
                            200.0,
                  ),
                  padding: const EdgeInsets.all(12.0),
                  // color: Color.fromRGBO(65, 46, 254, 1),
                  alignment: Alignment.center,

                  transform: Matrix4.rotationZ(0.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color.fromRGBO(65, 46, 254, 1),
                          Color.fromRGBO(112, 98, 255, 1),
                        ],
                      )),
                ),
                title: Text(
                  "Абонементы",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                centerTitle: false,
                expandedTitleScale: 1,
              ),
            )),
        Abonpage_card(),
        Abonpage_card(),
        Abonpage_card(),
        Abonpage_card(),
        Abonpage_card(),
      ],
    );
  }

  SliverToBoxAdapter Abonpage_card() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(112, 98, 255, 1),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 300,
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "Физкультурно-оздоровительный комплекс S2",
    "Физкультурно-оздоровительный комплекс S1",
    "Физкультурно-оздоровительный комплекс S",
    "Гостиничный корпус 1",
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        color: Color.fromRGBO(65, 46, 254, 1),
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(
        Icons.arrow_back,
        color: Color.fromRGBO(65, 46, 254, 1),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}

class GFG extends StatefulWidget {
  const GFG({Key? key}) : super(key: key);

  @override
  State<GFG> createState() => _GFGState();
}

class _GFGState extends State<GFG> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.white,
      onPressed: () {
        const BorderRadius.only(
            bottomLeft: Radius.circular(23), bottomRight: Radius.circular(23));
        onTap:
        () => scrollController.animateTo(0,
            duration: Duration(milliseconds: 300), curve: Curves.linear);
        showSearch(context: context, delegate: CustomSearchDelegate());
      },
      icon: const Icon(
        Icons.search,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
