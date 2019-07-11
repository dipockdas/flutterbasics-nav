import 'dart:convert';
import 'dart:async';
import 'dart:io';


// import 'package:http/http.dart' as http;


void main() {
  getBabel("sales in 2017");
  getBabel("daily sales last week in London");

}

class BabelResult {
  final String reponseText;
  final String textToShow;
  final String query;
  final String chart;

  BabelResult.fromJson(Map jsonMap) :
        reponseText = jsonMap['text'],
        textToShow =  jsonMap['textToShow'],
        query = jsonMap['title'],
        chart =  jsonMap['image_url'];

}



// We want our HTTP call to return a stream - we need to set the function
// so it's a Future that returns a Stream of class Place
// Future<Stream<Results>> getBabel(String query) async {
Future<Stream<BabelResult>> getBabel(String query) async {
  print("getBabel");

  // var url = 'https://api.askpony.com/services/search/1cc86d4308f147f09c90c3acc58835cf/' + query;
  var url = 'https://8egnc1quwh.execute-api.us-east-1.amazonaws.com/dev/mobile/jubilee_search/' + query;

  var httpClient = new HttpClient();


  BabelResult babelresponse;
  String result;
  try {
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    if (response.statusCode == HttpStatus.OK) {
      var json = await response.transform(UTF8.decoder).join();
      var data = JSON.decode(json);
      // result = data['text'];
      babelresponse = new BabelResult.fromJson(data);

      print(query);
      print(babelresponse.textToShow);
      result = babelresponse.textToShow;


    } else {
      print('Error getting IP address: Http status ${response.statusCode}');
    }
  } catch (exception) {
    print('Failed getting IP address');
  }
  // return babelresult;
  return babelresponse;


}


