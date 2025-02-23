import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:brooms_n_belans/routes.dart';

class AbelCustom extends StatefulWidget {
  final text;
  final size;
  final color;
  final fontWeight;
  const AbelCustom(
      {super.key,
      @required this.text,
      @required this.size,
      this.color,
      this.fontWeight});

  @override
  State<AbelCustom> createState() => _AbelCustomState();
}

class _AbelCustomState extends State<AbelCustom> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: GoogleFonts.abel(
        fontSize: widget.size,
        color: widget.color ?? Colors.black,
        fontWeight: widget.fontWeight ?? FontWeight.normal,
      ),
    );
  }
}

class TextForm extends StatelessWidget {
  final heading;
  final width;
  final maxLines;
  final hintText;
  const TextForm(this.heading, this.width, this.maxLines, this.hintText,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AbelCustom(text: heading, size: 16.0),
        const SizedBox(
          height: 5.0,
        ),
        SizedBox(
          width: width,
          child: TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(10),
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
            ],
            maxLines: maxLines,
            decoration: InputDecoration(
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.tealAccent,
                  width: 2.0,
                ),
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(fontSize: 14.0),
            ),
            validator: (text) {
              if (RegExp("\\bsoham\\b", caseSensitive: false)
                  .hasMatch(text.toString())) {
                return "Match Found";
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Caption;
  final route;

  const RoundIconButton(
      {super.key,
      required this.icon,
      required this.Caption,
      @required this.route});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(route);
          },
          shape: const CircleBorder(),
          child: Icon(icon),
        ),
        const SizedBox(height: 8.0),
        Text(Caption),
      ],
    );
  }
}

class Abutton extends StatefulWidget {
  final title;
  final route;
  const Abutton({super.key, @required this.title, @required this.route});

  @override
  State<Abutton> createState() => _AbuttonState();
}

class _AbuttonState extends State<Abutton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF8A3622), // Button color matching the image
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color: Colors.white),
        ),
        padding:
            EdgeInsets.symmetric(vertical: 16.0), // Adjust padding for height
      ),
      child: Text(
        widget.title,
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
