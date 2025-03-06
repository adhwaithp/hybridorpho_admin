import 'package:bloc/bloc.dart';
import 'package:logger/web.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../util/file_upload.dart';
import '../../../values/strings.dart';

part 'staffs_event.dart';
part 'staffs_state.dart';

class StaffsBloc extends Bloc<StaffsEvent, StaffsState> {
  StaffsBloc() : super(StaffsInitialState()) {
    on<StaffsEvent>((event, emit) async {
      try {
        emit(StaffsLoadingState());
        SupabaseClient supabaseClient = Supabase.instance.client;
        SupabaseQueryBuilder table = supabaseClient.from('staffs');

        if (event is GetAllStaffsEvent) {
          PostgrestFilterBuilder<List<Map<String, dynamic>>> query =
              table.select('*');

          if (event.params['query'] != null) {
            query = query.ilike('name', '%${event.params['query']}%');
          }

          List<Map<String, dynamic>> staffs =
              await query.order('name', ascending: true);

          emit(StaffsGetSuccessState(staffs: staffs));
        } else if (event is AddStaffEvent) {
          final response = await supabaseClient.auth.admin.createUser(
            AdminUserAttributes(
              email: event.staffDetails['email'],
              password: event.staffDetails['password'],
              emailConfirm: true,

              appMetadata: {"role": "staff"}, // Custom role
            ),
          );
          event.staffDetails.remove('password');
          event.staffDetails['user_id'] = response.user?.id;
          event.staffDetails['photo'] = await uploadFile(
            'staffs/image',
            event.staffDetails['image'],
            event.staffDetails['image_name'],
          );
          event.staffDetails.remove('image');
          event.staffDetails.remove('image_name');

          await table.insert(event.staffDetails);

          emit(StaffsSuccessState());
        } else if (event is EditStaffEvent) {
          event.staffDetails.remove('email');
          event.staffDetails.remove('password');
          if (event.staffDetails['image'] != null) {
            event.staffDetails['photo'] = await uploadFile(
              'staffs/image',
              event.staffDetails['image'],
              event.staffDetails['image_name'],
            );
            event.staffDetails.remove('image');
            event.staffDetails.remove('image_name');
          }
          await table.update(event.staffDetails).eq('id', event.staffId);

          emit(StaffsSuccessState());
        } else if (event is DeleteStaffEvent) {
          await table.delete().eq('id', event.staffId);
          emit(StaffsSuccessState());
        }
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(StaffsFailureState());
      }
    });
  }
}
