part of 'venue_cubit.dart';

class VenueState extends Equatable {
  const VenueState();

  @override
  List<Object> get props => [];
}

class VenueStateInitial extends VenueState {}

class VenueStateLoading extends VenueState {}

class VenueStateLoaded extends VenueState {
  final VenueModel venueModel;

  const VenueStateLoaded({required this.venueModel});
}

class VenueStateFailure extends VenueState {
  final String errMessage;

  const VenueStateFailure({required this.errMessage});
}
