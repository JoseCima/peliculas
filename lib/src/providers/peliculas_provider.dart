import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider{
  String _apikey = 'a33d872fb1fb624d3d061784191f4b33';
  String _url = 'api.themoviedb.org';
  String _languaje = 'es-ES';


  Future <List<Pelicula>> _procesarResp(Uri url) async{

    final resp = await http.get(url);
   final decodedData = json.decode(resp.body);

   final peliculas = new Peliculas.fromJsonList(decodedData['results']);
   

   return peliculas.items;
  }


 Future <List<Pelicula>> getEnCines() async{
     
   final url = Uri.https(_url, '3/movie/now_playing', {
     
     'api_key'    : _apikey,
     'languaje'   : _languaje

     
     


   });
   
   return await _procesarResp(url);

  }



  Future<List<Pelicula>> getPopulares() async{
    
    final url = Uri.https(_url, '3/movie/popular', {
     
     'api_key'    : _apikey,
     'languaje'   : _languaje
   });

   return await _procesarResp(url);
  }


}