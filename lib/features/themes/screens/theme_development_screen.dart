import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lb_planner/features/themes/themes.dart';

/// A screen that eases the development of themes, as it shows all the different elements of a theme.
///
/// This screen is not meant to be used in production and should only be available when the app is in debug mode.
class ThemeDevelopmentScreen extends ConsumerStatefulWidget {
  /// A screen that eases the development of themes, as it shows all the different elements of a theme.
  ///
  /// This screen is not meant to be used in production and should only be available when the app is in debug mode.
  const ThemeDevelopmentScreen({super.key});

  @override
  ConsumerState<ThemeDevelopmentScreen> createState() =>
      _ThemeDevelopmentScreenState();
}

class _ThemeDevelopmentScreenState
    extends ConsumerState<ThemeDevelopmentScreen> {
  late ThemeService<ThemeData> themeService;
  late ThemeBasesRepository themeBasesRepository;

  ThemeBase? selectedThemeBase;

  @override
  Widget build(BuildContext context) {
    themeService = ref.watch(themeServiceProvider);
    themeBasesRepository = ref.watch(themeBasesRepositoryProvider);

    selectedThemeBase ??= themeBasesRepository.defaultTheme;

    return MaterialApp(
      theme: themeService.generateTheme(selectedThemeBase!),
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Theme Previewer'),
            actions: [
              DropdownButton<ThemeBase>(
                icon: Icon(
                  selectedThemeBase!.icon,
                  color: selectedThemeBase!.iconColor,
                ),
                value: selectedThemeBase,
                onChanged: (themeBase) {
                  setState(() {
                    selectedThemeBase = themeBase;
                  });
                },
                items: [
                  for (final themeBase in themeBasesRepository.getThemes())
                    DropdownMenuItem(
                      value: themeBase,
                      child: Text(themeBase.name),
                    ),
                ],
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Typography',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 16),
                  Text('Headline1',
                      style: Theme.of(context).textTheme.displayLarge),
                  Text('Headline2',
                      style: Theme.of(context).textTheme.displayMedium),
                  Text('Headline3',
                      style: Theme.of(context).textTheme.displaySmall),
                  Text('Headline4',
                      style: Theme.of(context).textTheme.headlineMedium),
                  Text('Headline5',
                      style: Theme.of(context).textTheme.headlineSmall),
                  Text('Headline6',
                      style: Theme.of(context).textTheme.titleLarge),
                  Text('Subtitle1',
                      style: Theme.of(context).textTheme.titleMedium),
                  Text('Subtitle2',
                      style: Theme.of(context).textTheme.titleSmall),
                  Text('BodyText1',
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text('BodyText2',
                      style: Theme.of(context).textTheme.bodyMedium),
                  Text('Caption', style: Theme.of(context).textTheme.bodySmall),
                  Text('Button', style: Theme.of(context).textTheme.labelLarge),
                  Text('Overline',
                      style: Theme.of(context).textTheme.labelSmall),
                  SizedBox(height: 32),
                  Text(
                    'Buttons',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Elevated Button'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Text Button'),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('Outlined Button'),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Colors',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Icons',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 16),
                  Icon(Icons.favorite),
                  Icon(Icons.share),
                  Icon(Icons.comment),
                  SizedBox(height: 32),
                  Text(
                    'Input Fields',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Text Field',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Text Field',
                    ),
                  ),
                  // TODO: add more widgets as components are added
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      ColorPreviewBox(
                        colorName: 'Accent Color',
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      ColorPreviewBox(
                        colorName: 'Canvas Color',
                        color: Theme.of(context).canvasColor,
                      ),
                      ColorPreviewBox(
                        colorName: 'Background Color',
                        color: Theme.of(context).colorScheme.background,
                      ),
                      ColorPreviewBox(
                        colorName: 'Scaffold Background Color',
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      ColorPreviewBox(
                        colorName: 'Surface Color',
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      ColorPreviewBox(
                        colorName: 'Error Color',
                        color: Theme.of(context).colorScheme.error,
                      ),
                      ColorPreviewBox(
                        colorName: 'Module Pending',
                        color: ModuleStatusTheme.of(context).pendingColor,
                      ),
                      ColorPreviewBox(
                        colorName: 'Module Done',
                        color: ModuleStatusTheme.of(context).doneColor,
                      ),
                      ColorPreviewBox(
                        colorName: 'Module Uploaded',
                        color: ModuleStatusTheme.of(context).uploadedColor,
                      ),
                      ColorPreviewBox(
                        colorName: 'Module Late',
                        color: ModuleStatusTheme.of(context).lateColor,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
