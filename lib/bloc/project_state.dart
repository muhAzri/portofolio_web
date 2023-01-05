part of 'project_bloc.dart';

abstract class ProjectState extends Equatable {
  const ProjectState();

  @override
  List<Object> get props => [];
}

class ProjectInitial extends ProjectState {}

class ProjectLoading extends ProjectState {}

class ProjectFailed extends ProjectState {
  final String e;

  const ProjectFailed(this.e);

  @override
  List<Object> get props => [e];
}

class ProjectSuccess extends ProjectState {
  final List<ProjectModel> projects;

  const ProjectSuccess(this.projects);

  @override
  List<Object> get props => [projects];
}
