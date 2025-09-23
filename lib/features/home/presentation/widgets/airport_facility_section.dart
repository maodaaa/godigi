// The main screen widget
import 'package:flutter/material.dart';
import 'package:godigi/app/app.dart';
import 'package:godigi/core/core.dart';
import 'package:godigi/data/data.dart';

class AirportFacilitySection extends StatelessWidget {
  const AirportFacilitySection({
    super.key,
    required this.facilities,
  });

  final List<AirportFacilityModel> facilities;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              StringConstants.airportFacility,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColor.neutral90,
                fontFamily: AppFontFamily.inter,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                StringConstants.seeAll,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 290,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: facilities.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: AppSpacing.space2),
                child: FacilityCard(facility: facilities[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}

class FacilityCard extends StatelessWidget {
  final AirportFacilityModel facility;

  const FacilityCard({super.key, required this.facility});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Container(
          clipBehavior: Clip.hardEdge,
          height: constraint.maxHeight,
          width: 250,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSpacing.space4),
            border: Border.all(color: AppColor.neutral30),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Image.network(
                  facility.imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,

                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 150,
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(Icons.error_outline, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
              Positioned.fill(
                top: constraint.maxHeight / 2.1,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: constraint.maxHeight / 2,
                  width: constraint.maxWidth,
                  padding: const EdgeInsets.all(AppSpacing.space2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppSpacing.space4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        facility.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.neutral80,
                          fontFamily: AppFontFamily.inter,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${facility.activeCount} Active',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColor.secondary50,
                          fontFamily: AppFontFamily.inter,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 6.0,
                        children: facility.tags.map((tag) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.space2,
                              vertical: AppSpacing.space1,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.neutral80,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text(
                              tag,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontFamily: AppFontFamily.inter,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
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
