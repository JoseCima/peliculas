import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {

  final peliculas;

  CardSwiper({@required this.peliculas} );


  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;
    

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,//Porcentaje
        itemHeight: _screenSize.height * 0.5,//Porcentaje
          itemBuilder: (BuildContext context,int index){
            return ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: //Text(peliculas[index].toString())
              Image.network("http://via.placeholder.com/350x150",fit: BoxFit.cover),
            );
            
          },
          itemCount: peliculas.length,
          //pagination: new SwiperPagination(),//puntos
          //control: new SwiperControl(),//deslizar
        ),
    );
  }
}