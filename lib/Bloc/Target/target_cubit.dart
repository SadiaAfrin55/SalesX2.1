import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'target_state.dart';

class TargetCubit extends Cubit<TargetState> {
  TargetCubit() : super(TargetInitial());
}
