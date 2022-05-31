import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mcs/core/resources/app_assets.dart';
import 'package:mcs/core/styles/app_colors.dart';
import 'package:mcs/core/styles/ui_helper.dart';
import 'package:mcs/presentation/views/splash/splash_view_model.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onModelReady: (model) => model.fetchInfraDetails(),
      builder: (context, model, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    Container(
                      height: screenHeightPercentage(context, percentage: 0.35),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: ExtendedAssetImageProvider(
                            R.ASSETS_IMAGES_BG_JPG,
                          ),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'MCS IP MONITORING SYSTEM',
                            style: GoogleFonts.nunito(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          verticalSpaceRegular,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: screenWidthPercentage(context,
                                    percentage: 0.3),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0),
                                height: 47.0,
                                color: Colors.white,
                                child: TextField(
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
                                onPressed: () {},
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
                  ],
                ),
              ),
              Positioned(
                top: screenHeightPercentage(context, percentage: 0.29),
                left: screenWidthPercentage(context, percentage: 0.05),
                right: screenWidthPercentage(context, percentage: 0.05),
                bottom: 0,
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: screenWidthPercentage(context, percentage: 0.6),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      child: Column(
                        children: [
                          if (model.isBusy)
                            Card(
                              color: Colors.white,
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: screenWidthPercentage(
                                    context,
                                    percentage: 0.8,
                                  ),
                                ),
                                height: 200.0,
                                alignment: Alignment.center,
                                child: const SizedBox(
                                  height: 50.0,
                                  width: 50.0,
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ),
                          if (model.infraDetails != null &&
                              model.infraDetails!.isNotEmpty)
                            Card(
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: screenWidthPercentage(
                                    context,
                                    percentage: 0.8,
                                  ),
                                ),
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Domain Analysis',
                                          style: GoogleFonts.nunito(
                                            fontSize: 20.0,
                                            color: kcLiteText,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        Text(
                                          'brandsek.com',
                                          style: GoogleFonts.nunito(
                                            fontSize: 20.0,
                                            color: kcLiteText,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        )
                                      ],
                                    ),
                                    verticalSpaceRegular,
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        'SL No.',
                                        'IP Address',
                                        'Location'
                                      ]
                                          .map(
                                            (header) => Expanded(
                                          child: Container(
                                            padding:
                                            const EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: kcOffWhite,
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Text(
                                              header,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.nunito(
                                                fontWeight: FontWeight.bold,
                                                color: kcBlack,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                          .toList(),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        final infraData =
                                        model.infraDetails![index];
                                        return Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: kcOffWhite,
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: Text(
                                                  '${index + 1}',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.nunito(
                                                    fontWeight: FontWeight.bold,
                                                    color: kcBlack,
                                                    fontSize: 18.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: kcOffWhite,
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: Text(
                                                  '${infraData.ip}',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.nunito(
                                                    fontWeight: FontWeight.bold,
                                                    color: kcBlack,
                                                    fontSize: 18.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: kcOffWhite,
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: Text(
                                                  '${infraData.location?.city ?? ''}${infraData.location?.city != null ? ', ' : ''} ${infraData.location!.country}',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.nunito(
                                                    fontWeight: FontWeight.bold,
                                                    color: kcBlack,
                                                    fontSize: 18.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                      itemCount: model.infraDetails?.length,
                                    )
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
