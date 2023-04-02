import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            titleTextStyle: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.bold
            ),
            leading: Icon(Icons.menu),
            title: Text('SLIVER APP BAR'),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Lottie.network('https://assets7.lottiefiles.com/packages/lf20_li9krdlx.json'),

            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: ClipRRect (borderRadius: BorderRadius.circular(24.0),
                child: Container(
                  height: 100.0,
                  color: Colors.deepPurple[200],
                ),
              ),
            )
          ),
          SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: ClipRRect (borderRadius: BorderRadius.circular(24.0),
                  child: Container(
                    height: 100.0,
                    color: Colors.deepPurple[200],
                  ),
                ),
              )
          ),
          SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: ClipRRect (borderRadius: BorderRadius.circular(24.0),
                  child: Container(
                    height: 100.0,
                    color: Colors.deepPurple[200],
                  ),
                ),
              )
          ),
          SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: ClipRRect (borderRadius: BorderRadius.circular(24.0),
                  child: Container(
                    height: 100.0,
                    color: Colors.deepPurple[200],
                  ),
                ),
              )
          )
        ],

      ),

    );
  }
}
//children: [

//Lottie.network(
//'https://assets7.lottiefiles.com/packages/lf20_li9krdlx.json'),
//],