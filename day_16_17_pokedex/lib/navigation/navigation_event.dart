abstract class NavigationEvent {}

class PreviousEvent extends NavigationEvent {}

class GoToDetailsEvent extends NavigationEvent {
  final int id;

  GoToDetailsEvent({required this.id});
}

class GoToPageEvent extends NavigationEvent {
  final String page;

  GoToPageEvent({required this.page});
}