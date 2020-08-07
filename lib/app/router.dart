import 'package:auto_route/auto_route_annotations.dart';
import 'package:coding_blocks_junior/ui/views/dashboard/dashboard_view.dart';
import 'package:coding_blocks_junior/ui/views/on_board/on_board_view.dart';
import 'package:coding_blocks_junior/ui/views/course/view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AdaptiveRoute (page: OnBoardView, ),
    AdaptiveRoute (page: DashboardView, initial: true),
    AdaptiveRoute (page: CourseView, path: '/courses/:slug')
  ]
)
class $Router {}