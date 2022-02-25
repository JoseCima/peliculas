import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';


class MovieHorizontal extends StatelessWidget {


  final peliculas;
  final sigPagina;

  MovieHorizontal ({@required this.peliculas, @required this.sigPagina});

  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3,
  );

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener( ( ){
         if ( _pageController.position.pixels >= _pageController.position.maxScrollExtent - 200 ){
            sigPagina();
         }
    });

    return Container(
       height: _screenSize.height * 0.2,
       child: PageView(
         pageSnapping: false,//por defecto es true
         controller: _pageController,
         children: _tarjetas(context),
       ),
    );
    
    
  }


 List<Widget> _tarjetas(BuildContext context) {


   return peliculas.map<Widget>((pelicula){

     return Container(
       margin: EdgeInsets.only(right: 15.0),
       child: Column(
         children: <Widget>[
           ClipRRect(
             borderRadius: BorderRadius.circular(20.0),
             child: FadeInImage(placeholder: AssetImage('assets/img/no-image.jpg'), image: NetworkImage(pelicula.getPosterIMG()),
                fit: BoxFit.cover,
                height: 125.0,
             ),
           ),
           SizedBox(height: 5.0),
          Text(
            pelicula.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          )

         ],
       ),
     );
   }).toList();
 }
}