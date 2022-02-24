


import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Películas - JoseCima'),
        backgroundColor: Colors.pink,
        actions: <Widget>[
          IconButton(
             onPressed: (){},
             icon:Icon(Icons.search),
             ),

        ],
      ),
      body:
      Container(
        child: Column(
          children: <Widget>[
            _swiperWidget()
          ],
        ),
      )
    );
  }



  Widget _swiperWidget(){

    final peliculasProvider = new PeliculasProvider();
    peliculasProvider.getEnCines();

    return CardSwiper(
     peliculas: [1,2,3,4,5],
      );
  }

}