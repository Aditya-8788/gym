import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym/features/membership/domain/usecase/get_membership_plans.dart';

//import '../../domain/usecases/get_membership_plans.dart';
import 'membership_event.dart';
import 'membership_state.dart';

class MembershipBloc
    extends Bloc<MembershipEvent, MembershipState> {
  final GetMembershipPlans getMembershipPlans;

  MembershipBloc({
    required this.getMembershipPlans,
  }) : super(MembershipInitial()) {
    on<LoadMembershipPlans>(_onLoadMembershipPlans);
  }

  Future<void> _onLoadMembershipPlans(
    LoadMembershipPlans event,
    Emitter<MembershipState> emit,
  ) async {
    emit(MembershipLoading());

    try {
      final plans = await getMembershipPlans();

      emit(MembershipLoaded(plans));
    } catch (e) {
      emit(MembershipError(e.toString()));
    }
  }
}