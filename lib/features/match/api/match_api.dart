// https://api-football-v1.p.rapidapi.com/v2/fixtures/date/{YYYY-MM-DD}

// aad567230b15af533a80bf5aa13a14cb

import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/match_model.dart';

class MatchApi {
  final dio = Dio();

  Future<List<MatchModel>> getMatches(String date) async {
    try {
      final response = await dio.get(
        'https://v3.football.api-sports.io/fixtures?date=$date',
        options: Options(
          validateStatus: (status) => true,
          headers: {
            'x-rapidapi-host': 'v3.football.api-sports.io',
            'x-rapidapi-key': 'aad567230b15af533a80bf5aa13a14cb',
          },
        ),
      );
      log(response.data.toString());
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['response'];
        List<MatchModel> fixtures = data.map((json) {
          return MatchModel.fromJson(json);
        }).toList();
        return fixtures;
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
