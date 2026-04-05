import 'package:demo_ft_widget/InheritedWidget/InheritedWidget.dart' as inherited;
import 'package:demo_ft_widget/InheritedWidget/notUseInheritedWidget.dart'
    as not_inherited;
import 'package:demo_ft_widget/modal/modal_bottom_sheet.dart' as modal_pkg;
import 'package:demo_ft_widget/view_alert/demo_AlertDialog.dart';
import 'package:demo_ft_widget/view_alert/demo_SnackBar.dart' show SnackBarPage;
import 'package:demo_ft_widget/view_BottomNavigationBar/demo_BottomAppBar.dart';
import 'package:demo_ft_widget/view_BottomNavigationBar/demo_BottomNavigationBar.dart'
    show MyStatefulWidget;
import 'package:demo_ft_widget/view_button/ButonLoading_Stack_Positioned.dart';
import 'package:demo_ft_widget/view_button/ButtonLoading.dart';
import 'package:demo_ft_widget/view_button/Button_width_flex_Container_Row_Text.dart';
import 'package:demo_ft_widget/view_button/Button_width_flex_Container_Text.dart';
import 'package:demo_ft_widget/view_button/Button_width_flex_ConstrainedBox_Container_Row_Text.dart';
import 'package:demo_ft_widget/view_button/Button_width_flex_LayoutBuilder_ConstrainedBox_Container_Row_Text.dart';
import 'package:demo_ft_widget/view_button/demo_GestureDetector.dart';
import 'package:demo_ft_widget/view_drop_down/demo_DropdownButton2.dart';
import 'package:demo_ft_widget/view_frame/demo_Align.dart';
import 'package:demo_ft_widget/view_frame/demo_ClipRRect.dart';
import 'package:demo_ft_widget/view_frame/demo_ClipRect.dart';
import 'package:demo_ft_widget/view_frame/demo_Column.dart';
import 'package:demo_ft_widget/view_frame/demo_Container.dart';
import 'package:demo_ft_widget/view_frame/demo_Row.dart';
import 'package:demo_ft_widget/view_frame/demo_Scaffold.dart';
import 'package:demo_ft_widget/view_frame/demo_Scaffold_basic.dart' as scaffold_basic;
import 'package:demo_ft_widget/view_frame/demo_SizeBox.dart';
import 'package:demo_ft_widget/view_frame/demo_Stack.dart';
import 'package:demo_ft_widget/view_frame/demo_ClipRRect_example.dart';
import 'package:demo_ft_widget/view_GridView/demo_Container_NotificationListener_GridView_loadmore.dart';
import 'package:demo_ft_widget/view_GridView/demo_GridView_loadmore.dart';
import 'package:demo_ft_widget/view_GridView/demo_SingleChildScrollView_Container_NotificationListener_GridView_loadmore.dart';
import 'package:demo_ft_widget/view_GridView/demo_SingleChildScrollView_GridView_loadmore.dart';
import 'package:demo_ft_widget/view_frame/demo_Stack_Positioned.dart';
import 'package:demo_ft_widget/view_image/demo_Image.dart';
import 'package:demo_ft_widget/view_list_view/ListView_ScrollController_loadmore.dart';
import 'package:demo_ft_widget/view_list_view/demo_ListView.dart';
import 'package:demo_ft_widget/view_list_view/demo_Listview_ScrollController.dart';
import 'package:demo_ft_widget/view_list_view/demo_NotificationListener.dart';
import 'package:demo_ft_widget/view_loading/app.dart';
import 'package:demo_ft_widget/view_loading/app_loading.dart';
import 'package:demo_ft_widget/view_loading/demo_CircularProgressIndicator.dart';
import 'package:demo_ft_widget/view_modal_bottom/demo_showModalBottomSheet.dart';
import 'package:demo_ft_widget/view_page_view/demo_AnimatedSwitcher.dart';
import 'package:demo_ft_widget/view_page_view/demo_PageController.dart';
import 'package:demo_ft_widget/view_ScrollView/demo_SingleChildScrollView.dart';
import 'package:demo_ft_widget/view_text/demo_Text.dart';
import 'package:demo_ft_widget/view_text/demo_TextPainter.dart';
import 'package:demo_ft_widget/view_text_field/demo_TextField.dart';
import 'package:demo_ft_widget/view_text_field/demo_TextField_advance.dart'
    show CustomTextField;
import 'package:demo_ft_widget/view-library/tin_coder_view.dart';
import 'package:flutter/material.dart';

/// Màn hình gốc: lưới các thư mục con trong `lib/`.
class AllView extends StatefulWidget {
  const AllView({super.key});

