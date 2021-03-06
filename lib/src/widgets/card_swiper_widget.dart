import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {

  final  peliculas;

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
              child: FadeInImage(
                image: NetworkImage( peliculas[index].getPosterIMG() ),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
              )
              
            );
            
          },
          itemCount: peliculas.length,
          //pagination: new SwiperPagination(),//puntos
          //control: new SwiperControl(),//deslizar
        ),
    );
  }
}