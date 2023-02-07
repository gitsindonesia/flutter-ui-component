import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/main_page.dart';
import 'package:gits_flutter_ui_component/pages/component/empty_state/empty_state_page.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_bottom_sheet/gits_bottom_sheet_page.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_button/gits_button_page.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_cached_image/gits_cached_image_page.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_calendar/gits_calendar_page.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_circular_loading/gits_circular_loading_page.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_column_separated/gits_column_separated_page.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_contact/gits_contact_page.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_container_shadow/gits_container_shadow_page.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_date_time_picker/gits_date_time_picker_page.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_dialog/gits_dialog_page.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_divider_dash/gits_divider_dash_page.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_image_picker/gits_image_picker_page.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_player/gits_player_page.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_row_separated/gits_row_separated_page.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_search/gits_search_page.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_carousel/gits_carousel_page.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_sliver_list_separated/gits_sliver_list_separated_page.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_star_rating/gits_star_rating_page.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_status_message/gits_status_message_page.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_status_rounded/gits_status_rounded_page.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_text_field/gits_text_field_page.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_text_scale_down/gits_text_scale_down_page.dart';
import 'package:gits_flutter_ui_component/pages/component/shimmer/shimmer_page.dart';
import 'package:gits_flutter_ui_component/pages/component/spacing/spacing_page.dart';
import 'package:gits_flutter_ui_component/pages/component/text/text.dart';
import 'package:gits_flutter_ui_component/pages/extension/currency/currency_extension_page.dart';
import 'package:gits_flutter_ui_component/pages/extension/date_time/date_time_extension_page.dart';
import 'package:gits_flutter_ui_component/pages/extension/encrypt/encrypt_extension_page.dart';
import 'package:gits_flutter_ui_component/pages/foundation/typography/typhography_page.dart';
import 'package:gits_flutter_ui_component/pages/foundation/validator/validator_value_page.dart';
import 'package:gits_flutter_ui_component/pages/helper/nominal_rupiah/nomimal_rupiah_helper_page.dart';
import 'package:gits_flutter_ui_component/pages/pages/request_forgot_password/request_forgot_password_page.dart';
import 'package:gits_flutter_ui_component/pages/pages/reset_pin/reset_pin_page.dart';
import 'package:gits_flutter_ui_component/pages/pages/splash/splash_page.dart';
import 'package:gits_flutter_ui_component/pages/references/how_to_contribute/how_to_contribute_page.dart';
import 'package:gits_flutter_ui_component/pages/started/changelog/changelog_page.dart';
import 'package:gits_flutter_ui_component/pages/started/contributors/contributors_page.dart';
import 'package:gits_flutter_ui_component/pages/started/home/home_page.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

