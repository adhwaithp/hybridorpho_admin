import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase/supabase.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../util/file_upload.dart';
import '../../../values/strings.dart';

part 'residents_event.dart';
part 'residents_state.dart';

class ResidentsBloc extends Bloc<ResidentsEvent, ResidentsState> {
  ResidentsBloc() : super(ResidentsInitial()) {
    on<ResidentsEvent>((event, emit) async {
      try {
        emit(ResidentsLoadingState());
        SupabaseClient supabaseClient = Supabase.instance.client;
        SupabaseQueryBuilder table = supabaseClient.from('senior_citizen');

        if (event is GetAllResidentsEvent) {
          PostgrestFilterBuilder<List<Map<String, dynamic>>> query =
              table.select('*');

          if (event.params['query'] != null) {
            query = query.ilike('name', '%${event.params['query']}%');
          }

          List<Map<String, dynamic>> residents =
              await query.order('name', ascending: true);

          emit(ResidentsGetSuccessState(residents: residents));
        } else if (event is AddResidentEvent) {
          event.residentDetails['photo'] = await uploadFile(
            'residents/image',
            event.residentDetails['image'],
            event.residentDetails['image_name'],
          );
          event.residentDetails.remove('image');
          event.residentDetails.remove('image_name');

          await table.insert(event.residentDetails);

          emit(ResidentsSuccessState());
        } else if (event is EditResidentEvent) {
          if (event.residentDetails['image'] != null) {
            event.residentDetails['photo'] = await uploadFile(
              'residents/image',
              event.residentDetails['image'],
              event.residentDetails['image_name'],
            );
            event.residentDetails.remove('image');
            event.residentDetails.remove('image_name');
          }
          await table.update(event.residentDetails).eq('id', event.residentId);

          emit(ResidentsSuccessState());
        } else if (event is DeleteResidentEvent) {
          await table.delete().eq('id', event.residentId);
          emit(ResidentsSuccessState());
        }
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(ResidentsFailureState());
      }
    });
  }
}
