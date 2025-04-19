import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../core/config/app_icons.dart';
import '../widgets/page_template.dart';
import '../../core/config/app_colors.dart';
import '../widgets/recycle_center_bs.dart';
import '../widgets/svg_icon.dart';

class BinLocatorPage extends StatelessWidget {
  const BinLocatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageTemplate(
      title: 'Bin Locator',
      body: _BinLocatorBody(),
    );
  }
}

class _BinLocatorBody extends StatefulWidget {
  const _BinLocatorBody();

  @override
  State<_BinLocatorBody> createState() => _BinLocatorBodyState();
}

class _BinLocatorBodyState extends State<_BinLocatorBody> {
  final Completer<GoogleMapController> _controller = Completer();
  bool permissionGranted = false;
  bool permissionChecked = false;

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(41.311081, 69.240562),
    zoom: 12,
  );

  static const CameraPosition _focusLocation = CameraPosition(
    bearing: 192.8,
    target: LatLng(41.3275, 69.2817),
    tilt: 50,
    zoom: 16,
  );

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  Future<void> _checkPermission() async {
    var status = await Permission.location.request();
    setState(() {
      permissionGranted = status.isGranted;
      permissionChecked = true;
    });
  }

  Future<void> _goToNearest() async {
    final controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_focusLocation));
  }

  @override
  Widget build(BuildContext context) {
    if (!permissionChecked) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!permissionGranted) {
      return const Center(
        child: Text(
          "Location permission is not granted.\nPlease enable it in settings.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.red, fontSize: 16),
        ),
      );
    }

    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _initialPosition,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          onMapCreated: (controller) {
            _controller.complete(controller);
          },
        ),
        Positioned(
          top: 20,
          left: 16,
          right: 16,
          child: Row(
            children: [
              Expanded(
                child: CupertinoTextField(
                  style: const TextStyle(fontSize: 22),
                  placeholder: "Tashkent",
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.lightGreen),
                    borderRadius: BorderRadius.circular(33),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.all(10),
                child: const Icon(Icons.search, color: Colors.white),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 24,
          left: 24,
          right: 24,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightGreen,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: _goToNearest,
                child: const Text(
                  "Locate Nearest",
                  style: TextStyle(
                    fontSize: 26,
                    color: AppColors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => const RecycleCentersBottomSheet(),
                  );
                },
                child: SvgPicture.asset(
                  "assets/icons/recycle_center.svg",
                  height: 44,
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
