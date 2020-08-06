import 'package:auto_route/auto_route_annotations.dart';
import 'package:coding_blocks_junior/ui/views/courses/courses_view.dart';
import 'package:coding_blocks_junior/ui/views/on_board/on_board_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: OnBoardView, initial: true),
    MaterialRoute(page: CoursesView)
  ]
)
class $Router {}