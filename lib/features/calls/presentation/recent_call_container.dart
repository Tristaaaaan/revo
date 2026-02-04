import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:revo/features/calls/data/model/call_model.dart';
import 'package:revo/features/calls/data/repo/call_repo_impl.dart';
import 'package:revo/features/calls/domain/usecase/call_usecase.dart';
import 'package:revo/features/calls/presentation/cubit/call_cubit.dart';
import 'package:revo/features/calls/presentation/cubit/call_states.dart';

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

                final callTimeOut = DateTime.fromMillisecondsSinceEpoch(
                  call.callTimeOut ?? 0,
                );

                String callTimeOutFormatted = DateFormat(
                  'h:mm a',
                ).format(callTimeOut);

                final duration = Duration(seconds: call.callDuration!);

                final minutes = duration.inMinutes;
                final seconds = duration.inSeconds % 60;

                final formatted =
                    '${minutes}m ${seconds.toString().padLeft(2, '0')}s';

                String callDurationFormatted = call.callDuration == 0
                    ? "Client didn't answer"
                    : "$formatted • ${call.description}";

                Color bgColor;
                String imagePath;

                switch (call.callType) {
                  case CallType.incoming:
                    imagePath = 'assets/icons/calls/incoming.png';
                    bgColor = const Color(0x1A10B981);
                    break;

                  case CallType.outgoing:
                    imagePath = 'assets/icons/calls/outgoing.png';
                    bgColor = const Color(0x1A3B82F6);
                    break;

                  case CallType.missed:
                    imagePath = 'assets/icons/calls/missed.png';
                    bgColor = const Color(0x1A94A3B8);
                    break;
                }

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),

                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),

                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset(
                          imagePath,
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            call.callerNumber,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            callDurationFormatted,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
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
