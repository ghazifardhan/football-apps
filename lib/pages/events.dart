import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_apps/blocs/league/league_cubit.dart';
import 'package:football_apps/blocs/league/league_state.dart';
import 'package:football_apps/models/leagues_model.dart';
import 'package:football_apps/pages/homes.dart';

class Events extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LeagueCubit, LeagueState>(
      bloc: context.read<LeagueCubit>(),
      listener: (context, state) {

      },
      builder: (context, state) {
        if (state is LeagueLoadingState) {
          return CupertinoActivityIndicator();
        } else if (state is LeagueLoadedState) {
          return RefreshIndicator(
            onRefresh: () async {
              await context.read<LeagueCubit>().getLeagues();
            },
            child: ListView.separated(
              padding: EdgeInsets.all(10.0),
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()
              ),
              itemCount: state.datas.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 0.0);
              }, 
              itemBuilder: (context, index) {
                return LeagueCard(
                  index: index,
                  league: state.datas[index],
                  loading: state.loadingEvent,
                  state: state,
                );
              }, 
            ), 
          );
        }
        return ErrorFetchWidget(
          onClick: () async {
            await context.read<LeagueCubit>().getLeagues();
          },
        );
      }, 
    );
  }

}

class LeagueCard extends StatelessWidget {
  
  final League league;
  final bool loading;
  final int index;
  final LeagueLoadedState state;

  const LeagueCard({Key key, this.league, this.loading, this.index, this.state}) : super(key: key);

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
              context.read<LeagueCubit>().getEventInLeagues(leagueId: league.idLeague, selectedIndex: index);
            },
            title: Text(league.strLeague),
          ),
          (loading && (state.selectedIndex == index)) ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoActivityIndicator(),
          ) : Container(),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.all(league.eventsPast.length > 0 ? 10.0 : 0.0),
            physics: NeverScrollableScrollPhysics(),
            itemCount: league.eventsPast.length,
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.0,);
            }, 
            itemBuilder: (context, index) {
              return ClubListItem(
                teamName: "${league.eventsPast[index].strEvent} (${league.eventsPast[index].dateEventLocal} ${league.eventsPast[index].strTimeLocal})",
                teamLogo: league.eventsPast[index].strThumb
              );
            }, 
          )
        ],
      ),
    );
  }

}

class ErrorFetchWidget extends StatelessWidget {

  final Function onClick;

  const ErrorFetchWidget({Key key, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Fetch Data Error"),
        IconButton(
          icon: Icon(Icons.replay), 
          onPressed: onClick
        )
      ],
    );
  }

}