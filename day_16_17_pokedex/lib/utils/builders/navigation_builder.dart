import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../navigation/navigation_bloc.dart';
import '../../navigation/navigation_event.dart';
import 'api_builder.dart';

void goToPage(BuildContext context, query) => BlocProvider.of<NavigationBloc>(context).add(GoToPageEvent(page: pageUrl((query).toString())));