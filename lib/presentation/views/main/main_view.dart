import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:mcs/core/resources/app_assets.dart';
import 'package:mcs/core/styles/ui_helper.dart';
import 'package:mcs/presentation/views/main/main_view.form.dart';
import 'package:mcs/presentation/views/main/main_view_model.dart';
import 'package:mcs/presentation/widgets/background_view.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mcs/core/styles/app_colors.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [FormTextField(name: 'domain')])
class MainView extends StatelessWidget with $MainView {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            const BackgroundView(),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeightPercentage(context, percentage: 0.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        verticalSpaceMedium,
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'MCS IP MONITORING SYSTEM',
                              textStyle: GoogleFonts.nunito(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        verticalSpaceRegular,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidthPercentage(
                                context,
                                percentage: 0.3,
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32.0),
                              height: 47.0,
                              color: Colors.white,
                              child: TextField(
                                controller: domainController,
                                focusNode: domainFocusNode,
                                style: GoogleFonts.nunito(
                                  fontSize: 16.0,
                                  color: kcBlackTwo,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your domain here',
                                  hintStyle: GoogleFonts.nunito(
                                    fontSize: 16.0,
                                    color: kcLiteText,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size.fromHeight(47.0),
                                shape: const RoundedRectangleBorder(),
                              ),
                              onPressed: model.fetchInfraDetails,
                              child: Text(
                                'CHECK',
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  model.infraDetails != null
                      ? Column(
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: screenWidthPercentage(context,
                                    percentage: 0.8),
                              ),
                              child: Column(
                                children: [
                                  verticalSpaceMedium,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: model.infraDetails!
                                        .getCardDataList()
                                        .map(
                                          (card) => Expanded(
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              margin: EdgeInsets.only(
                                                right: card.title !=
                                                        'CLOUD PROVIDER'
                                                    ? 48.0
                                                    : 0,
                                              ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                decoration: BoxDecoration(
                                                  color: card.color,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    8.0,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        verticalSpaceMedium,
                                                        Text(
                                                          card.value,
                                                          style: GoogleFonts
                                                              .nunito(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 30.0,
                                                            color:
                                                                card.textColor,
                                                          ),
                                                        ),
                                                        verticalSpaceRegular,
                                                        Text(
                                                          card.title,
                                                          style: GoogleFonts
                                                              .nunito(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20.0,
                                                            color:
                                                                card.textColor,
                                                          ),
                                                        ),
                                                        verticalSpaceMedium,
                                                      ],
                                                    ),
                                                    Image.asset(
                                                      card.icon,
                                                      color: card.textColor,
                                                      width: 60.0,
                                                      height: 60.0,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  verticalSpaceMedium,
                                  Card(
                                    child: Table(
                                      // textDirection: TextDirection.rtl,
                                      defaultVerticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      border: TableBorder.all(
                                          width: 1.0, color: kcPaleGrey),
                                      children: [
                                        TableRow(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Text(
                                                'IP ADDRESS',
                                                style: GoogleFonts.nunito(
                                                  fontSize: 14.0,
                                                  color: kcWhite,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'RUNNING SERVICES',
                                                style: GoogleFonts.nunito(
                                                  fontSize: 14.0,
                                                  color: kcWhite,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'OPEN PORTS',
                                                style: GoogleFonts.nunito(
                                                  fontSize: 14.0,
                                                  color: kcWhite,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'SERVER LOCATION',
                                                style: GoogleFonts.nunito(
                                                  fontSize: 14.0,
                                                  color: kcWhite,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'CLOUD PROVIDER',
                                                style: GoogleFonts.nunito(
                                                  fontSize: 14.0,
                                                  color: kcWhite,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'STATUS',
                                                style: GoogleFonts.nunito(
                                                  fontSize: 14.0,
                                                  color: kcWhite,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                          decoration: const BoxDecoration(
                                            color: kcGreenBlue,
                                          ),
                                        ),
                                        ...model.infraDetails!
                                            .getDataList()
                                            .map(
                                          (data) {
                                            return TableRow(
                                              children: [
                                                Container(
                                                  alignment: Alignment.center,
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    data.ipAddress,
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.nunito(
                                                      fontSize: 14.0,
                                                      color: kcBlackTwo,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Wrap(
                                                    runSpacing: 8.0,
                                                    spacing: 8.0,
                                                    children: data.services
                                                        .map(
                                                          (service) =>
                                                              Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4.0),
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color:
                                                                    kcPaleOrange,
                                                                width: 0.5,
                                                              ),
                                                              color: kcWhite,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                2.0,
                                                              ),
                                                            ),
                                                            child: Text(
                                                              service,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: GoogleFonts
                                                                  .nunito(
                                                                fontSize: 14.0,
                                                                color:
                                                                    kcBlackTwo,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                        .toList(),
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Wrap(
                                                    runSpacing: 8.0,
                                                    spacing: 8.0,
                                                    children: data.openPorts
                                                        .map(
                                                          (port) => Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4.0),
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color:
                                                                    kcPaleOrange,
                                                                width: 0.5,
                                                              ),
                                                              color: kcWhite,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                2.0,
                                                              ),
                                                            ),
                                                            child: Text(
                                                              '$port',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: GoogleFonts
                                                                  .nunito(
                                                                fontSize: 14.0,
                                                                color:
                                                                    kcBlackTwo,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                        .toList(),
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    data.location,
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.nunito(
                                                      fontSize: 14.0,
                                                      color: kcBlackTwo,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    data.provider,
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.nunito(
                                                      fontSize: 14.0,
                                                      color: kcBlackTwo,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: data.isBlackListed
                                                          ? Colors.red
                                                          : Colors.green,
                                                      borderRadius: BorderRadius.circular(4.0)
                                                    ),
                                                    padding:
                                                        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                                    child: Text(
                                                      data.isBlackListed
                                                          ? 'BLACKLISTED'
                                                          : 'NOT BLACKLISTED',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.nunito(
                                                        fontSize: 14.0,
                                                        color: kcWhite,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  verticalSpaceMedium,
                                ],
                              ),
                            )
                          ],
                        )
                      : model.isBusy
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : const SizedBox.shrink(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: ExtendedImage.asset(
                R.ASSETS_IMAGES_MCS_LOGO_PNG,
                height: 80.0,
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => MainViewModel(),
      onModelReady: (model) {
        listenToFormUpdated(model);
      },
    );
  }
}
