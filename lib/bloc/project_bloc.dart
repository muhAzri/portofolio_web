import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portofolio_web/models/project_model.dart';
import 'package:portofolio_web/services/project_service.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(ProjectInitial()) {
    on<ProjectEvent>((event, emit) async {
      if (event is ProjectGet) {
        try {
          emit(ProjectLoading());

          final tips = await ProjectService().getProject();

          emit(ProjectSuccess(tips));
        } catch (e) {
          emit(
            ProjectFailed(
              e.toString(),
            ),
          );
        }
      }
    });
  }
}
