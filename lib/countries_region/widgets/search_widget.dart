import 'package:flutter/material.dart';
import 'package:countries_info_app/search_by_name/views/country_full_info_screen_by_search.dart';

import '../../const.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({
    Key? key,
  }) : super(key: key);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        child: SizedBox(
          height: 55,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            const Icon(
              Icons.search,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                  controller: controller,
                  onEditingComplete: () => Navigator.pushNamed(
                      context, SearchCountryFullInfoScreen.route,
                      arguments: controller.text),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16),
                  decoration: InputDecoration(
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Search for a Country',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16))),
            )
          ]),
        ));
  }
}
