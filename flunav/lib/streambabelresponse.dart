import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;


void main() {


}

class Response {
  final String responseText;
  final String textToShow;
  final String query;
  final String chart;

  Response.fromJson(Map jsonMap) :
        responseText = jsonMap['text'],
        textToShow =  jsonMap['textToShow'],
        query = jsonMap['title'],
        chart =  jsonMap['image_url'];
}


Future<Stream<Response>> getResponse(String query) async {

  var url = 'https://8egnc1quwh.execute-api.us-east-1.amazonaws.com/dev/mobile/jubilee_search/' + query;

  var client = new http.Client();
  var streamedRes = await client.send(
      new http.Request('get', Uri.parse(url))
  ); //client.send

  // a stream is different from a future
  // we want to convert our results to a stream
  return streamedRes.stream
      .transform(UTF8.decoder)
      .transform(JSON.decoder)
      .expand((jsonBody) => (jsonBody as Map)['results'] )
      .map((jsonPlace) => new Place.fromJson(jsonPlace));   // we map our results to a place object
  //  for debugging
//      .listen((data) => print(data))
//      .onDone(() => client.close());


}