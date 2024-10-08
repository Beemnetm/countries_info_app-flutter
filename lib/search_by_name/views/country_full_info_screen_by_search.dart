import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_info_app/country_full_info/cubit/country_cubit.dart';
import 'package:countries_info_app/search_by_name/cubit/search_cubit.dart';
import 'package:countries_info_app/widgets/custom_app_bar.dart';

import '../../const.dart';
import '../../country_full_info/widgets/countryview.dart';

class SearchCountryFullInfoScreen extends StatelessWidget {
  const SearchCountryFullInfoScreen({
    Key? key,
  }) : super(key: key);
  static const String route = 'SearchCountryFullInfoScreen';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(74),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CustomAppBar(),
          ),
        ),
        body: BlocProvider(
          create: (context) => SearchCubit(),
          child: CountryFullInfoView(
            name: args,
          ),
        ));
  }
}

class CountryFullInfoView extends StatelessWidget {
  const CountryFullInfoView({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    context.read<SearchCubit>().searchName(countryName: name);
    return Container(
      margin: const EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Card(
              elevation: 3,
              margin: const EdgeInsets.only(top: 40),
              child: SizedBox(
                width: 100,
                height: 40,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.arrow_back),
                      Text(
                        'Back',
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ]),
              ),
            ),
          ),
          Center(child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchLoading) {
                return const CircularProgressIndicator();
              } else if (state is SearchError) {
                return Center(child: Text(state.error));
              } else if (state is SearchLoaded) {
                return CountryView(country: state.country);
              } else {
                return const CircularProgressIndicator();
              }
            },
          )),
        ],
      ),
    );
  }
}
