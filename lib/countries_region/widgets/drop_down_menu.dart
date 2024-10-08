import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_info_app/countries_region/cubit/countries_cubit.dart';

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String? value;

  @override
  Widget build(BuildContext context) {
    TextStyle menuItemTextStyle =
        Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16);
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(child: Text("All"), value: "all"),
      DropdownMenuItem(child: Text("America"), value: "region/america"),
      DropdownMenuItem(child: Text("Africa"), value: "region/africa"),
      DropdownMenuItem(child: Text("Asia"), value: "region/asia"),
      DropdownMenuItem(child: Text("Europe"), value: "region/europe"),
      DropdownMenuItem(child: Text("Oceania"), value: "region/oceania"),
    ];

    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Card(
        elevation: 10,
        child: DropdownButtonHideUnderline(
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 30,
            child: DropdownButton(
              dropdownColor: Theme.of(context).backgroundColor,
              style: menuItemTextStyle,
              hint: Text(
                'Filter By Region',
                style: menuItemTextStyle,
              ),
              items: menuItems,
              onChanged: (String? value) {
                context.read<CountriesCubit>().callgetCountries(value!);
                setState(() => this.value = value);
              },
              value: value,
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
