part of lbplanner_routes;

/// Update route.
class UpdateRoute extends StatefulWidget {
  /// Update route.
  const UpdateRoute({Key? key}) : super(key: key);

  /// Info about this route.
  static final RouteInfo info = RouteInfo(
    routeName: "/update",
    builder: (_, __) => UpdateRoute(),
    standalone: true,
  );

  /// Factor multiplied by the screen width to get the padding.
  static const paddingFactor = 0.1;

  /// Size of the app icon.
  static const double iconSize = 60;

  @override
  State<UpdateRoute> createState() => _UpdateRouteState();
}

class _UpdateRouteState extends State<UpdateRoute> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        var updater = ref.watch(updateController);
        var update = ref.watch(updateProvider);

        update = update;

        if (update.command.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            lpShowAlertDialog(
              context,
              title: t.update_dialog_title,
              body: Column(
                children: [
                  NcBodyText(
                    kSetupType.canAutoUpdate ? t.update_dialog_helpNeeded : t.update_dialog_noAutoUpdate,
                    overflow: TextOverflow.visible,
                  ),
                  NcSpacing.large(),
                  LpSnippet(code: update.command),
                ],
              ),
            );
          });
        }

        // TODO: show error message if update failed

        // ! Testing only
        update = update.copyWith(updateAvailable: true, patchNotes: '''
# Tollere bacis

![Screenshot](https://projekte.tgm.ac.at/lb-planner/resources/example_cal.png)

## Vacuaque pulsant summa exploratis reppulit

Lorem markdownum esse maledictaque mentem bis iugulum et factum digiti iuvenale
agitur non mando! Fretum nec derecti frondes; gemitus quem, tollens sub iam
diriguit. Induta thalamos resistere anilem neque Tethys **es deos**: velamina
Phoebus dumque novercam. Castra praeterit bellum mihi diro igneus, Thaumantidos
crinem, fulvis thalamique.

- Fugit inludens nulla fugato caecae sanguine saepe
- Credere omni patulas avis exsurgo riguo spretis
- Vincta ullis quoque turba

Molli petit nuda eiaculatur in undas! Timori suis Centauros abductas videri. Nec
his aut esse Rhodopeius, vidit!

> Iovem ab posito et quantum campo nomina relinquent et quem *obiectat quid*
> boum circum. Annua [repetet artus](http://nisi.org/anima.html) praecordia ut
> fuit [Cnosiaci](http://tuncdempto.com/) sepulcro est cadit, et beatum sustinet
> prolis inducta ora idem minus nulla.

## Arma securae florente fossas

Primum spoliata satis. His unaque tutaeque et quaeris pater quo currere teneri.
Emicuit retinacula opta. Sex heros mira rursus fui viscere deieci, pecudis
venis.

1. Mentitis viribus crescendo torquet
2. Cum iurasse paludes iuvenalibus opemque
3. Reliquit hostem
4. Neci genu sinunt unus

Vere at fulmen verba quoque lustra duarum perdideris, comitant et colus: quam
iam inpia sociasque? Turbata cetera, fui petens, orbem animoque et trahit et
currere, virgineis. Furta celeremque relevare et formam loca dextra dis,
[luce](http://sola.org/comminus-retexi) mos procul iam nefas? Ignotissima amnem
vis diligit Venus, luctante, non aquas, qua hunc est membra, confusaque colorem
posses. Vocabitur resumptis orbem!

- Erat te laboris facta adiere sedes
- Sede novas bracchia memoratis alios
- Bella versis
- Me membra Romam contigit tacitaque huius

In pulvere saepe exanimesque fortisque bibulis vos obsedit, elementa aeterna
caerulus. Lumina Circaea illas, cum sub motus: excepit quam mandasset peremptam
pedum, non latet rursusque adspexit pars Salamis. Aduncos inmisit involvitur
plangore regna cupressus et thalami neque inculpata.

- [ ] test
- [x] test
''');

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * UpdateRoute.paddingFactor,
            vertical: MediaQuery.of(context).size.height * UpdateRoute.paddingFactor,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      NcVectorImage(code: kAppIcon, height: UpdateRoute.iconSize),
                      NcSpacing.small(),
                      NcTitleText(
                        t.update_patchNotes(update.latestVersionName),
                        fontSize: RouteTitle.titleSize,
                      ),
                    ],
                  ),
                  if (update.downloadStatus == DownloadStatus.idle)
                    LpButton(
                      onPressed: updater.upgrade,
                      text: t.update_btn,
                    ),
                  if (update.downloadStatus == DownloadStatus.downlaoding)
                    Row(
                      children: [
                        NcBodyText(
                          t.update_downloading(update.fileName, update.progress),
                        ),
                        NcSpacing.small(),
                        LpLoadingIndicator.circular(),
                      ],
                    ),
                  if (update.downloadStatus == DownloadStatus.installing) NcBodyText(t.update_installing),
                ],
              ),
              NcSpacing.large(),
              Expanded(
                child: Markdown(
                  data: update.patchNotes,
                  styleSheet: MarkdownStyleSheet.fromTheme(
                    Theme.of(context),
                  ).copyWith(
                    blockquoteDecoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(kRadius),
                    ),
                    a: TextStyle(color: accentColor),
                  ),
                  onTapLink: (text, href, title) {
                    if (href == null) return;

                    launchUrl(Uri.parse(href));
                  },
                  checkboxBuilder: (checked) => LpCheckbox(
                    value: checked,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
