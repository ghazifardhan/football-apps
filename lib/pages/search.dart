import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_apps/blocs/search/search_cubit.dart';
import 'package:football_apps/blocs/search/search_state.dart';
import 'package:football_apps/models/teams_model.dart';

class Search extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Material(
            elevation: 2.0,
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Icon(Icons.search),
                  Expanded(
                    child: TextField(
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Search team here..."
                      ),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (String value) {
                        context.read<SearchCubit>().searchTeam(query: value);
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ),
        Flexible(
          child: BlocConsumer<SearchCubit, SearchState>(
            bloc: context.read<SearchCubit>(),
            listener: (context, state) {},
            builder: (context, state) {
              if (state is SearchLoadingState) {
                return CupertinoActivityIndicator();
              } else if (state is SearchLoadedState) {
                return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()
                  ),
                  shrinkWrap: true,
                  itemCount: state.data.teams.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 0.0);
                  }, 
                  itemBuilder: (context, index) {
                    return TeamCard(
                      team: state.data.teams[index],
                    );
                  }, 
                );
              }
              return Text("${state.toString()}");
            }, 
          ),
        )
      ],
    );
  }

}

class TeamCard extends StatelessWidget {

  final Team team;

  const TeamCard({Key key, this.team}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle
              ),
              child: CachedNetworkImage(imageUrl: team.strTeamBadge),
            ),
            title: Text(team.strTeam),
            subtitle: Text(team.strLeague),
          )
        ],
      ),
    );
  }

}