abstract class Routes {
  static List<CategoryNavigation> navigation = [
    CategoryNavigation(
      category: 'Started',
      navigations: [
        Navigation(
          path: '/',
          label: 'Home',
          icon: const Icon(Icons.home),
          child: const HomePage(),
        ),
        Navigation(
          path: '/changelog',
          label: 'Changelog',
          icon: const Icon(Icons.history),
          child: const ChangelogPage(),
        ),
        Navigation(
          path: '/contributors',
          label: 'Contributors',
          icon: const Icon(Icons.groups),
          child: const ContributorsPage(),
        ),
      ],
    ),
    CategoryNavigation(
      category: 'Foundation',
      navigations: [
        Navigation(
          path: '/typhography',
          label: 'Typhography',
          icon: const Icon(Icons.type_specimen),
          child: const TyphographyPage(),
        ),
        Navigation(
          path: '/validation',
          label: 'Validation',
          icon: const Icon(Icons.type_specimen),
          child: const ValidatorValuePage(),
        ),
      ],
    ),
    CategoryNavigation(
      category: 'Component',
      navigations: [
        Navigation(
          path: '/text',
          label: 'Text',
          icon: const Icon(Icons.text_fields),
          child: const TextPage(),
        ),
        Navigation(
          path: '/gits-text-scale-down',
          label: 'Gits Text Scale Down',
          icon: const Icon(Icons.text_fields),
          child: const GitsTextScaleDownPage(),
        ),
        Navigation(
          path: '/gits-button',
          label: 'Gits Button',
          icon: const Icon(Icons.add),
          child: const GitsButtonPage(),
        ),
        Navigation(
          path: '/gits-dialog',
          label: 'Gits Dialog',
          icon: const Icon(Icons.add),
          child: const GitsDialogPage(),
        ),
        Navigation(
          path: '/gits-text-field',
          label: 'Gits Text Field',
          icon: const Icon(Icons.add),
          child: const GitsTextFieldPage(),
        ),
        Navigation(
          path: '/shimmer',
          label: 'Shimmer',
          icon: const Icon(Icons.cached),
          child: const ShimmerPage(),
        ),
        Navigation(
          path: '/gits-circular-loading',
          label: 'Gits Circular Loading',
          icon: const Icon(Icons.cached),
          child: const GitsCircularLoadingPage(),
        ),
        Navigation(
          path: '/gits-cached-image',
          label: 'Gits Cached Image',
          icon: const Icon(Icons.cached),
          child: const GitsCachedImagePage(),
        ),
        Navigation(
          path: '/gits-contact',
          label: 'Gits Contact',
          icon: const Icon(Icons.cached),
          child: const GitsContactPage(),
        ),
        Navigation(
          path: '/gits-calendar',
          label: 'Gits Calendar',
          icon: const Icon(Icons.cached),
          child: const GitsCalendarPage(),
        ),
        Navigation(
          path: '/gits-container-shadow',
          label: 'Gits Container Shadow',
          icon: const Icon(Icons.cached),
          child: const GitsContainerShadowPage(),
        ),
        Navigation(
          path: '/gits-search',
          label: 'Gits Search',
          icon: const Icon(Icons.cached),
          child: const GitsSearchPage(),
        ),
        Navigation(
          path: '/gits-bottom-sheet',
          label: 'Gits Bottom Sheet',
          icon: const Icon(Icons.cached),
          child: const GitBottomSheetPage(),
        ),
        Navigation(
          path: '/gits-star-rating',
          label: 'Gits Star Rating',
          icon: const Icon(Icons.cached),
          child: const GitsStarRatingPage(),
        ),
        Navigation(
          path: '/spacing',
          label: 'Spacing',
          icon: const Icon(Icons.density_large),
          child: const SpacingPage(),
        ),
        Navigation(
          path: '/empty-state',
          label: 'Empty State',
          icon: const Icon(Icons.layers),
          child: const EmptyStatePage(),
        ),
        Navigation(
          path: '/gits-column-separated',
          label: 'Gits Column Separated',
          icon: const Icon(Icons.table_rows),
          child: const GitsColumnSeparatedPage(),
        ),
        Navigation(
          path: '/gits-row-separated',
          label: 'Gits Row Separated',
          icon: const Icon(Icons.view_column),
          child: const GitsRowSeparatedPage(),
        ),
        Navigation(
          path: '/gits-sliver-list-separated',
          label: 'Gits Sliver List Separated',
          icon: const Icon(Icons.wrap_text),
          child: const GitsSliverListSeparatedPage(),
        ),
        Navigation(
          path: '/gits-divider-dash',
          label: 'Gits Divider Dash',
          icon: const Icon(Icons.power_input),
          child: const GitsDividerDashPage(),
        ),
        Navigation(
          path: '/gits-status-rounded',
          label: 'Gits Status Rounded',
          icon: const Icon(Icons.power_input),
          child: const GitsStatusRoundedPage(),
        ),
        Navigation(
          path: '/gits-status-message',
          label: 'Gits Status Message',
          icon: const Icon(Icons.power_input),
          child: const GitsStatusMessagePage(),
        ),
        Navigation(
          path: '/gits-date-time-picker',
          label: 'Gits Date Time Picker',
          icon: const Icon(Icons.power_input),
          child: const GitsDateTimePickerPage(),
        ),
        Navigation(
          path: '/gits-image-picker',
          label: 'Gits Image Picker',
          icon: const Icon(Icons.photo_camera),
          child: const GitsImagePickerPage(),
        ),
        Navigation(
          path: '/gits-player',
          label: 'Gits Player',
          icon: const Icon(Icons.photo_camera),
          child: const GitsPlayerPage(),
        ),
        Navigation(
          path: '/gits-slider',
          label: 'Gits Slider',
          icon: const Icon(Icons.photo_camera),
          child: const GitsSliderPage(),
        ),
      ],
    ),
    CategoryNavigation(
      category: 'Pages',
      navigations: [
        Navigation(
          path: '/splash',
          label: 'Splash',
          icon: const Icon(Icons.splitscreen),
          child: const SplashPage(),
        ),
        Navigation(
          path: '/request-forgot-password',
          label: 'Request Forgot Password',
          icon: const Icon(Icons.splitscreen),
          child: const RequestForgotPasswordPage(),
        ),
        Navigation(
          path: '/reset-pin',
          label: 'Reset Pin',
          icon: const Icon(Icons.splitscreen),
          child: const ResetPinPage(),
        ),
      ],
    ),
    CategoryNavigation(
      category: 'Extension',
      navigations: [
        Navigation(
          path: '/date-time',
          label: 'Date Time',
          icon: const Icon(Icons.volunteer_activism),
          child: const DateTimeExtensionPage(),
        ),
        Navigation(
          path: '/currency',
          label: 'Currency',
          icon: const Icon(Icons.volunteer_activism),
          child: const CurrencyExtensionPage(),
        ),
        Navigation(
          path: '/encrypt',
          label: 'Encrypt',
          icon: const Icon(Icons.volunteer_activism),
          child: const EncryptExtensionPage(),
        ),
      ],
    ),
    CategoryNavigation(
      category: 'Helper',
      navigations: [
        Navigation(
          path: '/nominal_rupiah',
          label: 'Nominal Rupiah',
          icon: const Icon(Icons.volunteer_activism),
          child: const NominalRupiahHelperPage(),
        ),
      ],
    ),
    CategoryNavigation(
      category: 'References',
      navigations: [
        Navigation(
          path: '/how-to-contribute',
          label: 'How To Contribute',
          icon: const Icon(Icons.volunteer_activism),
          child: const HowToContributePage(),
        ),
      ],
    ),
  ];

  static GoRouter routes = GoRouter(
    initialLocation: '/',
    navigatorKey: navigatorKey,
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainPage(child: child),
        routes: [
          for (final category in navigation)
            for (final navigation in category.navigations)
              GoRoute(
                path: navigation.path,
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: navigation.child),
              ),
        ],
      ),
    ],
  );
}

class CategoryNavigation {
  CategoryNavigation({
    required this.category,
    required this.navigations,
  });

  final String category;
  final List<Navigation> navigations;
}

class Navigation {
  Navigation({
    required this.path,
    required this.label,
    required this.icon,
    required this.child,
  });

  final String path;
  final String label;
  final Widget icon;
  final Widget child;
}
