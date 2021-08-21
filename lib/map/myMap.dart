import 'package:flutter/material.dart';
import 'package:location_flutter/map/map_screen.dart';
import 'package:location_flutter/services/geo_locator_service.dart';
import 'package:location_flutter/utils/constant.dart';
import 'package:provider/provider.dart';

class MyHomeMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomGoogleMap(),
          CustomHeader(),
          DraggableScrollableSheet(
            initialChildSize: 0.30,
            minChildSize: 0.15,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: CustomScrollViewContent(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomGoogleMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[50],
      child: Center(child: MapScreen(),)
    );
  }
}

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomSearchContainer(),
        CustomSearchCategories(),
      ],
    );
  }
}

class CustomSearchContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 8),
      child: Container(
        height: 50,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
        child: Row(
          children: <Widget>[
            CustomTextField(),
            Icon(Icons.mic),
            SizedBox(width: 16),
            CustomUserAvatar(),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        maxLines: 1,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          hintText: "Search here",
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class CustomUserAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(color: Colors.grey[500],
      image:DecorationImage(image: NetworkImage(AppConstant.natImage),fit: BoxFit.cover),
       borderRadius: BorderRadius.circular(16)),
    );
  }
}

class CustomSearchCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SizedBox(width: 16),
          CustomCategoryChip(Icons.fastfood, "Takeout"),
          SizedBox(width: 12),
          CustomCategoryChip(Icons.directions_bike, "Delivery"),
          SizedBox(width: 12),
          CustomCategoryChip(Icons.local_gas_station, "Gas"),
          SizedBox(width: 12),
          CustomCategoryChip(Icons.shopping_cart, "Groceries"),
          SizedBox(width: 12),
          CustomCategoryChip(Icons.local_pharmacy, "Pharmacies"),
          SizedBox(width: 12),
        ],
      ),
    );
  }
}

class CustomCategoryChip extends StatelessWidget {
  final IconData iconData;
  final String title;

  CustomCategoryChip(this.iconData, this.title);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Row(
        children: <Widget>[Icon(iconData, size: 16), SizedBox(width: 8), Text(title)],
      ),
      backgroundColor: Colors.grey[50],
    );
  }
}

class CustomScrollViewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      margin: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: CustomInnerContent(),
      ),
    );
  }
}

class CustomInnerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 12),
        CustomDraggingHandle(),
        SizedBox(height: 16),
        CustomExplore(),
        SizedBox(height: 16),
        CustomHorizontallyScrollingRestaurants(),
        SizedBox(height: 24),
        CustomFeaturedListsText(),
        SizedBox(height: 16),
        CustomFeaturedItemsGrid(),
        SizedBox(height: 24),
        CustomRecentPhotosText(),
        SizedBox(height: 16),
        CustomRecentPhotoLarge(),
        SizedBox(height: 12),
        CustomRecentPhotosSmall(),
        SizedBox(height: 16),
      ],
    );
  }
}

class CustomDraggingHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 30,
      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
    );
  }
}

class CustomExplore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final init= Provider.of<GeolocatorService>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Explore", style: TextStyle(fontSize: 22, color: Colors.black45)),
        SizedBox(width: 8),
        Container(
          height: 24,
          width: 24,
          child: Icon(Icons.arrow_forward_ios, size: 12, color: Colors.black54),
          decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
        ),
      ],
    );
  }
}

class CustomHorizontallyScrollingRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomRestaurantCategory(),
            SizedBox(width: 12),
            CustomRestaurantCategory(),
            SizedBox(width: 12),
            CustomRestaurantCategory(),
            SizedBox(width: 12),
            CustomRestaurantCategory(),
            SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}

class CustomFeaturedListsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      //only to left align the text
      child: Row(
        children: <Widget>[Text("Featured Lists", style: TextStyle(fontSize: 14))],
      ),
    );
  }
}

class CustomFeaturedItemsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        shrinkWrap: true,
        children: <Widget>[
          CustomFeaturedItem(),
          CustomFeaturedItem(),
          CustomFeaturedItem(),
          CustomFeaturedItem(),
        ],
      ),
    );
  }
}

class CustomRecentPhotosText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: <Widget>[
          Text("Recent Photos", style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class CustomRecentPhotoLarge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomFeaturedItem(),
    );
  }
}

class CustomRecentPhotosSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomFeaturedItemsGrid();
  }
}

class CustomRestaurantCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(image: NetworkImage(AppConstant.resimage),fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class CustomFeaturedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[500],
        image:DecorationImage(image: NetworkImage(AppConstant.resimage),fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}