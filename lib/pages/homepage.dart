import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import '../gen/string.g.dart';
import '../main.dart';

ScrollController scrollController = ScrollController();

var user = Hive.box('UserInfo');

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          actions: [
            IconButton(
              onPressed: () => user.delete('id'),
              icon: Icon(Icons.notifications),
            )
          ],
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
          leading: IconButton(
            icon: Icon(Icons.qr_code),
            onPressed: () => scrollController.animateTo(0,
                duration: Duration(milliseconds: 300), curve: Curves.linear),
          ),
          expandedHeight: MediaQuery.of(context).size.height / 2.5,
          flexibleSpace: InkWell(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(23),
                bottomRight: Radius.circular(23)),
            onTap: () => scrollController.animateTo(0,
                duration: Duration(milliseconds: 300), curve: Curves.linear),
            child: FlexibleSpaceBar(
              background: Center(
                child: Pass(),
              ),
              title: Stack(
                children: <Widget>[
                  // Stroked text as border.
                  Text(
                    t.pass,
                    style: TextStyle(
                      fontSize: 20,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Theme.of(context).colorScheme.background,
                    ),
                  ),
                  // Solid text as fill.
                  Text(t.pass,
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onBackground)),
                ],
              ),
              centerTitle: true,
              expandedTitleScale: 1,
            ),
          ),
          pinned: true,
        ),
        Servises(context),
        Homepage_card(context),
        Homepage_card(context),
        Homepage_card(context),
        Homepage_card(context),
      ],
    );
  }

  SliverToBoxAdapter Homepage_card(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 300,
        ),
      ),
    );
  }

  SliverToBoxAdapter Servises(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkResponse(
          onTap: () => runInAction(() => page.value = 1),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12, bottom: 6, top: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(t.menu.services, style: TextStyle(fontSize: 22)),
                        Icon(Icons.keyboard_arrow_right_outlined),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: imageSliders)),
                ],
              ),
            ),
          ),
        ),
      ),
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
        padding: const EdgeInsets.all(12.0),
        child: PrettyQr(
          typeNumber: 2,
          roundEdges: true,
          elementColor: Theme.of(context).colorScheme.onSecondary,
          data: user.get('id').toString(),
        ),
      ),
      width: boxsize,
      height: boxsize,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: InkWell(
            onTap: () => runInAction(() => page.value = imgList.indexOf(item)),
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.cover, width: 250.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            'No. ${imgList.indexOf(item)} image',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ))
    .toList();
