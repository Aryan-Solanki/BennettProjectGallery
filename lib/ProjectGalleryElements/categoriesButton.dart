import 'package:flutter/material.dart';

class CategoriesButton extends StatefulWidget {
  final String categoryName;
  final int categoryQuantity;
  const CategoriesButton({
    this.categoryName,
    this.categoryQuantity,
  });

  @override
  _CategoriesButtonState createState() => _CategoriesButtonState();
}

bool hover = false;

class _CategoriesButtonState extends State<CategoriesButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onHover: (x) {
          if (x) {
            setState(() {
              hover = true;
            });
          } else {
            setState(() {
              hover = false;
            });
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          primary: Colors.white,
          padding: EdgeInsets.all(0.0),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.categoryName,
              style: TextStyle(
                  fontSize: 15,
                  color: hover == true ? Colors.green : Colors.black87,
                  fontFamily: "Metrisch-Bold"),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: 35,
              height: 25,
              decoration: BoxDecoration(
                border: Border.all(
                    color: hover == true ? Color(0xff3224e9) : Colors.white),
                borderRadius: BorderRadius.circular(5),
                color: hover == true ? Colors.white : Color(0xff3224e9),
              ),
              child: Center(
                child: Text(
                  widget.categoryQuantity.toString(),
                  style: TextStyle(
                      fontSize: 13,
                      color: hover == true ? Color(0xff3224e9) : Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
