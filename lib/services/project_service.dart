import 'dart:convert';

import 'package:portofolio_web/models/project_model.dart';
import 'package:http/http.dart' as http;

class ProjectService {
  Future<List<ProjectModel>> getProject() async {
    try {
      final res = await http.get(
          Uri.parse('https://muhazri.pythonanywhere.com/api/projects/'),
          headers: {
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*"
          });

      if (res.statusCode == 200) {
        return List<ProjectModel>.from(
          jsonDecode(res.body).map(
            (project) => ProjectModel.fromJson(project),
          ),
        ).toList();
      }

      throw ('error');
    } catch (e) {
      rethrow;
    }
  }
}
