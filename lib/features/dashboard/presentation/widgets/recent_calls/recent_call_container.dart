import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:revo/features/dashboard/data/model/call_model.dart';
import 'package:revo/features/dashboard/data/repo/call_repo_impl.dart';
import 'package:revo/features/dashboard/domain/usecase/call_usecase.dart';
import 'package:revo/features/dashboard/presentation/providers/call_cubit.dart';
import 'package:revo/features/dashboard/presentation/providers/call_states.dart';

class CallHistoryPage extends StatelessWidget {
  const CallHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final repository = CallRepoImpl();
        final useCase = GetRecentCallsUseCase(repository);
        return CallCubit(useCase);
      },
      child: IntrinsicHeight(child: RecentCallContainer()),
    );
  }
}

class RecentCallContainer extends StatelessWidget {
  const RecentCallContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CallCubit, CallState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          loading: () => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
          loaded: (calls) {
            final items = calls!;

            return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final call = items[index];
                final callTime = DateTime.fromMillisecondsSinceEpoch(
                  call.callTime,
                );

                final callTimeOut = DateTime.fromMillisecondsSinceEpoch(
                  call.callTimeOut ?? 0,
                );
                String callTimeFormatted = DateFormat(
                  'h:mm a',
                ).format(callTime);
                String callTimeOutFormatted = DateFormat(
                  'h:mm a',
                ).format(callTimeOut);

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        call.callType == CallType.incoming
                            ? Icons.call_received
                            : call.callType == CallType.outgoing
                            ? Icons.call_made
                            : Icons.call_missed,
                        color: call.callType == CallType.missed
                            ? Colors.red
                            : Colors.green,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            call.callerName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            callTimeFormatted,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        callTimeOutFormatted,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                );
              }, childCount: items.length),
            );
          },
          error: (message) => SliverToBoxAdapter(
            child: Center(child: Text('Error loading calls: $message')),
          ),
          empty: () => const SliverToBoxAdapter(
            child: Center(child: Text('No recent calls')),
          ),
        );
      },
    );
  }
}