  @override
  State<AllView> createState() => _AllViewState();
}

class _AllViewState extends State<AllView> {
  late Future<List<LibFolderSection>> _sections;

  @override
  void initState() {
    super.initState();
    _sections = getLibFolderSections();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LibFolderSection>>(
      future: _sections,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(title: const Text('Thư mục trong lib')),
            body: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.15,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final folder = snapshot.data![index];
                return _FolderTile(
                  title: folder.folderName,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => FolderDemosScreen(folder: folder),
                      ),
                    );
                  },
                );
              },
            ),
          );
        } else {
          return const Scaffold(body: Center(child: Text('No data')));
        }
      },
    );
  }
}

/// Màn hình con: lưới các file `.dart` trong một thư mục.
class FolderDemosScreen extends StatelessWidget {
  const FolderDemosScreen({super.key, required this.folder});

  final LibFolderSection folder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(folder.folderName)),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.0,
        ),
        itemCount: folder.entries.length,
        itemBuilder: (context, index) {
          final e = folder.entries[index];
          return _FolderTile(
            title: e.fileLabel,
            subtitle: e.hint,
            onTap: () {
              // Push màn hình demo tương ứng với file đã chọn
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: e.builder,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _FolderTile extends StatelessWidget {
  const _FolderTile({
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                maxLines: subtitle == null ? 3 : 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 6),
                Text(
                  subtitle!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class LibDemoEntry {
  const LibDemoEntry({
    required this.fileLabel,
    this.hint,
    required this.builder,
  });

  final String fileLabel;
  final String? hint;
  final WidgetBuilder builder;
}

class LibFolderSection {
  const LibFolderSection(this.folderName, this.entries);

  final String folderName;
  final List<LibDemoEntry> entries;
}

final Map<String, WidgetBuilder> allBuilders = {
  'date_time_intl/demo_time.dart': (_) => _scaffoldSimple(
        'demo_time',
        const Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              'File này hiện chỉ chứa ghi chú (comment), chưa có widget demo.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
  'InheritedWidget/InheritedWidget.dart': (_) => inherited.MyHomePage(
        isLoading: false,
        counter: 0,
        child: inherited.MyCenterWidget(),
      ),
  'InheritedWidget/notUseInheritedWidget.dart': (_) =>
      const not_inherited.MyHomePage(
        isLoading: false,
        counter: 0,
      ),
  'modal/modal_bottom_sheet.dart': (_) => modal_pkg.ModalBottomSheet(),
  'view_alert/demo_AlertDialog.dart': (_) => const DialogExample(),
  'view_alert/demo_SnackBar.dart': (_) => _scaffoldSimple(
        'SnackBar Demo',
        const SnackBarPage(),
      ),
  'view_BottomNavigationBar/demo_BottomAppBar.dart': (_) =>
      const DemoBotomAppBar(),
  'view_BottomNavigationBar/demo_BottomNavigationBar.dart': (_) =>
      const MyStatefulWidget(),
  'view_button/demo_GestureDetector.dart': (_) => const DemoGestureDetector(),
  'view_button/ButtonLoading.dart': (_) => _scaffoldSimple(
        'LoadingButton',
        const LoadingButton(),
      ),
  'view_button/ButonLoading_Stack_Positioned.dart': (_) => _scaffoldSimple(
        'Loading Button Example',
        ButonLoading_Stack_Positioned(),
      ),
  'view_button/Button_width_flex_Container_Text.dart': (_) => _scaffoldSimple(
        'Dynamic Button',
        const Button_width_flex_Container_Text(title: 'Initial Title'),
      ),
  'view_button/Button_width_flex_Container_Row_Text.dart': (_) =>
      _scaffoldSimple(
        'Dynamic Button',
        const Button_width_flex_Container_Row_Text(title: 'Initial Title'),
      ),
  'view_button/Button_width_flex_ConstrainedBox_Container_Row_Text.dart': (_) =>
      _scaffoldSimple(
        'Dynamic Button',
        Button_width_flex_ConstrainedBox_Container_Row_Text(),
      ),
  'view_button/Button_width_flex_LayoutBuilder_ConstrainedBox_Container_Row_Text.dart':
      (_) => _scaffoldSimple(
            'Button with Conditional Max Width',
            Button_Button_width_flex_LayoutBuilder_ConstrainedBox_Container_Row_Textwidth_flex_Container_Text(),
          ),
  'view_drop_down/demo_DropdownButton2.dart': (_) =>
      const DemoDropDownButton2(),
  'view_frame/demo_Align.dart': (_) => const DemoAlign(),
  'view_frame/demo_Column.dart': (_) => const DemoColumn(),
  'view_frame/demo_Container.dart': (_) => const DemoContainer(),
  'view_frame/demo_Row.dart': (_) => const DemoRow(),
  'view_frame/demo_Stack.dart': (_) => const DemoStack(),
  'view_frame/demo_Stack_Positioned.dart': (_) => const demo_Stack_Positioned(),
  'view_frame/demo_SizeBox.dart': (_) => demo_SizeBox(),
  'view_frame/demo_ClipRect.dart': (_) => const demo_ClipRect(),
  'view_frame/demo_ClipRRect.dart': (_) => demo_ClipRRect(),
  'view_frame/demo_ClipRRect_example.dart': (_) =>
      const demo_ClipRRect_example(),
  'view_frame/demo_Scaffold.dart': (_) => const DemoScaffold(),
  'view_frame/demo_Scaffold_basic.dart': (_) =>
      const scaffold_basic.MyHomePage(),
  'view_GridView/demo_GridView_loadmore.dart': (_) => const GridViewLoadMore(),
  'view_GridView/demo_Container_NotificationListener_GridView_loadmore.dart':
      (_) => ContainerNotificationListenerGridviewLoadMore(),
  'view_GridView/demo_SingleChildScrollView_Container_NotificationListener_GridView_loadmore.dart':
      (_) =>
          SingleChildScrollViewContainerNotificationListenerGridViewLoadMore(),
  'view_GridView/demo_SingleChildScrollView_GridView_loadmore.dart': (_) =>
      const demo_SingleChildScrollView_GridView_loadmore(),
  'view_image/demo_Image.dart': (_) => const DemoImage(),
  'view_list_view/demo_ListView.dart': (_) => const DemoListView(),
  'view_list_view/demo_Listview_ScrollController.dart': (_) =>
      const ListViewScrollController(),
  'view_list_view/demo_NotificationListener.dart': (_) =>
      demo_NotificationListener(),
  'view_list_view/ListView_ScrollController_loadmore.dart': (_) =>
      const ListView_ScrollController_loadmore(),
  'view_loading/app.dart': (_) => const EffectLoading(),
  'view_loading/app_loading.dart': (_) => _scaffoldSimple(
        'AppLoading.spinkit',
        Center(child: AppLoading.spinkit),
      ),
  'view_loading/demo_CircularProgressIndicator.dart': (_) =>
      const CircularLoadingExample(),
  'view_modal_bottom/demo_showModalBottomSheet.dart': (_) =>
      const BottomSheetExample(),
  'view_page_view/demo_PageController.dart': (_) => demo_PageController(),
  'view_page_view/demo_AnimatedSwitcher.dart': (_) => demo_AnimatedSwitcher(),
  'view_ScrollView/demo_SingleChildScrollView.dart': (_) =>
      const SingleChildScrollViewExample(),
  'view_text/demo_Text.dart': (_) => const DemoText(),
  'view_text/demo_TextPainter.dart': (_) => const DemoTextPainter(),
  'view_text_field/demo_TextField.dart': (_) => const DemoTextField(),
  'view_text_field/demo_TextField_advance.dart': (_) => _scaffoldSimple(
        'Demo TextField',
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomTextField(),
            ],
          ),
        ),
      ),
  'view-library/tin_coder_view.dart': (_) => const TinCoderView(),
};

const Map<String, String?> hints = {
  'date_time_intl/demo_time.dart': 'Chỉ có comment, chưa có UI',
  'view_loading/app.dart': 'Loader overlay + MaterialApp',
};

Future<List<LibFolderSection>> getLibFolderSections() async {
  final folderEntries = <String, List<LibDemoEntry>>{};

  for (final entry in allBuilders.entries) {
    final filePath = entry.key;
    final folderName = filePath.contains('/')
        ? filePath.substring(0, filePath.lastIndexOf('/'))
        : 'lib';
    final fileName = filePath.contains('/')
        ? filePath.substring(filePath.lastIndexOf('/') + 1)
        : filePath;
    final builder = entry.value;

    folderEntries.putIfAbsent(folderName, () => []).add(
          LibDemoEntry(
            fileLabel: fileName,
            hint: hints[filePath],
            builder: builder,
          ),
        );
  }

  return folderEntries.entries
      .map((e) => LibFolderSection(e.key, e.value))
      .toList();
}

Scaffold _scaffoldSimple(String title, Widget body) {
  return Scaffold(
    appBar: AppBar(title: Text(title)),
    body: body,
  );
}







