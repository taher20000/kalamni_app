

abstract class SocialState {}

class SocialGetUserInitialState extends SocialState {}
class SocialGetUserLoadingState extends SocialState {}
class SocialGetUserSuccessState extends SocialState {}
class SocialGetUserErrorState extends SocialState {
  final String error;

  SocialGetUserErrorState(this.error);
}
class SocialChangeBottomNavBarState extends SocialState{}
