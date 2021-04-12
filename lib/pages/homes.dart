import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_apps/blocs/country/country_cubit.dart';
import 'package:football_apps/blocs/country/country_state.dart';
import 'package:football_apps/models/countries_model.dart';
import 'package:football_apps/pages/events.dart';

class Homes extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountryCubit, CountryState>(
      bloc: context.read<CountryCubit>(),
      listener: (context, state) {

      },
      builder: (context, state) {
        if (state is CountryLoadingState) {
          return CupertinoActivityIndicator();
        } else if (state is CountryLoadedState) {
          return RefreshIndicator(
            onRefresh: () async {
              await context.read<CountryCubit>().getCountries();
            },
            child: ListView.separated(
              padding: EdgeInsets.all(10.0),
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()
              ),
              itemCount: state.data.countries.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 0.0);
              }, 
              itemBuilder: (context, index) {
                return CountryCard(
                  index: index,
                  country: state.data.countries[index],
                  loading: state.loadingClub,
                  state: state,
                );
              }, 
            ), 
          );
        }
        return ErrorFetchWidget(
          onClick: () async {
            await context.read<CountryCubit>().getCountries();
          },
        );
      }, 
    );
  }

}

class CountryCard extends StatelessWidget {
  
  final Country country;
  final bool loading;
  final int index;
  final CountryLoadedState state;

  const CountryCard({Key key, this.country, this.loading, this.index, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            leading: Icon(Icons.arrow_drop_down_circle),
            onTap: () {
              context.read<CountryCubit>().getClubInCountries(countryName: country.nameEn, selectedIndex: index);
            },
            title: Text(country.nameEn),
          ),
          (loading && (state.selectedIndex == index)) ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoActivityIndicator(),
          ) : Container(),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.all(country.teams.length > 0 ? 10.0 : 0.0),
            physics: NeverScrollableScrollPhysics(),
            itemCount: country.teams.length,
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.0,);
            }, 
            itemBuilder: (context, index) {
              return ClubListItem(
                teamLogo: country.teams[index].strTeamBadge,
                teamName: country.teams[index].strTeam
              );
            }, 
          )
        ],
      ),
    );
  }

}

class ClubListItem extends StatelessWidget {
  
  final String teamName;
  final String teamLogo;

  const ClubListItem({Key key, this.teamName, this.teamLogo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle
          ),
          child: CachedNetworkImage(
            imageUrl: teamLogo,
            width: 30,
            height: 30,
          ),
        ),
        SizedBox(width: 10.0,),
        Flexible(child: Text(teamName))
      ],
    );
  }

}