import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ScrollController scrollController = ScrollController();
var user = Hive.box('UserInfo');

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16))),
          leading: GFG(),
          expandedHeight: MediaQuery.of(context).size.height / 2.5,
          flexibleSpace: InkWell(
              child: FlexibleSpaceBar(
            background: Container(
              constraints: BoxConstraints.expand(
                height: Theme.of(context).textTheme.headlineMedium!.fontSize! *
                        1.1 +
                    200.0,
              ),
              padding: const EdgeInsets.all(12.0),
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
              child:  Pass(),

                      ),
            title: Text("Райан Гослинг", style: TextStyle(color: Colors.white, fontSize: 40,),),
                centerTitle: false,
                expandedTitleScale: 1,
                      ),),
         
    

          ),
        Profilepage_card(),
        Profilepage_card(),
        Profilepage_card(),
        Profilepage_card(),
        Profilepage_card(),
      ],
    );
  }
}

SliverToBoxAdapter Profilepage_card() {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(65, 46, 254, 1),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        height: 300,
      ),
    ),
  );
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

class Pass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double boxsize = min(MediaQuery.of(context).size.height / 3,
        MediaQuery.of(context).size.width / 1.5);

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage(
              'web\icons\cats_pictures.jpg'), //image url
        ),
      ),
      width: boxsize,
      height: boxsize,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(200))),
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

showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () { },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("My title"),
    content: Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
