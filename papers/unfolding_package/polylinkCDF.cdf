(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 9.0' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc. For additional information concerning CDF     *)
(*  licensing and redistribution see:                                    *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1063,         20]
NotebookDataLength[    294441,       6693]
NotebookOptionsPosition[    193097,       4334]
NotebookOutlinePosition[    288990,       6486]
CellTagsIndexPosition[    288842,       6479]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[TextData[{
 "The ",
 Cell[BoxData[
  FormBox[
   SuperscriptBox["Mathematica", "\[RegisteredTrademark]"], TraditionalForm]]],
 " Journal"
}], "OnlineHeader",
 CellTags->"OnlineHeader"],

Cell[CellGroupData[{

Cell["PolyLink", "Title"],

Cell["A package for unfolding polyhedra in Mathematica.", "Subtitle"],

Cell["\<\
Christopher Conlon
Richard Pham
Kyle Sykes
Erin Chambers\
\>", "Author"],

Cell[TextData[{
 "PolyLink is a library in C# that allows polyhedra to be folded (and \
unfolded) from within ",
 StyleBox["Mathematica.",
  FontSlant->"Italic"],
 " By storing its geometry as a doubly connected edge list, PolyLink enables \
more intelligent and intuitive operations to be performed on polyhedra, such \
as unfolding, intersection testing, and shortest paths computation. ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " provides an enviroment for sophisticated mathematical computation, and C# \
simplifies business logic, resulting in a library that can be extended to \
perform almost any type of geometry computation. Our goal is a more intuitive \
tool for testing unfoldings on various classes of polyhedra."
}], "Abstract"],

Cell[CellGroupData[{

Cell["Introduction", "Section"],

Cell[TextData[{
 "The area of folding and unfolding polyhedra is receiving considerable \
attention in the computational geometry community.  Given a polyhedron P, an ",
 StyleBox["unfolding",
  FontSlant->"Italic"],
 " of P is a cutting of the surface of P such that the surface may be \
unfolded into the plane as a single, simple, non overlapping polygon.  An ",
 StyleBox["edge unfolding",
  FontSlant->"Italic"],
 " is an unfolding where the cuts are restricted to the edges of P, while a \
",
 StyleBox["general unfolding",
  FontSlant->"Italic"],
 " allows cuts anywhere on the surface of P.  There are many questions we can \
ask about polyhedral unfolding.  Does every polyhedron have an edge \
unfolding?  If P is nonconvex, the answer is no [5].  Even if P is convex, \
there is no general algorithm to produce an edge unfolding of P.  However, no \
one has produced a convex polyhedron which does not have an edge unfolding, \
so there is hope that such an algorithm may yet be discovered.  If we relax \
the cutting conditions and look at general unfoldings, then there exist \
several unfolding algorithms to produce a general unfolding, such as star \
unfolding, source unfolding, and quasigeodesic unfolding; see the book by \
Demaine and O\[CloseCurlyQuote]Rourke for a more thorough overview of these \
related algorithms [4].\n\nThe goal of this package is to provide a tool set \
for easy investigation of folding and unfolding problems.  Various work on \
polyhedra and polygons has already been implemented, particularly in the \
extensive library CGAL, which implements a wide variety of geometric \
algorithms in C.  However, our goal was a simpler and more intuitive tool \
that researchers in the specific area of folding could use when pursuing \
investigations into various types of unfoldings on difference classes of \
polygons and polyhedra.  Given ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 "\[CloseCurlyQuote]s intuitive interface, extensive graphics options, and \
history of use in this area, it seemed an optimal starting tool.  To our \
knowledge, the only comparably easy tool to use is Google Sketchup, and that \
particular tool has significant drawbacks in its use for more complex \
polyhedra.\n\nIn particular, our motivation for PolyLink was the lack of \
tools and software to easily visualize and manipulate polyhedra in precise \
mathematical ways. As previously mentioned, although there do exist programs \
related to unfolding and refolding, these either only deal with specific \
situations or lack a graphical user interface, flexible types, and the \
ability to quickly compose operations.  When it comes to experimenting with \
foldings and unfoldings, the computational geometry world has yet to produce \
a digital replacement for scissors and glue, and as a result much work in \
this area often starts with paper models, which are highly prone to error."
}], "Text"],

Cell["PolyLink was made with four primary design goals: ", "Text",
 CellID->799345357],

Cell[CellGroupData[{

Cell[TextData[StyleBox["Let users create scripts, to allow for quick creation \
and evaluation.", "Subitem"]], "Item",
 CellID->2087203114],

Cell[TextData[StyleBox["Allow the user to easily create and view 3D graphical \
representations of the objects, whenever they want.", "Subitem"]], "Item",
 CellID->945852015],

Cell[TextData[StyleBox["Give the user polyhedral objects which have some \
knowledge of their own properties, and the ability to use them.", \
"Subitem"]], "Item",
 CellID->987435173],

Cell[TextData[StyleBox["Allow future developers to expand it to a large \
library of useful functions.", "Subitem"]], "Item",
 CellID->778041850]
}, Open  ]],

Cell["These goals were met with the following design decisions:", "Text",
 CellID->515607011],

Cell[CellGroupData[{

Cell[TextData[{
 "Use ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " as the user interface."
}], "Item",
 CellID->1670847904],

Cell[TextData[{
 "Create functions and a unified interface to give ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " everything it needs to know to create powerful 3D visualizations."
}], "Item",
 CellID->1274786515],

Cell["\<\
Model polyhedra as Doubly-Connected Edge Lists between references to points \
in 3D space, the standard data structure for these types of problems (add \
citation to paper on this data structure).\
\>", "Item",
 CellID->142640034],

Cell["\<\
Write library functions in C# which allows for fast development and debugging.\
\>", "Item",
 CellID->884044482]
}, Open  ]],

Cell[TextData[{
 "PolyLink uses ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " and C#/.NET in tandem, because the each language and environment make \
different goals possible. ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " allows scripting and easy 3D graphics. .NET makes it easy to model the \
relationships between the components of a polyhedron, and allows a function \
library to be more structured and organized.\n"
}], "Text",
 CellID->710518232]
}, Open  ]],

Cell[CellGroupData[{

Cell["An overview of using the package", "Section"],

Cell[TextData[{
 "To illustrate what PolyLink can do, we give examples of how to defining \
polyhedra and produce an unfolding of a dodecahedron.  The package is freely \
available",
 ButtonBox[Cell[TextData[StyleBox[ButtonBox["1"],
  FontVariations->{"CompatibilityType"->"Superscript"}]], "Citation",
  Editable->False,
  TaggingRules->{NoteData -> RowBox[{
       RowBox[{"Available", " ", "at", " ", 
         RowBox[{"http", ":"}]}], "//", 
       RowBox[{
         RowBox[{
           RowBox[{
             RowBox[{
               RowBox[{"mathcs", ".", "slu", ".", "edu"}], "/", 
               RowBox[{"~", "chambers"}]}], "/", "papers"}], "/", 
           "unfolding_package"}], "/", 
         RowBox[{"index", ".", "html", "."}]}]}]}],
  BaseStyle->"Hyperlink",
  ButtonData->"0000545E"],
 " but requires a C#/.NET environment to be supported.  (For Mac users, Mono \
is one such environment which worked successfully in development and later \
testing.)  We begin by loading the package, and running an initialization \
function which initializes the .NET framework.  "
}], "Text",
 CellID->1336417947],

Cell[BoxData[{
 RowBox[{"<<", "PolyLink`"}], "\[IndentingNewLine]", 
 RowBox[{"Initialize", "[", "]"}]}], "Input",
 CellID->936329127],

Cell[TextData[{
 "One of the biggest goals for this project was to be able to define \
polyhedra and unfold them with minimal effort and visualize the unfoldings.  \
In general, we can call various functions on graphical objects.  The usual \
format to call a function on an object is ",
 StyleBox["object@function",
  FontFamily->"Prestige Elite Std Bold"],
 ".  For example, we can use the built in polyhedra definitions to define a \
polyhedron utilizing the data structure we have implemented.  Here, we define \
a dodecahedron and display it using the standard graphics display by calling ",
 StyleBox["Graphics",
  FontFamily->"Prestige Elite Std Bold"],
 " on the polyhedron.  ",
 StyleBox["PolyIO`",
  FontFamily->"Prestige Elite Std Bold"],
 " is used to pull information from ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 "\[CloseCurlyQuote]s built in structures and convert to the data structure \
we use."
}], "Text",
 CellID->857793265],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"cube", " ", "=", " ", 
   RowBox[{"PolyIO`PolyFromName", "[", "\"\<Cube\>\"", "]"}]}], ";"}], "\n", 
 RowBox[{"Graphics3D", "[", 
  RowBox[{"cube", "@", "Graphics"}], "]"}]}], "Input",
 CellID->327947408],

Cell[BoxData[
 Graphics3DBox[{
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[1, 2]}, {
       Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}, {
       Rational[1, 2], Rational[-1, 2], Rational[1, 2]}}, {{0.5, 0.5, 
      0.5}, {-0.5, 0.5, 0.5}, {-0.5, -0.5, 0.5}, {0.5, -0.5, 0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
       Rational[1, 2], Rational[-1, 2], Rational[1, 2]}, {
       Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[1, 2], Rational[-1, 2]}}, {{0.5, 0.5, 0.5}, {
      0.5, -0.5, 0.5}, {0.5, -0.5, -0.5}, {0.5, 0.5, -0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
       Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[1, 2]}}, {{0.5, 0.5, 0.5}, {
      0.5, 0.5, -0.5}, {-0.5, 0.5, -0.5}, {-0.5, 0.5, 0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[-1, 2], Rational[1, 2], Rational[1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}}, {{-0.5, 0.5, 
      0.5}, {-0.5, 0.5, -0.5}, {-0.5, -0.5, -0.5}, {-0.5, -0.5, 0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[-1, 2], 
        Rational[-1, 2]}}, {{-0.5, -0.5, -0.5}, {-0.5, 0.5, -0.5}, {0.5, 
      0.5, -0.5}, {0.5, -0.5, -0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}, {
       Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[-1, 2], Rational[1, 2]}}, {{-0.5, -0.5, 
      0.5}, {-0.5, -0.5, -0.5}, {0.5, -0.5, -0.5}, {0.5, -0.5, 
      0.5}}]]}}]], "Output",
 CellID->1405669908]
}, Open  ]],

Cell[TextData[{
 "Every edge of a polyhedron in PolyLink is represented by two half-edges, \
which belong to one of the two faces bordering the edge.  To experiment with \
unfoldings, it becomes necessary to determine which face and which ",
 "half-edge",
 " of that face you wish to reference.  Geometry objects such as Half-Edges \
can be easily selected using indices. Use ",
 StyleBox["Polyhedron@AllLabels",
  FontFamily->"Prestige Elite Std Bold"],
 " to get the index labels, then use ",
 StyleBox["Polyhedron@PickHalfEdge[facetNumber,halfEdgeNumber]",
  FontFamily->"Prestige Elite Std Bold"],
 " with the indices."
}], "Text",
 CellID->197286588],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"cube", "=", 
   RowBox[{"PolyIO`PolyFromName", "[", "\"\<Cube\>\"", "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Graphics3D", "[", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"cube", "@", "Graphics"}], ",", " ", 
    RowBox[{"cube", "@", "AllLabels"}]}], "}"}], "]"}]}], "Input",
 CellID->1627614049],

Cell[BoxData[
 Graphics3DBox[{{
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[1, 2]}}, {{0.5, 0.5, 
       0.5}, {-0.5, 0.5, 0.5}, {-0.5, -0.5, 0.5}, {0.5, -0.5, 0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[1, 2], Rational[-1, 2]}}, {{0.5, 0.5, 0.5}, {
       0.5, -0.5, 0.5}, {0.5, -0.5, -0.5}, {0.5, 0.5, -0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[1, 2]}}, {{0.5, 0.5, 0.5}, {
       0.5, 0.5, -0.5}, {-0.5, 0.5, -0.5}, {-0.5, 0.5, 0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[-1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}}, {{-0.5, 0.5, 
       0.5}, {-0.5, 0.5, -0.5}, {-0.5, -0.5, -0.5}, {-0.5, -0.5, 0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[-1, 2], 
         Rational[-1, 2]}}, {{-0.5, -0.5, -0.5}, {-0.5, 0.5, -0.5}, {0.5, 
       0.5, -0.5}, {0.5, -0.5, -0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[1, 2]}}, {{-0.5, -0.5, 
       0.5}, {-0.5, -0.5, -0.5}, {0.5, -0.5, -0.5}, {0.5, -0.5, 0.5}}]]}}, {{
     Inset3DBox["1", {0., 0., 0.6}], {Inset3DBox["1", {0., 0.5, 0.55},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["2", {-0.5, 0., 0.55},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["3", {0., -0.5, 0.55},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["4", {0.5, 0., 0.55},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}]}}, {
     Inset3DBox["2", {0.6, 0., 0.}], {Inset3DBox["1", {0.55, 0., 0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["2", {0.55, -0.5, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["3", {0.55, 0., -0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["4", {0.55, 0.5, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}]}}, {
     Inset3DBox["3", {0., 0.6, 0.}], {Inset3DBox["1", {0.5, 0.55, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["2", {0., 0.55, -0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["3", {-0.5, 0.55, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["4", {0., 0.55, 0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}]}}, {
     Inset3DBox["4", {-0.6, 0., 0.}], {Inset3DBox["1", {-0.55, 0.5, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["2", {-0.55, 0., -0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["3", {-0.55, -0.5, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["4", {-0.55, 0., 0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}]}}, {
     Inset3DBox["5", {0., 0., -0.6}], {Inset3DBox["1", {-0.5, 0., -0.55},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["2", {0., 0.5, -0.55},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["3", {0.5, 0., -0.55},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["4", {0., -0.5, -0.55},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}]}}, {
     Inset3DBox["6", {0., -0.6, 0.}], {Inset3DBox["1", {-0.5, -0.55, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["2", {0., -0.55, -0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["3", {0.5, -0.55, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["4", {0., -0.55, 0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}]}}}},
  AutomaticImageSize->True,
  ImageSize->{350.4230882494786, 369.1582551907135},
  ViewPoint->{-1.960299039098981, 2.494136411533423, 1.1775021180324021`},
  ViewVertical->{0.004546482659172044, 
   0.9438047211596302, -0.33047235559456767`}]], "Output",
 CellID->626543109]
}, Open  ]],

Cell[TextData[{
 "To unfold a face, we must pick which ",
 "half-edge",
 " of that face to unfold over by calling @",
 StyleBox["PickHalfEdge[face,halfedge]",
  FontFamily->"Prestige Elite Std Bold"],
 " on a polyhedron.  For the labeling of the cube above, we use halfedge 3 of \
face 1."
}], "Text",
 CellID->765747173],

Cell[BoxData[{
 RowBox[{
  RowBox[{"cube", " ", "=", " ", 
   RowBox[{"PolyIO`PolyFromName", "[", "\"\<Cube\>\"", "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"halfEdge", "=", 
   RowBox[{"cube", "@", 
    RowBox[{"PickHalfEdge", "[", 
     RowBox[{"1", ",", "3"}], "]"}]}]}], ";"}]}], "Input",
 CellID->1693894068],

Cell[TextData[{
 "To unfold a face over one of it\[CloseCurlyQuote]s halfedges, you call the \
@",
 StyleBox["Unfold[]",
  FontFamily->"Prestige Elite Std Bold"],
 " function on that half-edge."
}], "Text",
 CellID->1004999003],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"halfEdge", "@", 
  RowBox[{"Unfold", "[", "]"}]}], "\[IndentingNewLine]", 
 RowBox[{"Graphics3D", "[", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"cube", "@", "Graphics"}], ",", 
    RowBox[{"cube", "@", "AllLabels"}]}], "}"}], "]"}]}], "Input",
 CellID->2088320435],

Cell[BoxData[
 Graphics3DBox[{{
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[1, 2], Rational[-1, 2], Rational[3, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[3, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[1, 2]}}, {{0.5, -0.5, 
       1.5}, {-0.5, -0.5, 1.5}, {-0.5, -0.5, 0.5}, {0.5, -0.5, 0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[1, 2], Rational[-1, 2]}}, {{0.5, 0.5, 0.5}, {
       0.5, -0.5, 0.5}, {0.5, -0.5, -0.5}, {0.5, 0.5, -0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[1, 2]}}, {{0.5, 0.5, 0.5}, {
       0.5, 0.5, -0.5}, {-0.5, 0.5, -0.5}, {-0.5, 0.5, 0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[-1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}}, {{-0.5, 0.5, 
       0.5}, {-0.5, 0.5, -0.5}, {-0.5, -0.5, -0.5}, {-0.5, -0.5, 0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[-1, 2], 
         Rational[-1, 2]}}, {{-0.5, -0.5, -0.5}, {-0.5, 0.5, -0.5}, {0.5, 
       0.5, -0.5}, {0.5, -0.5, -0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[1, 2]}}, {{-0.5, -0.5, 
       0.5}, {-0.5, -0.5, -0.5}, {0.5, -0.5, -0.5}, {0.5, -0.5, 0.5}}]]}}, {{
     Inset3DBox["1", {0., -0.6, 1.}], {Inset3DBox["1", {0., -0.55, 1.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["2", {-0.5, -0.55, 1.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["3", {0., -0.55, 0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["4", {0.5, -0.55, 1.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}]}}, {
     Inset3DBox["2", {0.6, 0., 0.}], {Inset3DBox["1", {0.55, 0., 0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["2", {0.55, -0.5, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["3", {0.55, 0., -0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["4", {0.55, 0.5, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}]}}, {
     Inset3DBox["3", {0., 0.6, 0.}], {Inset3DBox["1", {0.5, 0.55, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["2", {0., 0.55, -0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["3", {-0.5, 0.55, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["4", {0., 0.55, 0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}]}}, {
     Inset3DBox["4", {-0.6, 0., 0.}], {Inset3DBox["1", {-0.55, 0.5, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["2", {-0.55, 0., -0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["3", {-0.55, -0.5, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["4", {-0.55, 0., 0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}]}}, {
     Inset3DBox["5", {0., 0., -0.6}], {Inset3DBox["1", {-0.5, 0., -0.55},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["2", {0., 0.5, -0.55},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["3", {0.5, 0., -0.55},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["4", {0., -0.5, -0.55},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}]}}, {
     Inset3DBox["6", {0., -0.6, 0.}], {Inset3DBox["1", {-0.5, -0.55, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["2", {0., -0.55, -0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["3", {0.5, -0.55, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["4", {0., -0.55, 0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}]}}}},
  AutomaticImageSize->True,
  ImageSize->{366.84860316369424`, 390.20565544264053`},
  ViewPoint->{2.2944775484943927`, -1.6097025756103835`, 1.8958455626786868`},
  
  ViewVertical->{0.15684551832430885`, -0.14773079286910512`, 
   0.9765116979431657}]], "Output",
 CellID->1197711722]
}, Open  ]],

Cell[TextData[{
 " We call the function @",
 StyleBox["CascadingUnfold[polyhedron]",
  FontFamily->"Prestige Elite Std Bold"],
 " on a half-edge to unfold the polyhedron along that half-edge, but then \
also move any connected parts of the polyhedron with it.  We demonstrate this \
below to unfold a dodecahedron into a planar polygon."
}], "Text",
 CellID->1426468694],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"dodec", "=", 
   RowBox[{"PolyIO`PolyFromName", "[", "\"\<Dodecahedron\>\"", "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"dodec", "@", 
   RowBox[{"MakeNumerical", "[", "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"flattenAndGiveGraphics", "[", 
   RowBox[{"poly_", ",", "fnum_", ",", "henum_"}], "]"}], ":=", 
  RowBox[{"(", 
   RowBox[{
    RowBox[{
     RowBox[{"(", 
      RowBox[{"poly", "@", 
       RowBox[{"PickHalfEdge", "[", 
        RowBox[{"fnum", ",", "henum"}], "]"}]}], ")"}], "@", 
     RowBox[{"CascadingUnfold", "[", "poly", "]"}]}], ";", 
    RowBox[{"poly", "@", "Graphics"}]}], ")"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"indices", " ", "=", " ", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"10", ",", "5"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"11", ",", "4"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"12", ",", "5"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"4", ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"5", ",", "5"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"2", ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"6", ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"8", ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"7", ",", "5"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"3", ",", "5"}], "}"}]}], "}"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"frames", " ", "=", " ", 
   RowBox[{"Join", "[", 
    RowBox[{
     RowBox[{"dodec", "@", "Graphics"}], ",", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{
        RowBox[{"Module", "[", 
         RowBox[{
          RowBox[{"{", "g", "}"}], ",", 
          RowBox[{
           RowBox[{"g", "=", 
            RowBox[{"flattenAndGiveGraphics", "[", 
             RowBox[{"dodec", ",", 
              RowBox[{
              "#", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}], 
              ",", 
              RowBox[{
              "#", "\[LeftDoubleBracket]", "2", "\[RightDoubleBracket]"}]}], 
             "]"}]}], ";", "g"}]}], "]"}], "&"}], "/@", "indices"}], ")"}]}], 
    "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Manipulate", "[", 
  RowBox[{
   RowBox[{"Graphics3D", "[", 
    RowBox[{
     RowBox[{"frames", "\[LeftDoubleBracket]", "i", "\[RightDoubleBracket]"}],
      ",", 
     RowBox[{"PlotRange", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"-", "8"}], ",", "2"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"-", "6"}], ",", "2"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"-", "1.5"}], ",", "1.5"}], "}"}]}], "}"}]}]}], "]"}], ",", 
   
   RowBox[{"{", 
    RowBox[{"i", ",", "1", ",", "12", ",", "1"}], "}"}], ",", 
   RowBox[{"SaveDefinitions", "\[Rule]", "True"}]}], "]"}]}], "Input",
 CellID->868174100],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`i$$ = 1, Typeset`show$$ = True, 
    Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{
      Hold[$CellContext`i$$], 1, 12, 1}}, Typeset`size$$ = {
    450., {162., 169.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = False, $CellContext`i$33729$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, "Variables" :> {$CellContext`i$$ = 1}, 
      "ControllerVariables" :> {
        Hold[$CellContext`i$$, $CellContext`i$33729$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> Graphics3D[
        Part[$CellContext`frames, $CellContext`i$$], 
        PlotRange -> {{-8, 2}, {-6, 2}, {-1.5, 1.5}}], 
      "Specifications" :> {{$CellContext`i$$, 1, 12, 1}}, "Options" :> {}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{503., {215., 221.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    Initialization:>({$CellContext`frames = {{{{
            RGBColor[1, 1, 1], 
            
            Polygon[{{-1.11351636441161, 
             0.809016994374947, -0.262865556059567}, {-0.688190960235587, 
             0.5, -1.11351636441161}, {-0.688190960235587, -0.5, \
-1.11351636441161}, {-1.11351636441161, -0.809016994374947, \
-0.262865556059567}, {-1.37638192047117, 0., 0.262865556059567}}]}}, {{
            RGBColor[1, 1, 1], 
            
            Polygon[{{1.37638192047117, 0., -0.262865556059567}, {
             1.11351636441161, 0.809016994374947, 0.262865556059567}, {
             0.688190960235587, 0.5, 1.11351636441161}, {
             0.688190960235587, -0.5, 1.11351636441161}, {
             1.11351636441161, -0.809016994374947, 0.262865556059567}}]}}, {{
            RGBColor[1, 1, 1], 
            
            Polygon[{{1.11351636441161, -0.809016994374947, 
             0.262865556059567}, {0.688190960235587, -0.5, 
             1.11351636441161}, {-0.262865556059567, -0.809016994374947, 
             1.11351636441161}, {-0.42532540417602, -1.30901699437495, 
             0.262865556059567}, {
             0.42532540417602, -1.30901699437495, -0.262865556059567}}]}}, {{
            RGBColor[1, 1, 1], 
            
            Polygon[{{0.688190960235587, -0.5, 1.11351636441161}, {
             0.688190960235587, 0.5, 1.11351636441161}, {-0.262865556059567, 
             0.809016994374947, 1.11351636441161}, {-0.85065080835204, 0., 
             1.11351636441161}, {-0.262865556059567, -0.809016994374947, 
             1.11351636441161}}]}}, {{
            RGBColor[1, 1, 1], 
            
            Polygon[{{0.688190960235587, 0.5, 1.11351636441161}, {
             1.11351636441161, 0.809016994374947, 0.262865556059567}, {
             0.42532540417602, 
             1.30901699437495, -0.262865556059567}, {-0.42532540417602, 
             1.30901699437495, 0.262865556059567}, {-0.262865556059567, 
             0.809016994374947, 1.11351636441161}}]}}, {{
            RGBColor[1, 1, 1], 
            
            Polygon[{{1.11351636441161, 0.809016994374947, 
             0.262865556059567}, {1.37638192047117, 0., -0.262865556059567}, {
             0.85065080835204, 0., -1.11351636441161}, {0.262865556059567, 
             0.809016994374947, -1.11351636441161}, {0.42532540417602, 
             1.30901699437495, -0.262865556059567}}]}}, {{
            RGBColor[1, 1, 1], 
            
            Polygon[{{1.37638192047117, 0., -0.262865556059567}, {
             1.11351636441161, -0.809016994374947, 0.262865556059567}, {
             0.42532540417602, -1.30901699437495, -0.262865556059567}, {
             0.262865556059567, -0.809016994374947, -1.11351636441161}, {
             0.85065080835204, 0., -1.11351636441161}}]}}, {{
            RGBColor[1, 1, 1], 
            
            Polygon[{{-0.42532540417602, 1.30901699437495, 
             0.262865556059567}, {0.42532540417602, 
             1.30901699437495, -0.262865556059567}, {0.262865556059567, 
             0.809016994374947, -1.11351636441161}, {-0.688190960235587, 
             0.5, -1.11351636441161}, {-1.11351636441161, 
             0.809016994374947, -0.262865556059567}}]}}, {{
            RGBColor[1, 1, 1], 
            
            Polygon[{{0.262865556059567, 
             0.809016994374947, -1.11351636441161}, {0.85065080835204, 
             0., -1.11351636441161}, {
             0.262865556059567, -0.809016994374947, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}, {-0.688190960235587, 
             0.5, -1.11351636441161}}]}}, {{
            RGBColor[1, 1, 1], 
            
            Polygon[{{
             0.262865556059567, -0.809016994374947, -1.11351636441161}, {
             0.42532540417602, -1.30901699437495, -0.262865556059567}, \
{-0.42532540417602, -1.30901699437495, 
             0.262865556059567}, {-1.11351636441161, -0.809016994374947, \
-0.262865556059567}, {-0.688190960235587, -0.5, -1.11351636441161}}]}}, {{
            RGBColor[1, 1, 1], 
            
            Polygon[{{-0.42532540417602, -1.30901699437495, 
             0.262865556059567}, {-0.262865556059567, -0.809016994374947, 
             1.11351636441161}, {-0.85065080835204, 0., 
             1.11351636441161}, {-1.37638192047117, 0., 
             0.262865556059567}, {-1.11351636441161, -0.809016994374947, \
-0.262865556059567}}]}}, {{
            RGBColor[1, 1, 1], 
            
            Polygon[{{-0.85065080835204, 0., 
             1.11351636441161}, {-0.262865556059567, 0.809016994374947, 
             1.11351636441161}, {-0.42532540417602, 1.30901699437495, 
             0.262865556059567}, {-1.11351636441161, 
             0.809016994374947, -0.262865556059567}, {-1.37638192047117, 0., 
             0.262865556059567}}]}}}, {{{{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-1.53884176858763, -0.500000000000003, 
              0.262865556059565}, {-0.85065080835204, -4.44089209850063*^-16, \
-0.26286555605957}, {-0.688190960235588, -0.5, -1.11351636441161}, \
{-1.27597621252806, -1.30901699437495, -1.11351636441161}, \
{-1.80170732464719, -1.30901699437495, -0.262865556059565}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{0.951056516295152, -1.30901699437495, 
              0.262865556059563}, {0.425325404176026, -1.30901699437495, 
              1.11351636441161}, {-0.16245984811645, -2.1180339887499, 
              1.11351636441161}, {1.60982338570648*^-15, -2.6180339887499, 
              0.262865556059568}, {
              0.688190960235591, -2.1180339887499, -0.262865556059567}}]}}, {{
            
             RGBColor[1, 1, 1], 
             
             Polygon[{{
              0.688190960235591, -2.1180339887499, -0.262865556059567}, {
              1.60982338570648*^-15, -2.6180339887499, 
              0.262865556059568}, {-0.85065080835204, -2.6180339887499, \
-0.262865556059565}, {-0.688190960235587, -2.1180339887499, \
-1.11351636441161}, {
              0.262865556059567, -1.80901699437495, -1.11351636441161}}]}}, {{
            
             RGBColor[1, 1, 1], 
             
             Polygon[{{1.60982338570648*^-15, -2.6180339887499, 
              0.262865556059568}, {-0.16245984811645, -2.1180339887499, 
              1.11351636441161}, {-1.11351636441161, -1.80901699437495, 
              1.11351636441161}, {-1.53884176858763, -2.1180339887499, 
              0.262865556059569}, {-0.85065080835204, -2.6180339887499, \
-0.262865556059565}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-0.16245984811645, -2.1180339887499, 
              1.11351636441161}, {0.425325404176026, -1.30901699437495, 
              1.11351636441161}, {-0.162459848116451, -0.500000000000001, 
              1.11351636441161}, {-1.1135163644116, -0.809016994374949, 
              1.11351636441161}, {-1.11351636441161, -1.80901699437495, 
              1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{0.425325404176026, -1.30901699437495, 
              1.11351636441161}, {0.951056516295152, -1.30901699437495, 
              0.262865556059563}, {
              0.688190960235588, -0.499999999999999, -0.262865556059571}, {
              2.16493489801906*^-15, 4.44089209850063*^-16, 
              0.262865556059563}, {-0.162459848116451, -0.500000000000001, 
              1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{0.951056516295152, -1.30901699437495, 
              0.262865556059563}, {
              0.688190960235591, -2.1180339887499, -0.262865556059567}, {
              0.262865556059567, -1.80901699437495, -1.11351636441161}, {
              0.262865556059567, -0.809016994374947, -1.11351636441161}, {
              0.688190960235588, -0.499999999999999, -0.262865556059571}}]}}, \
{{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-1.1135163644116, -0.809016994374949, 
              1.11351636441161}, {-0.162459848116451, -0.500000000000001, 
              1.11351636441161}, {2.16493489801906*^-15, 
              4.44089209850063*^-16, 
              0.262865556059563}, {-0.85065080835204, -4.44089209850063*^-16, \
-0.26286555605957}, {-1.53884176858763, -0.500000000000003, 
              0.262865556059565}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{0.262865556059567, 
              0.809016994374947, -1.11351636441161}, {0.85065080835204, 
              0., -1.11351636441161}, {
              0.262865556059567, -0.809016994374947, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}, {-0.688190960235587, 
              0.5, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{
              0.262865556059567, -0.809016994374947, -1.11351636441161}, {
              0.262865556059567, -1.80901699437495, -1.11351636441161}, \
{-0.688190960235587, -2.1180339887499, -1.11351636441161}, \
{-1.27597621252806, -1.30901699437495, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-0.688190960235587, -2.1180339887499, \
-1.11351636441161}, {-0.85065080835204, -2.6180339887499, \
-0.262865556059565}, {-1.53884176858763, -2.1180339887499, 
              0.262865556059569}, {-1.80170732464719, -1.30901699437495, \
-0.262865556059565}, {-1.27597621252806, -1.30901699437495, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-1.53884176858763, -2.1180339887499, 
              0.262865556059569}, {-1.11351636441161, -1.80901699437495, 
              1.11351636441161}, {-1.1135163644116, -0.809016994374949, 
              1.11351636441161}, {-1.53884176858763, -0.500000000000003, 
              0.262865556059565}, {-1.80170732464719, -1.30901699437495, \
-0.262865556059565}}]}}}}, {{{{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.22703272882322, -3.99680288865056*^-15, \
-1.11351636441162}, {-1.27597621252806, 
              0.309016994374947, -1.11351636441161}, {-0.688190960235588, \
-0.5, -1.11351636441161}, {-1.27597621252806, -1.30901699437495, \
-1.11351636441161}, {-2.22703272882321, -0.999999999999999, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-0.850650808352054, -6.66133814775094*^-16, 
              1.1135163644116}, {-1.80170732464721, 0.309016994374951, 
              1.11351636441161}, {-2.38949257693968, -0.499999999999999, 
              1.1135163644116}, {-1.80170732464721, -1.30901699437495, 
              1.11351636441161}, {-0.850650808352051, -0.999999999999999, 
              1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-0.850650808352051, -0.999999999999999, 
              1.11351636441161}, {-1.80170732464721, -1.30901699437495, 
              1.11351636441161}, {-1.96416717276366, -1.80901699437495, 
              0.262865556059564}, {-1.11351636441161, -1.80901699437495, \
-0.262865556059568}, {-0.425325404176026, -1.30901699437495, 
              0.262865556059567}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-1.80170732464721, -1.30901699437495, 
              1.11351636441161}, {-2.38949257693968, -0.499999999999999, 
              1.1135163644116}, {-2.91522368905881, -0.5, 
              0.262865556059555}, {-2.65235813299924, -1.30901699437495, \
-0.262865556059576}, {-1.96416717276366, -1.80901699437495, 
              0.262865556059564}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.38949257693968, -0.499999999999999, 
              1.1135163644116}, {-1.80170732464721, 0.309016994374951, 
              1.11351636441161}, {-1.96416717276366, 0.80901699437495, 
              0.262865556059562}, {-2.65235813299924, 
              0.30901699437495, -0.262865556059571}, {-2.91522368905881, -0.5,
               0.262865556059555}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-1.80170732464721, 0.309016994374951, 
              1.11351636441161}, {-0.850650808352054, -6.66133814775094*^-16, 
              1.1135163644116}, {-0.425325404176027, 0.30901699437495, 
              0.262865556059565}, {-1.11351636441161, 
              0.809016994374948, -0.262865556059572}, {-1.96416717276366, 
              0.80901699437495, 0.262865556059562}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-0.850650808352054, -6.66133814775094*^-16, 
              1.1135163644116}, {-0.850650808352051, -0.999999999999999, 
              1.11351636441161}, {-0.425325404176026, -1.30901699437495, 
              0.262865556059567}, {-0.162459848116457, -0.499999999999998, \
-0.262865556059567}, {-0.425325404176027, 0.30901699437495, 
              0.262865556059565}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.65235813299924, 
              0.30901699437495, -0.262865556059571}, {-1.96416717276366, 
              0.80901699437495, 0.262865556059562}, {-1.11351636441161, 
              0.809016994374948, -0.262865556059572}, {-1.27597621252806, 
              0.309016994374947, -1.11351636441161}, {-2.22703272882322, \
-3.99680288865056*^-15, -1.11351636441162}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{0.262865556059567, 
              0.809016994374947, -1.11351636441161}, {0.85065080835204, 
              0., -1.11351636441161}, {
              0.262865556059567, -0.809016994374947, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}, {-0.688190960235587, 
              0.5, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{
              0.262865556059567, -0.809016994374947, -1.11351636441161}, {
              0.262865556059567, -1.80901699437495, -1.11351636441161}, \
{-0.688190960235587, -2.1180339887499, -1.11351636441161}, \
{-1.27597621252806, -1.30901699437495, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-1.11351636441161, -1.80901699437495, \
-0.262865556059568}, {-1.96416717276366, -1.80901699437495, 
              0.262865556059564}, {-2.65235813299924, -1.30901699437495, \
-0.262865556059576}, {-2.22703272882321, -0.999999999999999, \
-1.11351636441161}, {-1.27597621252806, -1.30901699437495, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.65235813299924, -1.30901699437495, \
-0.262865556059576}, {-2.91522368905881, -0.5, 
              0.262865556059555}, {-2.65235813299924, 
              0.30901699437495, -0.262865556059571}, {-2.22703272882322, \
-3.99680288865056*^-15, -1.11351636441162}, {-2.22703272882321, \
-0.999999999999999, -1.11351636441161}}]}}}}, {{{{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.22703272882322, -3.99680288865056*^-15, \
-1.11351636441162}, {-1.27597621252806, 
              0.309016994374947, -1.11351636441161}, {-0.688190960235588, \
-0.5, -1.11351636441161}, {-1.27597621252806, -1.30901699437495, \
-1.11351636441161}, {-2.22703272882321, -0.999999999999999, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-1.7013016167041, -2.61803398874986, 
              1.11351636441161}, {-2.65235813299926, -2.30901699437492, 
              1.11351636441162}, {-3.07768353717527, -2.61803398874987, 
              0.262865556059573}, {-2.38949257693969, -3.11803398874989, \
-0.262865556059554}, {-1.53884176858764, -3.11803398874988, 
              0.262865556059586}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-1.53884176858764, -3.11803398874988, 
              0.262865556059586}, {-2.38949257693969, -3.11803398874989, \
-0.262865556059554}, {-2.22703272882323, -2.61803398874989, \
-1.1135163644116}, {-1.27597621252806, -2.30901699437495, -1.1135163644116}, \
{-0.85065080835205, -2.61803398874989, -0.262865556059556}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.38949257693969, -3.11803398874989, \
-0.262865556059554}, {-3.07768353717527, -2.61803398874987, 
              0.262865556059573}, {-3.34054909323483, -1.80901699437492, \
-0.262865556059572}, {-2.81481798111569, -1.80901699437494, \
-1.11351636441161}, {-2.22703272882323, -2.61803398874989, \
-1.1135163644116}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-3.07768353717527, -2.61803398874987, 
              0.262865556059573}, {-2.65235813299926, -2.30901699437492, 
              1.11351636441162}, {-2.65235813299925, -1.30901699437491, 
              1.1135163644116}, {-3.07768353717526, -0.999999999999975, 
              0.262865556059561}, {-3.34054909323483, -1.80901699437492, \
-0.262865556059572}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.65235813299926, -2.30901699437492, 
              1.11351636441162}, {-1.7013016167041, -2.61803398874986, 
              1.11351636441161}, {-1.11351636441162, -1.80901699437492, 
              1.11351636441161}, {-1.70130161670408, -0.999999999999971, 
              1.1135163644116}, {-2.65235813299925, -1.30901699437491, 
              1.1135163644116}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-1.7013016167041, -2.61803398874986, 
              1.11351636441161}, {-1.53884176858764, -3.11803398874988, 
              0.262865556059586}, {-0.85065080835205, -2.61803398874989, \
-0.262865556059556}, {-0.58778525229248, -1.80901699437493, 
              0.262865556059574}, {-1.11351636441162, -1.80901699437492, 
              1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-3.07768353717526, -0.999999999999975, 
              0.262865556059561}, {-2.65235813299925, -1.30901699437491, 
              1.1135163644116}, {-1.70130161670408, -0.999999999999971, 
              1.1135163644116}, {-1.53884176858763, -0.499999999999983, 
              0.262865556059557}, {-2.38949257693967, -0.499999999999978, \
-0.262865556059588}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{0.262865556059567, 
              0.809016994374947, -1.11351636441161}, {0.85065080835204, 
              0., -1.11351636441161}, {
              0.262865556059567, -0.809016994374947, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}, {-0.688190960235587, 
              0.5, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{
              0.262865556059567, -0.809016994374947, -1.11351636441161}, {
              
              0.262865556059567, -1.80901699437495, -1.11351636441161}, \
{-0.688190960235587, -2.1180339887499, -1.11351636441161}, \
{-1.27597621252806, -1.30901699437495, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-1.27597621252806, -2.30901699437495, \
-1.1135163644116}, {-2.22703272882323, -2.61803398874989, -1.1135163644116}, \
{-2.81481798111569, -1.80901699437494, -1.11351636441161}, \
{-2.22703272882321, -0.999999999999999, -1.11351636441161}, \
{-1.27597621252806, -1.30901699437495, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.81481798111569, -1.80901699437494, \
-1.11351636441161}, {-3.34054909323483, -1.80901699437492, \
-0.262865556059572}, {-3.07768353717526, -0.999999999999975, 
              0.262865556059561}, {-2.38949257693967, -0.499999999999978, \
-0.262865556059588}, {-2.22703272882321, -0.999999999999995, \
-1.11351636441161}}]}}}}, {{{{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.22703272882322, -3.99680288865056*^-15, \
-1.11351636441162}, {-1.27597621252806, 
              0.309016994374947, -1.11351636441161}, {-0.688190960235588, \
-0.5, -1.11351636441161}, {-1.27597621252806, -1.30901699437495, \
-1.11351636441161}, {-2.22703272882321, -0.999999999999999, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-3.92833434552727, -0.999999999999973, 
              1.1135163644116}, {-4.45406545764643, -0.999999999999971, 
              0.262865556059572}, {-4.19119990158687, -1.80901699437492, \
-0.262865556059563}, {-3.50300894135129, -2.30901699437494, 
              0.262865556059567}, {-3.34054909323481, -1.80901699437493, 
              1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-3.34054909323481, -1.80901699437493, 
              1.11351636441161}, {-3.50300894135129, -2.30901699437494, 
              0.262865556059567}, {-2.65235813299925, -2.30901699437494, \
-0.262865556059578}, {-1.96416717276364, -1.80901699437495, 
              0.262865556059563}, {-2.38949257693965, -1.5, 
              1.1135163644116}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-3.50300894135129, -2.30901699437494, 
              0.262865556059567}, {-4.19119990158687, -1.80901699437492, \
-0.262865556059563}, {-3.76587449741084, -1.49999999999997, \
-1.11351636441161}, {-2.8148179811157, -1.80901699437494, -1.11351636441161}, \
{-2.65235813299925, -2.30901699437494, -0.262865556059578}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-4.19119990158687, -1.80901699437492, \
-0.262865556059563}, {-4.45406545764643, -0.999999999999971, 
              0.262865556059572}, {-4.19119990158685, -0.190983005625023, \
-0.26286555605957}, {-3.76587449741084, -0.499999999999976, \
-1.1135163644116}, {-3.76587449741084, -1.49999999999997, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-4.45406545764643, -0.999999999999971, 
              0.262865556059572}, {-3.92833434552727, -0.999999999999973, 
              1.1135163644116}, {-3.34054909323479, -0.190983005625032, 
              1.1135163644116}, {-3.50300894135124, 0.30901699437497, 
              0.262865556059571}, {-4.19119990158685, -0.190983005625023, \
-0.26286555605957}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-3.92833434552727, -0.999999999999973, 
              1.1135163644116}, {-3.34054909323481, -1.80901699437493, 
              1.11351636441161}, {-2.38949257693965, -1.5, 
              1.1135163644116}, {-2.38949257693964, -0.499999999999988, 
              1.1135163644116}, {-3.34054909323479, -0.190983005625032, 
              1.1135163644116}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-3.76587449741084, -0.499999999999976, \
-1.1135163644116}, {-4.19119990158685, -0.190983005625023, \
-0.26286555605957}, {-3.50300894135124, 0.30901699437497, 
              0.262865556059571}, {-2.65235813299921, 
              0.309016994374956, -0.262865556059573}, {-2.81481798111567, \
-0.190983005625042, -1.11351636441162}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{0.262865556059567, 
              0.809016994374947, -1.11351636441161}, {0.85065080835204, 
              0., -1.11351636441161}, {
              0.262865556059567, -0.809016994374947, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}, {-0.688190960235587, 
              0.5, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{
              0.262865556059567, -0.809016994374947, -1.11351636441161}, {
              0.262865556059567, -1.80901699437495, -1.11351636441161}, \
{-0.688190960235587, -2.1180339887499, -1.11351636441161}, \
{-1.27597621252806, -1.30901699437495, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-1.27597621252806, -2.30901699437495, \
-1.1135163644116}, {-2.22703272882323, -2.61803398874989, -1.1135163644116}, \
{-2.81481798111569, -1.80901699437494, -1.11351636441161}, \
{-2.22703272882321, -0.999999999999999, -1.11351636441161}, \
{-1.27597621252806, -1.30901699437495, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.8148179811157, -1.80901699437494, \
-1.11351636441161}, {-3.76587449741084, -1.49999999999997, \
-1.11351636441161}, {-3.76587449741084, -0.499999999999976, \
-1.1135163644116}, {-2.81481798111567, -0.190983005625042, \
-1.11351636441162}, {-2.22703272882321, -0.999999999999995, \
-1.11351636441161}}]}}}}, {{{{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.22703272882322, -3.99680288865056*^-15, \
-1.11351636441162}, {-1.27597621252806, 
              0.309016994374947, -1.11351636441161}, {-0.688190960235588, \
-0.5, -1.11351636441161}, {-1.27597621252806, -1.30901699437495, \
-1.11351636441161}, {-2.22703272882321, -0.999999999999999, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-4.61652530576293, -3.11803398874987, 
              
              0.262865556059532}, {-4.87939086182249, -2.30901699437492, \
-0.262865556059604}, {-4.35365974970334, -2.30901699437492, \
-1.11351636441164}, {-3.76587449741087, -3.11803398874988, \
-1.11351636441165}, {-3.92833434552734, -3.61803398874989, \
-0.262865556059595}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-3.92833434552734, -3.61803398874989, \
-0.262865556059595}, {-3.76587449741087, -3.11803398874988, \
-1.11351636441165}, {-2.81481798111571, -2.80901699437494, \
-1.11351636441163}, {-2.3894925769397, -3.11803398874991, \
-0.262865556059574}, {-3.07768353717531, -3.6180339887499, 
              0.262865556059543}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-3.76587449741087, -3.11803398874988, \
-1.11351636441165}, {-4.35365974970334, -2.30901699437492, \
-1.11351636441164}, {-3.76587449741084, -1.49999999999997, \
-1.11351636441161}, {-2.8148179811157, -1.80901699437494, -1.11351636441161}, \
{-2.81481798111571, -2.80901699437494, -1.11351636441163}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-4.35365974970334, -2.30901699437492, \
-1.11351636441164}, {-4.87939086182249, -2.30901699437492, \
-0.262865556059604}, {-4.61652530576292, -1.49999999999997, 
              0.262865556059542}, {-3.92833434552731, -0.999999999999987, \
-0.262865556059575}, {-3.76587449741083, -1.49999999999998, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-4.87939086182249, -2.30901699437492, \
-0.262865556059604}, {-4.61652530576293, -3.11803398874987, 
              0.262865556059532}, {-4.19119990158693, -2.80901699437493, 
              1.11351636441158}, {-4.19119990158691, -1.80901699437494, 
              1.11351636441159}, {-4.61652530576292, -1.49999999999997, 
              0.262865556059542}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-4.61652530576293, -3.11803398874987, 
              0.262865556059532}, {-3.92833434552734, -3.61803398874989, \
-0.262865556059595}, {-3.07768353717531, -3.6180339887499, 
              0.262865556059543}, {-3.24014338529178, -3.11803398874989, 
              1.11351636441159}, {-4.19119990158693, -2.80901699437493, 
              1.11351636441158}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-3.92833434552731, -0.999999999999987, \
-0.262865556059575}, {-4.61652530576292, -1.49999999999997, 
              0.262865556059542}, {-4.19119990158691, -1.80901699437494, 
              1.11351636441159}, {-3.24014338529176, -1.5, 
              1.1135163644116}, {-3.07768353717527, -0.999999999999993, 
              0.262865556059564}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{0.262865556059567, 
              0.809016994374947, -1.11351636441161}, {0.85065080835204, 
              0., -1.11351636441161}, {
              0.262865556059567, -0.809016994374947, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}, {-0.688190960235587, 
              0.5, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{
              0.262865556059567, -0.809016994374947, -1.11351636441161}, {
              0.262865556059567, -1.80901699437495, -1.11351636441161}, \
{-0.688190960235587, -2.1180339887499, -1.11351636441161}, \
{-1.27597621252806, -1.30901699437495, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-1.27597621252806, -2.30901699437495, \
-1.1135163644116}, {-2.22703272882323, -2.61803398874989, -1.1135163644116}, \
{-2.81481798111569, -1.80901699437494, -1.11351636441161}, \
{-2.22703272882321, -0.999999999999999, -1.11351636441161}, \
{-1.27597621252806, -1.30901699437495, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.8148179811157, -1.80901699437494, \
-1.11351636441161}, {-3.76587449741084, -1.49999999999997, \
-1.11351636441161}, {-3.76587449741084, -0.499999999999976, \
-1.1135163644116}, {-2.81481798111567, -0.190983005625042, \
-1.11351636441162}, {-2.22703272882321, -0.999999999999995, \
-1.11351636441161}}]}}}}, {{{{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.22703272882322, -3.99680288865056*^-15, \
-1.11351636441162}, {-1.27597621252806, 
              0.309016994374947, -1.11351636441161}, {-0.688190960235588, \
-0.5, -1.11351636441161}, {-1.27597621252806, -1.30901699437495, \
-1.11351636441161}, {-2.22703272882321, -0.999999999999999, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.73004167017451, -2.30901699437486, \
-0.262865556059592}, {-5.30471626599848, -1.99999999999994, \
-1.11351636441164}, {-4.35365974970333, -2.30901699437492, \
-1.11351636441164}, {-4.19119990158689, -2.80901699437494, \
-0.262865556059599}, {-5.04185070993894, -2.8090169943749, 
              0.262865556059548}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.04185070993894, -2.8090169943749, 
              0.262865556059548}, {-4.19119990158689, -2.80901699437494, \
-0.262865556059599}, {-3.50300894135128, -2.30901699437496, 
              0.262865556059537}, {-3.9283343455273, -2., 
              1.11351636441159}, {-4.87939086182247, -2.30901699437491, 
              1.11351636441158}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-3.76587449741087, -3.11803398874988, \
-1.11351636441165}, {-4.35365974970334, -2.30901699437492, \
-1.11351636441164}, {-3.76587449741084, -1.49999999999997, \
-1.11351636441161}, {-2.8148179811157, -1.80901699437494, -1.11351636441161}, \
{-2.81481798111571, -2.80901699437494, -1.11351636441163}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-4.35365974970333, -2.30901699437492, \
-1.11351636441164}, {-5.30471626599848, -1.99999999999994, \
-1.11351636441164}, {-5.30471626599844, -0.999999999999925, \
-1.11351636441164}, {-4.35365974970328, -0.69098300562502, \
-1.11351636441162}, {-3.76587449741083, -1.49999999999998, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.30471626599848, -1.99999999999994, \
-1.11351636441164}, {-5.73004167017451, -2.30901699437486, \
-0.262865556059592}, {-5.99290722623405, -1.49999999999991, 
              0.262865556059534}, {-5.73004167017445, -0.690983005624971, \
-0.262865556059585}, {-5.30471626599844, -0.999999999999925, \
-1.11351636441164}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.73004167017451, -2.30901699437486, \
-0.262865556059592}, {-5.04185070993894, -2.8090169943749, 
              0.262865556059548}, {-4.87939086182247, -2.30901699437491, 
              1.11351636441158}, {-5.46717611411492, -1.49999999999993, 
              1.11351636441157}, {-5.99290722623405, -1.49999999999991, 
              0.262865556059534}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-4.35365974970328, -0.69098300562502, \
-1.11351636441162}, {-5.30471626599844, -0.999999999999925, \
-1.11351636441164}, {-5.73004167017445, -0.690983005624971, \
-0.262865556059585}, {-5.04185070993885, -0.190983005625001, 
              0.26286555605954}, {-4.19119990158679, -0.190983005625024, \
-0.262865556059583}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{0.262865556059567, 
              0.809016994374947, -1.11351636441161}, {0.85065080835204, 
              0., -1.11351636441161}, {
              0.262865556059567, -0.809016994374947, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}, {-0.688190960235587, 
              0.5, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{
              0.262865556059567, -0.809016994374947, -1.11351636441161}, {
              0.262865556059567, -1.80901699437495, -1.11351636441161}, \
{-0.688190960235587, -2.1180339887499, -1.11351636441161}, \
{-1.27597621252806, -1.30901699437495, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-1.27597621252806, -2.30901699437495, \
-1.1135163644116}, {-2.22703272882323, -2.61803398874989, -1.1135163644116}, \
{-2.81481798111569, -1.80901699437494, -1.11351636441161}, \
{-2.22703272882321, -0.999999999999999, -1.11351636441161}, \
{-1.27597621252806, -1.30901699437495, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.8148179811157, -1.80901699437494, \
-1.11351636441161}, {-3.76587449741084, -1.49999999999997, \
-1.11351636441161}, {-3.76587449741084, -0.499999999999976, \
-1.1135163644116}, {-2.81481798111567, -0.190983005625042, \
-1.11351636441162}, {-2.22703272882321, -0.999999999999995, \
-1.11351636441161}}]}}}}, {{{{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.22703272882322, -3.99680288865056*^-15, \
-1.11351636441162}, {-1.27597621252806, 
              0.309016994374947, -1.11351636441161}, {-0.688190960235588, \
-0.5, -1.11351636441161}, {-1.27597621252806, -1.30901699437495, \
-1.11351636441161}, {-2.22703272882321, -0.999999999999999, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.89250151829098, -2.80901699437486, \
-1.11351636441161}, {-5.30471626599848, -1.99999999999994, \
-1.11351636441164}, {-4.35365974970333, -2.30901699437492, \
-1.11351636441164}, {-4.35365974970336, -3.30901699437492, \
-1.11351636441164}, {-5.30471626599854, -3.61803398874984, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.30471626599854, -3.61803398874984, \
-1.11351636441161}, {-4.35365974970336, -3.30901699437492, \
-1.11351636441164}, {-3.92833434552734, -3.61803398874988, \
-0.262865556059588}, {-4.61652530576295, -4.11803398874986, 
              0.262865556059555}, {-5.467176114115, -4.11803398874983, \
-0.262865556059576}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-3.76587449741087, -3.11803398874988, \
-1.11351636441165}, {-4.35365974970334, -2.30901699437492, \
-1.11351636441164}, {-3.76587449741084, -1.49999999999997, \
-1.11351636441161}, {-2.8148179811157, -1.80901699437494, -1.11351636441161}, \
{-2.81481798111571, -2.80901699437494, -1.11351636441163}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-4.35365974970333, -2.30901699437492, \
-1.11351636441164}, {-5.30471626599848, -1.99999999999994, \
-1.11351636441164}, {-5.30471626599844, -0.999999999999925, \
-1.11351636441164}, {-4.35365974970328, -0.69098300562502, \
-1.11351636441162}, {-3.76587449741083, -1.49999999999998, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.30471626599848, -1.99999999999994, \
-1.11351636441164}, {-5.89250151829098, -2.80901699437486, \
-1.11351636441161}, {-6.41823263041011, -2.80901699437483, \
-0.262865556059576}, {-6.15536707435052, -1.9999999999999, 
              0.262865556059557}, {-5.46717611411491, -1.49999999999991, \
-0.262865556059586}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.89250151829098, -2.80901699437486, \
-1.11351636441161}, {-5.30471626599854, -3.61803398874984, \
-1.11351636441161}, {-5.467176114115, -4.11803398874983, -0.262865556059576}, \
{-6.15536707435057, -3.61803398874978, 
              0.262865556059561}, {-6.41823263041011, -2.80901699437483, \
-0.262865556059576}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-4.61652530576288, -1.49999999999996, 
              0.262865556059542}, {-5.46717611411491, -1.49999999999991, \
-0.262865556059586}, {-6.15536707435052, -1.9999999999999, 
              0.262865556059557}, {-5.7300416701745, -2.30901699437485, 
              1.11351636441159}, {-4.77898515387932, -1.99999999999994, 
              1.11351636441159}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{0.262865556059567, 
              0.809016994374947, -1.11351636441161}, {0.85065080835204, 
              0., -1.11351636441161}, {
              0.262865556059567, -0.809016994374947, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}, {-0.688190960235587, 
              0.5, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{
              0.262865556059567, -0.809016994374947, -1.11351636441161}, {
              0.262865556059567, -1.80901699437495, -1.11351636441161}, \
{-0.688190960235587, -2.1180339887499, -1.11351636441161}, \
{-1.27597621252806, -1.30901699437495, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-1.27597621252806, -2.30901699437495, \
-1.1135163644116}, {-2.22703272882323, -2.61803398874989, -1.1135163644116}, \
{-2.81481798111569, -1.80901699437494, -1.11351636441161}, \
{-2.22703272882321, -0.999999999999999, -1.11351636441161}, \
{-1.27597621252806, -1.30901699437495, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.8148179811157, -1.80901699437494, \
-1.11351636441161}, {-3.76587449741084, -1.49999999999997, \
-1.11351636441161}, {-3.76587449741084, -0.499999999999976, \
-1.1135163644116}, {-2.81481798111567, -0.190983005625042, \
-1.11351636441162}, {-2.22703272882321, -0.999999999999995, \
-1.11351636441161}}]}}}}, {{{{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.22703272882322, -3.99680288865056*^-15, \
-1.11351636441162}, {-1.27597621252806, 
              0.309016994374947, -1.11351636441161}, {-0.688190960235588, \
-0.5, -1.11351636441161}, {-1.27597621252806, -1.30901699437495, \
-1.11351636441161}, {-2.22703272882321, -0.999999999999999, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.89250151829098, -2.80901699437486, \
-1.11351636441161}, {-5.30471626599848, -1.99999999999994, \
-1.11351636441164}, {-4.35365974970333, -2.30901699437492, \
-1.11351636441164}, {-4.35365974970336, -3.30901699437492, \
-1.11351636441164}, {-5.30471626599854, -3.61803398874984, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.73004167017452, -3.30901699437486, \
-0.262865556059563}, {-5.04185070993889, -2.80901699437486, 
              0.26286555605955}, {-5.4671761141149, -2.49999999999988, 
              1.1135163644116}, {-6.41823263041007, -2.80901699437482, 
              1.11351636441162}, {-6.58069247852655, -3.30901699437484, 
              0.262865556059582}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-3.76587449741087, -3.11803398874988, \
-1.11351636441165}, {-4.35365974970334, -2.30901699437492, \
-1.11351636441164}, {-3.76587449741084, -1.49999999999997, \
-1.11351636441161}, {-2.8148179811157, -1.80901699437494, -1.11351636441161}, \
{-2.81481798111571, -2.80901699437494, -1.11351636441163}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-4.35365974970333, -2.30901699437492, \
-1.11351636441164}, {-5.30471626599848, -1.99999999999994, \
-1.11351636441164}, {-5.30471626599844, -0.999999999999925, \
-1.11351636441164}, {-4.35365974970328, -0.69098300562502, \
-1.11351636441162}, {-3.76587449741083, -1.49999999999998, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.30471626599848, -1.99999999999994, \
-1.11351636441164}, {-5.89250151829097, -2.80901699437486, \
-1.11351636441161}, {-6.84355803458612, -2.49999999999989, \
-1.11351636441161}, {-6.84355803458611, -1.4999999999999, -1.11351636441163}, \
{-5.89250151829094, -1.19098300562496, -1.11351636441165}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.89250151829097, -2.80901699437486, \
-1.11351636441161}, {-5.73004167017452, -3.30901699437486, \
-0.262865556059563}, {-6.58069247852655, -3.30901699437484, 
              0.262865556059582}, {-7.26888343876213, -2.80901699437482, \
-0.262865556059566}, {-6.84355803458612, -2.49999999999989, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.73004167017448, -0.690983005624966, \
-0.262865556059622}, {-5.89250151829094, -1.19098300562496, \
-1.11351636441165}, {-6.84355803458611, -1.4999999999999, -1.11351636441163}, \
{-7.2688834387621, -1.19098300562493, -0.262865556059592}, {-6.5806924785265, \
-0.690983005624925, 0.262865556059539}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{0.262865556059567, 
              0.809016994374947, -1.11351636441161}, {0.85065080835204, 
              0., -1.11351636441161}, {
              0.262865556059567, -0.809016994374947, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}, {-0.688190960235587, 
              0.5, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{
              0.262865556059567, -0.809016994374947, -1.11351636441161}, {
              0.262865556059567, -1.80901699437495, -1.11351636441161}, \
{-0.688190960235587, -2.1180339887499, -1.11351636441161}, \
{-1.27597621252806, -1.30901699437495, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-1.27597621252806, -2.30901699437495, \
-1.1135163644116}, {-2.22703272882323, -2.61803398874989, -1.1135163644116}, \
{-2.81481798111569, -1.80901699437494, -1.11351636441161}, \
{-2.22703272882321, -0.999999999999999, -1.11351636441161}, \
{-1.27597621252806, -1.30901699437495, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.8148179811157, -1.80901699437494, \
-1.11351636441161}, {-3.76587449741084, -1.49999999999997, \
-1.11351636441161}, {-3.76587449741084, -0.499999999999976, \
-1.1135163644116}, {-2.81481798111567, -0.190983005625042, \
-1.11351636441162}, {-2.22703272882321, -0.999999999999995, \
-1.11351636441161}}]}}}}, {{{{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.22703272882322, -3.99680288865056*^-15, \
-1.11351636441162}, {-1.27597621252806, 
              0.309016994374947, -1.11351636441161}, {-0.688190960235588, \
-0.5, -1.11351636441161}, {-1.27597621252806, -1.30901699437495, \
-1.11351636441161}, {-2.22703272882321, -0.999999999999999, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.89250151829098, -2.80901699437486, \
-1.11351636441161}, {-5.30471626599848, -1.99999999999994, \
-1.11351636441164}, {-4.35365974970333, -2.30901699437492, \
-1.11351636441164}, {-4.35365974970336, -3.30901699437492, \
-1.11351636441164}, {-5.30471626599854, -3.61803398874984, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.73004167017452, -3.30901699437486, \
-0.262865556059563}, {-5.04185070993889, -2.80901699437486, 
              0.26286555605955}, {-5.4671761141149, -2.49999999999988, 
              1.1135163644116}, {-6.41823263041007, -2.80901699437482, 
              1.11351636441162}, {-6.58069247852655, -3.30901699437484, 
              0.262865556059582}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-3.76587449741087, -3.11803398874988, \
-1.11351636441165}, {-4.35365974970334, -2.30901699437492, \
-1.11351636441164}, {-3.76587449741084, -1.49999999999997, \
-1.11351636441161}, {-2.8148179811157, -1.80901699437494, -1.11351636441161}, \
{-2.81481798111571, -2.80901699437494, -1.11351636441163}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-4.35365974970333, -2.30901699437492, \
-1.11351636441164}, {-5.30471626599848, -1.99999999999994, \
-1.11351636441164}, {-5.30471626599844, -0.999999999999925, \
-1.11351636441164}, {-4.35365974970328, -0.69098300562502, \
-1.11351636441162}, {-3.76587449741083, -1.49999999999998, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.30471626599848, -1.99999999999994, \
-1.11351636441164}, {-5.89250151829097, -2.80901699437486, \
-1.11351636441161}, {-6.84355803458612, -2.49999999999989, \
-1.11351636441161}, {-6.84355803458611, -1.4999999999999, -1.11351636441163}, \
{-5.89250151829094, -1.19098300562496, -1.11351636441165}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.89250151829097, -2.80901699437486, \
-1.11351636441161}, {-5.73004167017452, -3.30901699437486, \
-0.262865556059563}, {-6.58069247852655, -3.30901699437484, 
              0.262865556059582}, {-7.26888343876213, -2.80901699437482, \
-0.262865556059566}, {-6.84355803458612, -2.49999999999989, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.89250151829094, -0.190983005624973, \
-1.11351636441166}, {-5.89250151829094, -1.19098300562496, \
-1.11351636441165}, {-6.84355803458611, -1.4999999999999, -1.11351636441163}, \
{-7.43134328687856, -0.690983005624947, -1.11351636441164}, \
{-6.84355803458608, 0.118033988750011, -1.11351636441166}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{0.262865556059567, 
              0.809016994374947, -1.11351636441161}, {0.85065080835204, 
              0., -1.11351636441161}, {
              0.262865556059567, -0.809016994374947, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}, {-0.688190960235587, 
              0.5, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{
              0.262865556059567, -0.809016994374947, -1.11351636441161}, {
              0.262865556059567, -1.80901699437495, -1.11351636441161}, \
{-0.688190960235587, -2.1180339887499, -1.11351636441161}, \
{-1.27597621252806, -1.30901699437495, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-1.27597621252806, -2.30901699437495, \
-1.1135163644116}, {-2.22703272882323, -2.61803398874989, -1.1135163644116}, \
{-2.81481798111569, -1.80901699437494, -1.11351636441161}, \
{-2.22703272882321, -0.999999999999999, -1.11351636441161}, \
{-1.27597621252806, -1.30901699437495, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.8148179811157, -1.80901699437494, \
-1.11351636441161}, {-3.76587449741084, -1.49999999999997, \
-1.11351636441161}, {-3.76587449741084, -0.499999999999976, \
-1.1135163644116}, {-2.81481798111567, -0.190983005625042, \
-1.11351636441162}, {-2.22703272882321, -0.999999999999995, \
-1.11351636441161}}]}}}}, {{{{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.22703272882322, -3.99680288865056*^-15, \
-1.11351636441162}, {-1.27597621252806, 
              0.309016994374947, -1.11351636441161}, {-0.688190960235588, \
-0.5, -1.11351636441161}, {-1.27597621252806, -1.30901699437495, \
-1.11351636441161}, {-2.22703272882321, -0.999999999999999, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.89250151829098, -2.80901699437486, \
-1.11351636441161}, {-5.30471626599848, -1.99999999999994, \
-1.11351636441164}, {-4.35365974970333, -2.30901699437492, \
-1.11351636441164}, {-4.35365974970336, -3.30901699437492, \
-1.11351636441164}, {-5.30471626599854, -3.61803398874984, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.89250151829098, -3.80901699437486, \
-1.11351636441159}, {-5.46717611411493, -4.11803398874979, \
-0.262865556059539}, {-6.15536707435053, -4.61803398874977, 
              0.262865556059628}, {-7.00601788270259, -4.61803398874978, \
-0.262865556059507}, {-6.84355803458614, -4.1180339887498, \
-1.11351636441158}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-3.76587449741087, -3.11803398874988, \
-1.11351636441165}, {-4.35365974970334, -2.30901699437492, \
-1.11351636441164}, {-3.76587449741084, -1.49999999999997, \
-1.11351636441161}, {-2.8148179811157, -1.80901699437494, -1.11351636441161}, \
{-2.81481798111571, -2.80901699437494, -1.11351636441163}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-4.35365974970333, -2.30901699437492, \
-1.11351636441164}, {-5.30471626599848, -1.99999999999994, \
-1.11351636441164}, {-5.30471626599844, -0.999999999999925, \
-1.11351636441164}, {-4.35365974970328, -0.69098300562502, \
-1.11351636441162}, {-3.76587449741083, -1.49999999999998, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.30471626599848, -1.99999999999994, \
-1.11351636441164}, {-5.89250151829097, -2.80901699437486, \
-1.11351636441161}, {-6.84355803458612, -2.49999999999989, \
-1.11351636441161}, {-6.84355803458611, -1.4999999999999, -1.11351636441163}, \
{-5.89250151829094, -1.19098300562496, -1.11351636441165}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.89250151829097, -2.80901699437486, \
-1.11351636441161}, {-5.89250151829098, -3.80901699437486, \
-1.11351636441159}, {-6.84355803458614, -4.1180339887498, -1.11351636441158}, \
{-7.43134328687859, -3.30901699437483, -1.11351636441159}, \
{-6.84355803458612, -2.49999999999989, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.89250151829094, -0.190983005624973, \
-1.11351636441166}, {-5.89250151829094, -1.19098300562496, \
-1.11351636441165}, {-6.84355803458611, -1.4999999999999, -1.11351636441163}, \
{-7.43134328687856, -0.690983005624947, -1.11351636441164}, \
{-6.84355803458608, 0.118033988750011, -1.11351636441166}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{0.262865556059567, 
              0.809016994374947, -1.11351636441161}, {0.85065080835204, 
              0., -1.11351636441161}, {
              0.262865556059567, -0.809016994374947, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}, {-0.688190960235587, 
              0.5, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{
              0.262865556059567, -0.809016994374947, -1.11351636441161}, {
              0.262865556059567, -1.80901699437495, -1.11351636441161}, \
{-0.688190960235587, -2.1180339887499, -1.11351636441161}, \
{-1.27597621252806, -1.30901699437495, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-1.27597621252806, -2.30901699437495, \
-1.1135163644116}, {-2.22703272882323, -2.61803398874989, -1.1135163644116}, \
{-2.81481798111569, -1.80901699437494, -1.11351636441161}, \
{-2.22703272882321, -0.999999999999999, -1.11351636441161}, \
{-1.27597621252806, -1.30901699437495, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.8148179811157, -1.80901699437494, \
-1.11351636441161}, {-3.76587449741084, -1.49999999999997, \
-1.11351636441161}, {-3.76587449741084, -0.499999999999976, \
-1.1135163644116}, {-2.81481798111567, -0.190983005625042, \
-1.11351636441162}, {-2.22703272882321, -0.999999999999995, \
-1.11351636441161}}]}}}}, {{{{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.22703272882322, -3.99680288865056*^-15, \
-1.11351636441162}, {-1.27597621252806, 
              0.309016994374947, -1.11351636441161}, {-0.688190960235588, \
-0.5, -1.11351636441161}, {-1.27597621252806, -1.30901699437495, \
-1.11351636441161}, {-2.22703272882321, -0.999999999999999, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.89250151829098, -2.80901699437486, \
-1.11351636441161}, {-5.30471626599848, -1.99999999999994, \
-1.11351636441164}, {-4.35365974970333, -2.30901699437492, \
-1.11351636441164}, {-4.35365974970336, -3.30901699437492, \
-1.11351636441164}, {-5.30471626599854, -3.61803398874984, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.89250151829098, -3.80901699437486, \
-1.11351636441159}, {-5.30471626599849, -4.61803398874981, \
-1.11351636441158}, {-5.89250151829097, -5.42705098312477, \
-1.11351636441155}, {-6.84355803458614, -5.11803398874982, \
-1.11351636441156}, {-6.84355803458614, -4.1180339887498, \
-1.11351636441158}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-3.76587449741087, -3.11803398874988, \
-1.11351636441165}, {-4.35365974970334, -2.30901699437492, \
-1.11351636441164}, {-3.76587449741084, -1.49999999999997, \
-1.11351636441161}, {-2.8148179811157, -1.80901699437494, -1.11351636441161}, \
{-2.81481798111571, -2.80901699437494, -1.11351636441163}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-4.35365974970333, -2.30901699437492, \
-1.11351636441164}, {-5.30471626599848, -1.99999999999994, \
-1.11351636441164}, {-5.30471626599844, -0.999999999999925, \
-1.11351636441164}, {-4.35365974970328, -0.69098300562502, \
-1.11351636441162}, {-3.76587449741083, -1.49999999999998, \
-1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.30471626599848, -1.99999999999994, \
-1.11351636441164}, {-5.89250151829097, -2.80901699437486, \
-1.11351636441161}, {-6.84355803458612, -2.49999999999989, \
-1.11351636441161}, {-6.84355803458611, -1.4999999999999, -1.11351636441163}, \
{-5.89250151829094, -1.19098300562496, -1.11351636441165}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.89250151829097, -2.80901699437486, \
-1.11351636441161}, {-5.89250151829098, -3.80901699437486, \
-1.11351636441159}, {-6.84355803458614, -4.1180339887498, -1.11351636441158}, \
{-7.43134328687859, -3.30901699437483, -1.11351636441159}, \
{-6.84355803458612, -2.49999999999989, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-5.89250151829094, -0.190983005624973, \
-1.11351636441166}, {-5.89250151829094, -1.19098300562496, \
-1.11351636441165}, {-6.84355803458611, -1.4999999999999, -1.11351636441163}, \
{-7.43134328687856, -0.690983005624947, -1.11351636441164}, \
{-6.84355803458608, 0.118033988750011, -1.11351636441166}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{0.262865556059567, 
              0.809016994374947, -1.11351636441161}, {0.85065080835204, 
              0., -1.11351636441161}, {
              0.262865556059567, -0.809016994374947, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}, {-0.688190960235587, 
              0.5, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{
              0.262865556059567, -0.809016994374947, -1.11351636441161}, {
              0.262865556059567, -1.80901699437495, -1.11351636441161}, \
{-0.688190960235587, -2.1180339887499, -1.11351636441161}, \
{-1.27597621252806, -1.30901699437495, -1.11351636441161}, \
{-0.688190960235587, -0.5, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-1.27597621252806, -2.30901699437495, \
-1.1135163644116}, {-2.22703272882323, -2.61803398874989, -1.1135163644116}, \
{-2.81481798111569, -1.80901699437494, -1.11351636441161}, \
{-2.22703272882321, -0.999999999999999, -1.11351636441161}, \
{-1.27597621252806, -1.30901699437495, -1.11351636441161}}]}}, {{
             RGBColor[1, 1, 1], 
             
             Polygon[{{-2.8148179811157, -1.80901699437494, \
-1.11351636441161}, {-3.76587449741084, -1.49999999999997, \
-1.11351636441161}, {-3.76587449741084, -0.499999999999976, \
-1.1135163644116}, {-2.81481798111567, -0.190983005625042, \
-1.11351636441162}, {-2.22703272882321, -0.999999999999995, \
-1.11351636441161}}]}}}}}}; Typeset`initDone$$ = True),
    SynchronousInitialization->True,
    UnsavedVariables:>{Typeset`initDone$$},
    UntrackedVariables:>{Typeset`size$$}], "Manipulate",
   Deployed->True,
   StripOnInput->False],
  Manipulate`InterpretManipulate[1]]], "Output",
 CellID->1576688323]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Discussion of Implementation", "Section",
 CellTags->"visualizefacetsurface"],

Cell[TextData[{
 "Like other computational geometry libraries such as CGAL, PolyLink models \
Polyhedra with a structure called a Doubly-Connected Edge List, initially \
introduced by Muller and Preparata [7] and later adopted by much of the \
computational geometry and graphics community [3]. Here, our Polyhedron type \
maintains a record for each vertex, edge, and face.  Given the desired \
manipulation and object oriented framework, a ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " only implementation seemed infeasible, so C# was chosen to provide the \
necessary framework.  ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " can then interact with the data structures to allow evaluation of \
expressions and manipulation of the graphics.\n\nIn our structure, vertices \
are modeled as references to a particular ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " expression. The expression is only evaluated at specific times, so it is \
up to the user to make sure that this expression actually resembles a list of \
three coordinates. This allows the user to represent a vertex as a symbolic \
value, as a set of floating-point numbers, or as a variable, exploiting ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 "\[CloseCurlyQuote]s strength on exact arithmetic and strong expressions.  \
By default, values are kept as symbolic (or exact) expressions, but the call ",
 StyleBox["@MakeNumerical[]",
  FontFamily->"Prestige Elite Std Bold"],
 " in the library converts all values in the structure to floating point \
numbers.  It is worth nothing that moving to real arithmetic introduces the \
possibility of rounding error, but also considerably speeds up computation \
time.\n\nEach edge that lies between two faces (every edge in a well-formed \
polyhedron) is represented by a pair of half-edges. A half-edge holds \
references to two vertices, its own facet, and to three other half-edges. For \
a half-edge ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["h", "i"], TraditionalForm]]],
 " these are defined as\n- ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["p", "i"], TraditionalForm]]],
 ": The half-edge that lies clockwise to ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["h", "i"], TraditionalForm]]],
 " about its owner facet.\n- ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["n", "i"], TraditionalForm]]],
 ": The half-edge that lies counter-clockwise to ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["h", "i"], TraditionalForm]]],
 " about its owner facet.\n- ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["o", "i"], TraditionalForm]]],
 ": The half-edge that lies between the same two vertices as ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["h", "i"], TraditionalForm]]],
 " but bounds the neighboring facet.\n\nFacets are the most simple -- they \
maintain only a link to a single half-edge, which is designate as the \
\[OpenCurlyDoubleQuote]head half-edge\[CloseCurlyDoubleQuote] for that facet. \
A polyhedron, then, has a reference to each facet.  Given the specification \
of a facet and edge, operations can be called in order to modify the \
structure; for example, calling ",
 StyleBox["@Unfold",
  FontFamily->"Prestige Elite Std Bold"],
 " on a half-edge will move the owner facet to rotate until it lies flat with \
the matching half-edge\[CloseCurlyQuote]s owner facet.  \n\nSeveral design \
decisions are worth noting in our implementation (each of which will have \
further demonstration in the next section).  First, operations such as ",
 StyleBox["@Unfold",
  FontFamily->"Prestige Elite Std Bold"],
 " and @",
 StyleBox["CascadingUnfold",
  FontFamily->"Prestige Elite Std Bold"],
 " actually overwrite the object when called.  This design minimizes the need \
for the user to overwrite as changes are made, but potentially makes it more \
difficult to \[OpenCurlyDoubleQuote]backtrack\[CloseCurlyDoubleQuote] to an \
earlier point in the folding unless copies of the object are stored.  The two \
primary options ",
 StyleBox["@Unfold",
  FontFamily->"Prestige Elite Std Bold"],
 " and @",
 StyleBox["CascadingUnfold",
  FontFamily->"Prestige Elite Std Bold"],
 " both unfold a face along a half-edge (to be coplanar with the adjacent \
face), but they differ fundamentally in that one of them unfolds a single \
face and the other unfolds the entire polyhedra along with the face.  Both \
are useful, but care is necessary since their use can also result in \
unintended side effects such as disconnected pieces of the unfolding.\n\nThe \
software allows users to either specify their own polyhedra via \
vertex/edge/face lists specified in a separate .mff file (described in the \
next section), or by making polyhedra based on ",
 StyleBox["Mathematica\[CloseCurlyQuote]",
  FontSlant->"Italic"],
 "s built-in structures (such as the cube in the previous section).  However, \
it is worth nothing that ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " does not always store its structures in a compatible way; for example, the \
stellated dodecahedron is expressed as 20 pentagrams, rather than 100 \
triangles.  As a result, unfolding along half-edges in this structure will \
unfold different disconnected triangles (since it is actually unfolding along \
the pentagrams)."
}], "Text"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Examples of Usage", "Section"],

Cell["\<\
As an alternative to using the built in polyhedron data, a user can define a \
polyhedron using an external .mff file having the following structure:\
\>", "Text",
 CellID->1511728776],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "Vertices", " ", "*)"}], "\n", 
  RowBox[{
   RowBox[{"{", "\n", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"0", ",", "0", ",", "0"}], "}"}], ",", "\n", 
     RowBox[{"{", 
      RowBox[{"0", ",", "1", ",", "0"}], "}"}], ",", "\n", 
     RowBox[{"{", 
      RowBox[{"1", ",", "0", ",", "0"}], "}"}], ",", "\n", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"1", "/", "3"}], ",", 
       RowBox[{"1", "/", "3"}], ",", "1"}], "}"}]}], "\n", "}"}], "\n", 
   RowBox[{"(*", " ", 
    RowBox[{
    "Triples", " ", "of", " ", "Vertices", " ", "which", " ", "make", " ", 
     "up", " ", "faces"}], " ", "*)"}], "\n", 
   RowBox[{"{", "\n", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"0", ",", "1", ",", "2"}], "}"}], ",", "\n", 
     RowBox[{"{", 
      RowBox[{"3", ",", "1", ",", "0"}], "}"}], ",", "\n", 
     RowBox[{"{", 
      RowBox[{"3", ",", "0", ",", "2"}], "}"}], ",", "\n", 
     RowBox[{"{", 
      RowBox[{"3", ",", "2", ",", "1"}], "}"}]}], "\n", "}"}]}]}]], "Code",
 CellID->1075739759],

Cell[TextData[{
 "To load the polyhedra from an .mff file, you use ",
 StyleBox["PolyFromMFF[\[OpenCurlyDoubleQuote]file\[CloseCurlyDoubleQuote]]",
  FontFamily->"Prestige Elite Std Bold"],
 " function."
}], "Text",
 CellID->1811261754],

Cell["", "Text",
 CellID->1423401863],

Cell[TextData[{
 "\nGeometry objects contain a ",
 StyleBox["@Highlight",
  FontFamily->"Prestige Elite Std Bold"],
 " property which emphasizes them when used as a graphics primitive."
}], "Text",
 CellID->480095212],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"cube", "=", 
   RowBox[{"PolyIO`PolyFromName", "[", "\"\<Cube\>\"", "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Graphics3D", "[", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"cube", "@", "Graphics"}], ",", " ", 
    RowBox[{
     RowBox[{"(", 
      RowBox[{"cube", "@", 
       RowBox[{"PickHalfEdge", "[", 
        RowBox[{"1", ",", "3"}], "]"}]}], ")"}], "@", "Highlight"}]}], "}"}], 
  "]"}]}], "Input",
 CellID->691364291],

Cell[BoxData[
 Graphics3DBox[{{
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[1, 2]}}, {{0.5, 0.5, 
       0.5}, {-0.5, 0.5, 0.5}, {-0.5, -0.5, 0.5}, {0.5, -0.5, 0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[1, 2], Rational[-1, 2]}}, {{0.5, 0.5, 0.5}, {
       0.5, -0.5, 0.5}, {0.5, -0.5, -0.5}, {0.5, 0.5, -0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[1, 2]}}, {{0.5, 0.5, 0.5}, {
       0.5, 0.5, -0.5}, {-0.5, 0.5, -0.5}, {-0.5, 0.5, 0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[-1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}}, {{-0.5, 0.5, 
       0.5}, {-0.5, 0.5, -0.5}, {-0.5, -0.5, -0.5}, {-0.5, -0.5, 0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[-1, 2], 
         Rational[-1, 2]}}, {{-0.5, -0.5, -0.5}, {-0.5, 0.5, -0.5}, {0.5, 
       0.5, -0.5}, {0.5, -0.5, -0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[1, 2]}}, {{-0.5, -0.5, 
       0.5}, {-0.5, -0.5, -0.5}, {0.5, -0.5, -0.5}, {0.5, -0.5, 0.5}}]]}}, 
   {RGBColor[1, 0, 0], Thickness[Large], 
    Arrow3DBox[
     NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}, {
       Rational[1, 2], Rational[-1, 2], Rational[1, 2]}}, {{-0.5, -0.5, 
      0.5}, {0.5, -0.5, 0.5}}]]}},
  AutomaticImageSize->True,
  ImageSize->{425.7441844373248, 417.8437482005494},
  ViewPoint->{2.3931831166904405`, -2.066548314693104, 1.2050114659317226`},
  ViewVertical->{0.18418536384164166`, -0.19246819063083304`, 
   0.9638629297476978}]], "Output",
 CellID->647598643]
}, Open  ]],

Cell[TextData[{
 "Half-edges are kept in linked lists. You can access the previous and next \
half-edge in a list by using the ",
 StyleBox["@Prev",
  FontFamily->"Prestige Elite Std Bold"],
 " and ",
 StyleBox["@Next",
  FontFamily->"Prestige Elite Std Bold"],
 " functions.  ",
 StyleBox["@Opposite",
  FontFamily->"Prestige Elite Std Bold"],
 " gives the half-edge which corresponds to the same edge of the polyhedron, \
but which bounds the adjacent facet."
}], "Text",
 PageWidth->WindowWidth,
 Evaluatable->False,
 CellID->1253523743],

Cell[CellGroupData[{

Cell[BoxData[{
 StyleBox[
  RowBox[{
   RowBox[{"halfEdge", "=", 
    RowBox[{"cube", "@", 
     RowBox[{"PickHalfEdge", "[", 
      RowBox[{"1", ",", "3"}], "]"}]}]}], ";"}],
  FontSize->11], "\[IndentingNewLine]", 
 StyleBox[
  RowBox[{
   RowBox[{"prev", " ", "=", " ", 
    RowBox[{"halfEdge", "@", "Prev"}]}], ";"}],
  FontSize->11], "\[IndentingNewLine]", 
 StyleBox[
  RowBox[{
   RowBox[{"next", " ", "=", " ", 
    RowBox[{"halfEdge", "@", "Next"}]}], ";"}],
  FontSize->11], "\[IndentingNewLine]", 
 StyleBox[
  RowBox[{
   RowBox[{"opp", " ", "=", " ", 
    RowBox[{"halfEdge", "@", "Opposite"}]}], ";"}],
  FontSize->11], "\[IndentingNewLine]", 
 StyleBox[
  RowBox[{"Graphics3D", "[", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"cube", "@", "Graphics"}], ",", 
     RowBox[{"prev", "@", "Highlight"}], ",", 
     RowBox[{"next", "@", "Highlight"}], ",", 
     RowBox[{"opp", "@", "Highlight"}]}], "}"}], "]"}],
  FontSize->11]}], "Input",
 FontSize->9,
 CellID->1158971531],

Cell[BoxData[
 Graphics3DBox[{{
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[1, 2]}}, {{0.5, 0.5, 
       0.5}, {-0.5, 0.5, 0.5}, {-0.5, -0.5, 0.5}, {0.5, -0.5, 0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[1, 2], Rational[-1, 2]}}, {{0.5, 0.5, 0.5}, {
       0.5, -0.5, 0.5}, {0.5, -0.5, -0.5}, {0.5, 0.5, -0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[1, 2]}}, {{0.5, 0.5, 0.5}, {
       0.5, 0.5, -0.5}, {-0.5, 0.5, -0.5}, {-0.5, 0.5, 0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[-1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}}, {{-0.5, 0.5, 
       0.5}, {-0.5, 0.5, -0.5}, {-0.5, -0.5, -0.5}, {-0.5, -0.5, 0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[-1, 2], 
         Rational[-1, 2]}}, {{-0.5, -0.5, -0.5}, {-0.5, 0.5, -0.5}, {0.5, 
       0.5, -0.5}, {0.5, -0.5, -0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[1, 2]}}, {{-0.5, -0.5, 
       0.5}, {-0.5, -0.5, -0.5}, {0.5, -0.5, -0.5}, {0.5, -0.5, 0.5}}]]}}, 
   {RGBColor[1, 0, 0], Thickness[Large], 
    Arrow3DBox[
     NCache[{{Rational[-1, 2], Rational[1, 2], Rational[1, 2]}, {
       Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}}, {{-0.5, 0.5, 
      0.5}, {-0.5, -0.5, 0.5}}]]}, 
   {RGBColor[1, 0, 0], Thickness[Large], 
    Arrow3DBox[
     NCache[{{Rational[1, 2], Rational[-1, 2], Rational[1, 2]}, {
       Rational[1, 2], Rational[1, 2], Rational[1, 2]}}, {{0.5, -0.5, 0.5}, {
      0.5, 0.5, 0.5}}]]}, 
   {RGBColor[1, 0, 0], Thickness[Large], 
    Arrow3DBox[
     NCache[{{Rational[1, 2], Rational[-1, 2], Rational[1, 2]}, {
       Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}}, {{0.5, -0.5, 
      0.5}, {-0.5, -0.5, 0.5}}]]}},
  AutomaticImageSize->True,
  ImageSize->{323.63291037160735`, 378.4527703779374},
  ViewPoint->{0.39266521459659176`, -2.64611862599432, 2.0721655933857566`},
  ViewVertical->{0.025815538835627178`, 0.030478176793187768`, 
   0.9992020009457493}]], "Output",
 CellID->743269905]
}, Open  ]],

Cell[TextData[{
 "The locations of vertices can be modified calling the ",
 StyleBox["@Expr",
  FontFamily->"Prestige Elite Std Bold"],
 " function on a vertex."
}], "Text",
 CellID->684085901],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"cube", " ", "=", " ", 
   RowBox[{"PolyIO`PolyFromName", "[", "\"\<Cube\>\"", "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Graphics3D", "[", 
  RowBox[{"cube", "@", "Graphics"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"p1", "=", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{"cube", "@", 
      RowBox[{"PickHalfEdge", "[", 
       RowBox[{"1", ",", "1"}], "]"}]}], ")"}], "@", "Start"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"p2", "=", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{"cube", "@", 
      RowBox[{"PickHalfEdge", "[", 
       RowBox[{"1", ",", "2"}], "]"}]}], ")"}], "@", "Start"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"p3", "=", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{"cube", "@", 
      RowBox[{"PickHalfEdge", "[", 
       RowBox[{"1", ",", "3"}], "]"}]}], ")"}], "@", "Start"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"p4", "=", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{"cube", "@", 
      RowBox[{"PickHalfEdge", "[", 
       RowBox[{"1", ",", "4"}], "]"}]}], ")"}], "@", "Start"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"p1", "@", "Expr"}], " ", "=", " ", 
   RowBox[{"{", 
    RowBox[{"1", ",", "1", ",", "1"}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"p2", "@", "Expr"}], " ", "=", " ", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "1"}], ",", "1", ",", "1"}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"p3", "@", "Expr"}], " ", "=", " ", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "1"}], ",", 
     RowBox[{"-", "1"}], ",", "1"}], "}"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"p4", "@", "Expr"}], " ", "=", " ", 
   RowBox[{"{", 
    RowBox[{"1", ",", 
     RowBox[{"-", "1"}], ",", "1"}], "}"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Graphics3D", "[", 
  RowBox[{"cube", "@", "Graphics"}], "]"}]}], "Input",
 CellID->561520948],

Cell[BoxData[
 Graphics3DBox[{
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[1, 2]}, {
       Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}, {
       Rational[1, 2], Rational[-1, 2], Rational[1, 2]}}, {{0.5, 0.5, 
      0.5}, {-0.5, 0.5, 0.5}, {-0.5, -0.5, 0.5}, {0.5, -0.5, 0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
       Rational[1, 2], Rational[-1, 2], Rational[1, 2]}, {
       Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[1, 2], Rational[-1, 2]}}, {{0.5, 0.5, 0.5}, {
      0.5, -0.5, 0.5}, {0.5, -0.5, -0.5}, {0.5, 0.5, -0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
       Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[1, 2]}}, {{0.5, 0.5, 0.5}, {
      0.5, 0.5, -0.5}, {-0.5, 0.5, -0.5}, {-0.5, 0.5, 0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[-1, 2], Rational[1, 2], Rational[1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}}, {{-0.5, 0.5, 
      0.5}, {-0.5, 0.5, -0.5}, {-0.5, -0.5, -0.5}, {-0.5, -0.5, 0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[-1, 2], 
        Rational[-1, 2]}}, {{-0.5, -0.5, -0.5}, {-0.5, 0.5, -0.5}, {0.5, 
      0.5, -0.5}, {0.5, -0.5, -0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}, {
       Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[-1, 2], Rational[1, 2]}}, {{-0.5, -0.5, 
      0.5}, {-0.5, -0.5, -0.5}, {0.5, -0.5, -0.5}, {0.5, -0.5, 
      0.5}}]]}}]], "Output",
 CellID->224918736],

Cell[BoxData[
 Graphics3DBox[{
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{1, 1, 1}, {-1, 1, 1}, {-1, -1, 1}, {1, -1, 1}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{1, 1, 1}, {1, -1, 1}, {
       Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[1, 2], Rational[-1, 2]}}, {{1, 1, 1}, {1, -1, 
       1}, {0.5, -0.5, -0.5}, {0.5, 0.5, -0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{1, 1, 1}, {Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {-1, 1, 1}}, {{1, 1,
        1}, {0.5, 0.5, -0.5}, {-0.5, 0.5, -0.5}, {-1, 1, 1}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{-1, 1, 1}, {Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {-1, -1, 1}}, {{-1,
        1, 1}, {-0.5, 0.5, -0.5}, {-0.5, -0.5, -0.5}, {-1, -1, 1}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[-1, 2], 
        Rational[-1, 2]}}, {{-0.5, -0.5, -0.5}, {-0.5, 0.5, -0.5}, {0.5, 
      0.5, -0.5}, {0.5, -0.5, -0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{-1, -1, 1}, {
       Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {1, -1, 
       1}}, {{-1, -1, 1}, {-0.5, -0.5, -0.5}, {0.5, -0.5, -0.5}, {1, -1, 
       1}}]]}}]], "Output",
 CellID->637977232]
}, Open  ]],

Cell[TextData[{
 "Note that PolyLink does NOT require the vertices of a facet to be coplanar. \
 Midway through an operation you may have an invalid shape.  In this case, ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " still renders it but the face will not be accurately shaded."
}], "Text",
 PageWidth->WindowWidth,
 Evaluatable->False,
 CellID->1885448352],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"p4", "@", "Expr"}], " ", "=", " ", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "0"}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Graphics3D", "[", 
  RowBox[{"cube", "@", "Graphics"}], "]"}]}], "Input",
 CellID->461756932],

Cell[BoxData[
 Graphics3DBox[{
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{1, 1, 1}, {-1, 1, 1}, {-1, -1, 1}, {0, 0, 0}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{1, 1, 1}, {0, 0, 0}, {
       Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[1, 2], Rational[-1, 2]}}, {{1, 1, 1}, {0, 0, 
       0}, {0.5, -0.5, -0.5}, {0.5, 0.5, -0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{1, 1, 1}, {Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {-1, 1, 1}}, {{1, 1,
        1}, {0.5, 0.5, -0.5}, {-0.5, 0.5, -0.5}, {-1, 1, 1}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{-1, 1, 1}, {Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {-1, -1, 1}}, {{-1,
        1, 1}, {-0.5, 0.5, -0.5}, {-0.5, -0.5, -0.5}, {-1, -1, 1}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[-1, 2], 
        Rational[-1, 2]}}, {{-0.5, -0.5, -0.5}, {-0.5, 0.5, -0.5}, {0.5, 
      0.5, -0.5}, {0.5, -0.5, -0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{-1, -1, 1}, {
       Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {0, 0, 
       0}}, {{-1, -1, 1}, {-0.5, -0.5, -0.5}, {0.5, -0.5, -0.5}, {0, 0, 
       0}}]]}},
  AutomaticImageSize->True,
  ImageSize->{401.9596400927176, 312.14854557208895`},
  ViewPoint->{1.9262462741946316`, -2.5829291430687245`, 1.033466174113872},
  ViewVertical->{0.3487334988237198, -0.14368024456733208`, 
   1.2348573892427959`}]], "Output",
 CellID->97488753]
}, Open  ]],

Cell[TextData[{
 "\nYou can manually subdivide faces of a polyhedron by calling the @",
 StyleBox["SubDivide[p1,p2] ",
  FontFamily->"Prestige Elite Std Bold"],
 "function on a facet.  This function returns a new facet, which the user can \
either discard (to cut holes in a shape) or add to the polyhedron\
\[CloseCurlyQuote]s facet list. Once added, the new facet behaves exactly \
like every other facet.  We begin by inserting an edge across face 1 of the \
cube by selecting the start vertices of half-edges 1 and 3, then show the \
cube if we leave a hole in the polyhedron and if we add the facet into the \
cube\[CloseCurlyQuote]s facet list."
}], "Text",
 CellID->1864247904],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"cube", " ", "=", " ", 
   RowBox[{"PolyIO`PolyFromName", "[", "\"\<Cube\>\"", "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Graphics3D", "[", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"cube", "@", "Graphics"}], ",", 
    RowBox[{"cube", "@", "AllLabels"}]}], "}"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"p1", "=", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{"cube", "@", 
      RowBox[{"PickHalfEdge", "[", 
       RowBox[{"1", ",", "1"}], "]"}]}], ")"}], "@", "Start"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"p3", "=", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{"cube", "@", 
      RowBox[{"PickHalfEdge", "[", 
       RowBox[{"1", ",", "3"}], "]"}]}], ")"}], "@", "Start"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"newFacet", "=", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{"cube", "@", 
      RowBox[{"PickFacet", "[", "1", "]"}]}], ")"}], "@", 
    RowBox[{"SubDivide", "[", 
     RowBox[{"p1", ",", "p3"}], "]"}]}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Graphics3D", "[", 
  RowBox[{"cube", "@", "Graphics"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"(", 
   RowBox[{"cube", "@", 
    RowBox[{"AddFacet", "[", "newFacet", "]"}]}], ")"}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Graphics3D", "[", 
  RowBox[{"cube", "@", "Graphics"}], "]"}], "\[IndentingNewLine]"}], "Input",
 CellID->223535809],

Cell[BoxData[
 Graphics3DBox[{{
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[1, 2]}}, {{0.5, 0.5, 
       0.5}, {-0.5, 0.5, 0.5}, {-0.5, -0.5, 0.5}, {0.5, -0.5, 0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[1, 2], Rational[-1, 2]}}, {{0.5, 0.5, 0.5}, {
       0.5, -0.5, 0.5}, {0.5, -0.5, -0.5}, {0.5, 0.5, -0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[1, 2]}}, {{0.5, 0.5, 0.5}, {
       0.5, 0.5, -0.5}, {-0.5, 0.5, -0.5}, {-0.5, 0.5, 0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[-1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}}, {{-0.5, 0.5, 
       0.5}, {-0.5, 0.5, -0.5}, {-0.5, -0.5, -0.5}, {-0.5, -0.5, 0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[-1, 2], 
         Rational[-1, 2]}}, {{-0.5, -0.5, -0.5}, {-0.5, 0.5, -0.5}, {0.5, 
       0.5, -0.5}, {0.5, -0.5, -0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[1, 2]}}, {{-0.5, -0.5, 
       0.5}, {-0.5, -0.5, -0.5}, {0.5, -0.5, -0.5}, {0.5, -0.5, 0.5}}]]}}, {{
     Inset3DBox["1", {0., 0., 0.6}], {Inset3DBox["1", {0., 0.5, 0.55},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["2", {-0.5, 0., 0.55},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["3", {0., -0.5, 0.55},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["4", {0.5, 0., 0.55},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}]}}, {
     Inset3DBox["2", {0.6, 0., 0.}], {Inset3DBox["1", {0.55, 0., 0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["2", {0.55, -0.5, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["3", {0.55, 0., -0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["4", {0.55, 0.5, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}]}}, {
     Inset3DBox["3", {0., 0.6, 0.}], {Inset3DBox["1", {0.5, 0.55, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["2", {0., 0.55, -0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["3", {-0.5, 0.55, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["4", {0., 0.55, 0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}]}}, {
     Inset3DBox["4", {-0.6, 0., 0.}], {Inset3DBox["1", {-0.55, 0.5, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["2", {-0.55, 0., -0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["3", {-0.55, -0.5, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["4", {-0.55, 0., 0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}]}}, {
     Inset3DBox["5", {0., 0., -0.6}], {Inset3DBox["1", {-0.5, 0., -0.55},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["2", {0., 0.5, -0.55},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["3", {0.5, 0., -0.55},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["4", {0., -0.5, -0.55},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}]}}, {
     Inset3DBox["6", {0., -0.6, 0.}], {Inset3DBox["1", {-0.5, -0.55, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["2", {0., -0.55, -0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["3", {0.5, -0.55, 0.},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}], Inset3DBox["4", {0., -0.55, 0.5},
       BaseStyle->{
         RGBColor[0, 0, 
          Rational[2, 3]], Italic}]}}}},
  AutomaticImageSize->True,
  ImageSize->{356.3646555948517, 384.11347170947755`},
  ViewPoint->{1.3501791786965505`, -2.4374912695743323`, 1.9198053276734122`},
  
  ViewVertical->{0.020014225408599064`, -0.022165490309554045`, 
   0.9995539614351148}]], "Output",
 CellID->2110932657],

Cell[BoxData[
 Graphics3DBox[{
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[1, 2]}, {
       Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}}, {{0.5, 0.5, 
      0.5}, {-0.5, 0.5, 0.5}, {-0.5, -0.5, 0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
       Rational[1, 2], Rational[-1, 2], Rational[1, 2]}, {
       Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[1, 2], Rational[-1, 2]}}, {{0.5, 0.5, 0.5}, {
      0.5, -0.5, 0.5}, {0.5, -0.5, -0.5}, {0.5, 0.5, -0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
       Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[1, 2]}}, {{0.5, 0.5, 0.5}, {
      0.5, 0.5, -0.5}, {-0.5, 0.5, -0.5}, {-0.5, 0.5, 0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[-1, 2], Rational[1, 2], Rational[1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}}, {{-0.5, 0.5, 
      0.5}, {-0.5, 0.5, -0.5}, {-0.5, -0.5, -0.5}, {-0.5, -0.5, 0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[-1, 2], 
        Rational[-1, 2]}}, {{-0.5, -0.5, -0.5}, {-0.5, 0.5, -0.5}, {0.5, 
      0.5, -0.5}, {0.5, -0.5, -0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}, {
       Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[-1, 2], Rational[1, 2]}}, {{-0.5, -0.5, 
      0.5}, {-0.5, -0.5, -0.5}, {0.5, -0.5, -0.5}, {0.5, -0.5, 0.5}}]]}},
  AutomaticImageSize->True,
  ImageSize->{356.3646555948517, 384.11347170947755`},
  ViewPoint->{1.3501791786965505`, -2.4374912695743323`, 1.9198053276734122`},
  
  ViewVertical->{0.020014225408599064`, -0.022165490309554045`, 
   0.9995539614351148}]], "Output",
 CellID->2015317759],

Cell[BoxData[
 Graphics3DBox[{
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[1, 2]}, {
       Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}}, {{0.5, 0.5, 
      0.5}, {-0.5, 0.5, 0.5}, {-0.5, -0.5, 0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
       Rational[1, 2], Rational[-1, 2], Rational[1, 2]}, {
       Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[1, 2], Rational[-1, 2]}}, {{0.5, 0.5, 0.5}, {
      0.5, -0.5, 0.5}, {0.5, -0.5, -0.5}, {0.5, 0.5, -0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
       Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[1, 2]}}, {{0.5, 0.5, 0.5}, {
      0.5, 0.5, -0.5}, {-0.5, 0.5, -0.5}, {-0.5, 0.5, 0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[-1, 2], Rational[1, 2], Rational[1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}}, {{-0.5, 0.5, 
      0.5}, {-0.5, 0.5, -0.5}, {-0.5, -0.5, -0.5}, {-0.5, -0.5, 0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[-1, 2], 
        Rational[-1, 2]}}, {{-0.5, -0.5, -0.5}, {-0.5, 0.5, -0.5}, {0.5, 
      0.5, -0.5}, {0.5, -0.5, -0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}, {
       Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {
       Rational[1, 2], Rational[-1, 2], Rational[1, 2]}}, {{-0.5, -0.5, 
      0.5}, {-0.5, -0.5, -0.5}, {0.5, -0.5, -0.5}, {0.5, -0.5, 0.5}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
       Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}, {
       Rational[1, 2], Rational[-1, 2], Rational[1, 2]}}, {{0.5, 0.5, 
      0.5}, {-0.5, -0.5, 0.5}, {0.5, -0.5, 0.5}}]]}},
  AutomaticImageSize->True,
  ImageSize->{356.3646555948517, 384.11347170947755`},
  ViewPoint->{1.3501791786965505`, -2.4374912695743323`, 1.9198053276734122`},
  
  ViewVertical->{0.020014225408599064`, -0.022165490309554045`, 
   0.9995539614351148}]], "Output",
 CellID->1333495029]
}, Open  ]],

Cell[TextData[{
 "After unfolding a face along a half-edge, you can have PolyLink show the \
symbolic link between ",
 "half-edge",
 "s.  Calling @",
 StyleBox["HalfEdgeGraphics",
  FontFamily->"Prestige Elite Std Bold"],
 " on the polyhedron shows these symbolic links.  "
}], "Text",
 CellID->1960301734],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"(", 
    RowBox[{"cube", "@", 
     RowBox[{"PickHalfEdge", "[", 
      RowBox[{"7", ",", "3"}], "]"}]}], ")"}], "@", 
   RowBox[{"Unfold", "[", "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Graphics3D", "[", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"cube", "@", "Graphics"}], ",", " ", 
    RowBox[{"cube", "@", "HalfEdgeGraphics"}]}], "}"}], "]"}]}], "Input",
 CellID->897543842],

Cell[BoxData[
 Graphics3DBox[{{
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}}, {{0.5, 0.5, 
       0.5}, {-0.5, 0.5, 0.5}, {-0.5, -0.5, 0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[1, 2], Rational[-1, 2]}}, {{0.5, 0.5, 0.5}, {
       0.5, -0.5, 0.5}, {0.5, -0.5, -0.5}, {0.5, 0.5, -0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[1, 2]}}, {{0.5, 0.5, 0.5}, {
       0.5, 0.5, -0.5}, {-0.5, 0.5, -0.5}, {-0.5, 0.5, 0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[-1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}}, {{-0.5, 0.5, 
       0.5}, {-0.5, 0.5, -0.5}, {-0.5, -0.5, -0.5}, {-0.5, -0.5, 0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[-1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[-1, 2], 
         Rational[-1, 2]}}, {{-0.5, -0.5, -0.5}, {-0.5, 0.5, -0.5}, {0.5, 
       0.5, -0.5}, {0.5, -0.5, -0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[-1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[1, 2]}}, {{-0.5, -0.5, 
       0.5}, {-0.5, -0.5, -0.5}, {0.5, -0.5, -0.5}, {0.5, -0.5, 0.5}}]]}, 
    {RGBColor[1, 1, 1], 
     Polygon3DBox[
      NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[3, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[1, 2]}}, {{0.5, 0.5, 0.5}, {
       0.5, -0.5, 1.5}, {0.5, -0.5, 0.5}}]]}}, {
    {Dashing[{Small, Small}], 
     Arrow3DBox[
      NCache[{{Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[3, 2]}}, {{-0.5, -0.5, 
       0.5}, {0.5, -0.5, 1.5}}]]}, 
    {Dashing[{Small, Small}], 
     Arrow3DBox[
      NCache[{{Rational[1, 2], Rational[-1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[-1, 2], Rational[1, 2]}}, {{0.5, -0.5, 
       0.5}, {0.5, -0.5, 0.5}}]]}, 
    {Dashing[{Small, Small}], 
     Arrow3DBox[
      NCache[{{Rational[1, 2], Rational[1, 2], Rational[1, 2]}, {
        Rational[1, 2], Rational[1, 2], Rational[1, 2]}}, {{0.5, 0.5, 0.5}, {
       0.5, 0.5, 0.5}}]]}, 
    {Dashing[{Small, Small}], 
     Arrow3DBox[
      NCache[{{Rational[1, 2], Rational[-1, 2], Rational[3, 2]}, {
        Rational[-1, 2], Rational[-1, 2], Rational[1, 2]}}, {{0.5, -0.5, 
       1.5}, {-0.5, -0.5, 0.5}}]]}}},
  AutomaticImageSize->True,
  ImageSize->{307.4976008230209, 486.89596560321087`},
  ViewPoint->{1.5350179070379584`, -2.4532289476692206`, 1.7536783500375925`},
  
  ViewVertical->{0.415940714906294, -0.4698401431646848, 
   0.9495056031369996}]], "Output",
 CellID->911612311]
}, Open  ]],

Cell[TextData[{
 "PolyLink also has the ability to triangulate a polyhedron.  For polyhedra \
with irrational coordinates for vertices, numerically estimating the vertices \
by calling ",
 StyleBox["@MakeNumerical[]",
  FontFamily->"Prestige Elite Std Bold"],
 " on a polyhedron results in faster performance.  Here we triangulate a \
dodecahedron after converting it\[CloseCurlyQuote]s vertices to floating \
point values."
}], "Text",
 CellID->280680454],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"dodec", "=", 
   RowBox[{"PolyIO`PolyFromName", "[", "\"\<Dodecahedron\>\"", "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"dodec", "@", 
   RowBox[{"MakeNumerical", "[", "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"dodec", "@", 
   RowBox[{"Triangulate", "[", "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Graphics3D", "[", 
  RowBox[{"dodec", "@", "Graphics"}], "]"}]}], "Input",
 CellID->1645710326],

Cell[BoxData[
 Graphics3DBox[{
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-1.11351636441161, 
     0.809016994374947, -0.262865556059567}, {-0.688190960235587, 
     0.5, -1.11351636441161}, {-1.37638192047117, 0., 0.262865556059567}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{1.37638192047117, 0., -0.262865556059567}, {
     1.11351636441161, 0.809016994374947, 0.262865556059567}, {
     1.11351636441161, -0.809016994374947, 0.262865556059567}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{1.11351636441161, -0.809016994374947, 0.262865556059567}, {
     0.688190960235587, -0.5, 1.11351636441161}, {
     0.42532540417602, -1.30901699437495, -0.262865556059567}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{0.688190960235587, -0.5, 1.11351636441161}, {
     0.688190960235587, 0.5, 
     1.11351636441161}, {-0.262865556059567, -0.809016994374947, 
     1.11351636441161}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{0.688190960235587, 0.5, 1.11351636441161}, {
     1.11351636441161, 0.809016994374947, 
     0.262865556059567}, {-0.262865556059567, 0.809016994374947, 
     1.11351636441161}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{1.11351636441161, 0.809016994374947, 0.262865556059567}, {
     1.37638192047117, 0., -0.262865556059567}, {0.42532540417602, 
     1.30901699437495, -0.262865556059567}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{1.37638192047117, 0., -0.262865556059567}, {
     1.11351636441161, -0.809016994374947, 0.262865556059567}, {
     0.85065080835204, 0., -1.11351636441161}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.42532540417602, 1.30901699437495, 0.262865556059567}, {
     0.42532540417602, 
     1.30901699437495, -0.262865556059567}, {-1.11351636441161, 
     0.809016994374947, -0.262865556059567}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{0.262865556059567, 0.809016994374947, -1.11351636441161}, {
     0.85065080835204, 0., -1.11351636441161}, {-0.688190960235587, 
     0.5, -1.11351636441161}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{
     0.262865556059567, -0.809016994374947, -1.11351636441161}, {
     0.42532540417602, -1.30901699437495, -0.262865556059567}, \
{-0.688190960235587, -0.5, -1.11351636441161}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.42532540417602, -1.30901699437495, 
     0.262865556059567}, {-0.262865556059567, -0.809016994374947, 
     1.11351636441161}, {-1.11351636441161, -0.809016994374947, \
-0.262865556059567}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.85065080835204, 0., 
     1.11351636441161}, {-0.262865556059567, 0.809016994374947, 
     1.11351636441161}, {-1.37638192047117, 0., 0.262865556059567}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-1.11351636441161, -0.809016994374947, \
-0.262865556059567}, {-0.688190960235587, 
     0.5, -1.11351636441161}, {-0.688190960235587, -0.5, \
-1.11351636441161}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-1.37638192047117, 0., 
     0.262865556059567}, {-0.688190960235587, 
     0.5, -1.11351636441161}, {-1.11351636441161, -0.809016994374947, \
-0.262865556059567}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{0.688190960235587, -0.5, 1.11351636441161}, {
     1.11351636441161, 0.809016994374947, 0.262865556059567}, {
     0.688190960235587, 0.5, 1.11351636441161}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{1.11351636441161, -0.809016994374947, 0.262865556059567}, {
     1.11351636441161, 0.809016994374947, 0.262865556059567}, {
     0.688190960235587, -0.5, 1.11351636441161}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.42532540417602, -1.30901699437495, 0.262865556059567}, {
     0.688190960235587, -0.5, 
     1.11351636441161}, {-0.262865556059567, -0.809016994374947, 
     1.11351636441161}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{0.42532540417602, -1.30901699437495, -0.262865556059567}, {
     0.688190960235587, -0.5, 
     1.11351636441161}, {-0.42532540417602, -1.30901699437495, 
     0.262865556059567}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.85065080835204, 0., 1.11351636441161}, {
     0.688190960235587, 0.5, 1.11351636441161}, {-0.262865556059567, 
     0.809016994374947, 1.11351636441161}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.262865556059567, -0.809016994374947, 
     1.11351636441161}, {0.688190960235587, 0.5, 
     1.11351636441161}, {-0.85065080835204, 0., 1.11351636441161}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.42532540417602, 1.30901699437495, 0.262865556059567}, {
     1.11351636441161, 0.809016994374947, 0.262865556059567}, {
     0.42532540417602, 1.30901699437495, -0.262865556059567}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.262865556059567, 0.809016994374947, 1.11351636441161}, {
     1.11351636441161, 0.809016994374947, 
     0.262865556059567}, {-0.42532540417602, 1.30901699437495, 
     0.262865556059567}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{0.262865556059567, 0.809016994374947, -1.11351636441161}, {
     1.37638192047117, 0., -0.262865556059567}, {0.85065080835204, 
     0., -1.11351636441161}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{0.42532540417602, 1.30901699437495, -0.262865556059567}, {
     1.37638192047117, 0., -0.262865556059567}, {0.262865556059567, 
     0.809016994374947, -1.11351636441161}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{
     0.262865556059567, -0.809016994374947, -1.11351636441161}, {
     1.11351636441161, -0.809016994374947, 0.262865556059567}, {
     0.42532540417602, -1.30901699437495, -0.262865556059567}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{0.85065080835204, 0., -1.11351636441161}, {
     1.11351636441161, -0.809016994374947, 0.262865556059567}, {
     0.262865556059567, -0.809016994374947, -1.11351636441161}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.688190960235587, 0.5, -1.11351636441161}, {
     0.42532540417602, 1.30901699437495, -0.262865556059567}, {
     0.262865556059567, 0.809016994374947, -1.11351636441161}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-1.11351636441161, 
     0.809016994374947, -0.262865556059567}, {0.42532540417602, 
     1.30901699437495, -0.262865556059567}, {-0.688190960235587, 
     0.5, -1.11351636441161}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.688190960235587, -0.5, -1.11351636441161}, {
     0.85065080835204, 0., -1.11351636441161}, {
     0.262865556059567, -0.809016994374947, -1.11351636441161}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.688190960235587, 0.5, -1.11351636441161}, {
     0.85065080835204, 
     0., -1.11351636441161}, {-0.688190960235587, -0.5, -1.11351636441161}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-1.11351636441161, -0.809016994374947, \
-0.262865556059567}, {
     0.42532540417602, -1.30901699437495, -0.262865556059567}, \
{-0.42532540417602, -1.30901699437495, 0.262865556059567}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.688190960235587, -0.5, -1.11351636441161}, {
     0.42532540417602, -1.30901699437495, -0.262865556059567}, \
{-1.11351636441161, -0.809016994374947, -0.262865556059567}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-1.37638192047117, 0., 
     0.262865556059567}, {-0.262865556059567, -0.809016994374947, 
     1.11351636441161}, {-0.85065080835204, 0., 1.11351636441161}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-1.11351636441161, -0.809016994374947, \
-0.262865556059567}, {-0.262865556059567, -0.809016994374947, 
     1.11351636441161}, {-1.37638192047117, 0., 0.262865556059567}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-1.11351636441161, 
     0.809016994374947, -0.262865556059567}, {-0.262865556059567, 
     0.809016994374947, 1.11351636441161}, {-0.42532540417602, 
     1.30901699437495, 0.262865556059567}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-1.37638192047117, 0., 
     0.262865556059567}, {-0.262865556059567, 0.809016994374947, 
     1.11351636441161}, {-1.11351636441161, 
     0.809016994374947, -0.262865556059567}}]}},
  AutomaticImageSize->True,
  ImageSize->{355.25452094398963`, 379.4832421732354},
  ViewPoint->{0.7625746586208029, -2.186298250465505, 2.4675047821718277`},
  ViewVertical->{-0.16786675959403452`, 0.13627901329361958`, 
   1.2079503934815896`}]], "Output",
 CellID->96382170]
}, Open  ]],

Cell[TextData[{
 "The ",
 StyleBox["Polyhedron@CloneAll[]",
  FontFamily->"Prestige Elite Std Bold"],
 " method creates a clone of the shape you are working with. The ",
 StyleBox["Polyhedron@Triangulate[]",
  FontFamily->"Prestige Elite Std Bold"],
 " method triangulates all facets. Here we clone a shape, triangulate the \
original, and then draw both it and its clone."
}], "Text",
 PageWidth->WindowWidth,
 Evaluatable->False,
 CellID->954616986],

Cell[CellGroupData[{

Cell[BoxData[{
 StyleBox[
  RowBox[{
   RowBox[{"dodec", "=", 
    RowBox[{"PolyIO`PolyFromName", "[", "\"\<Dodecahedron\>\"", "]"}]}], ";"}],
  FontSize->11], "\[IndentingNewLine]", 
 StyleBox[
  RowBox[{
   RowBox[{"dodec2", " ", "=", " ", 
    RowBox[{"dodec", "@", 
     RowBox[{"CloneAll", "[", "]"}]}]}], ";"}],
  FontSize->11], "\[IndentingNewLine]", 
 StyleBox[
  RowBox[{
   RowBox[{"dodec", "@", 
    RowBox[{"Triangulate", "[", "]"}]}], ";"}],
  FontSize->11], "\[IndentingNewLine]", 
 StyleBox[
  RowBox[{"Graphics3D", "[", 
   RowBox[{"dodec", "@", "Graphics"}], "]"}],
  FontSize->11], "\[IndentingNewLine]", 
 StyleBox[
  RowBox[{"Graphics3D", "[", 
   RowBox[{"dodec2", "@", "Graphics"}], "]"}],
  FontSize->11]}], "Input",
 FontSize->9,
 CellID->397356965],

Cell[BoxData[
 Graphics3DBox[{
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 100 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {
       Rational[-1, 2] (1 + 2 5^Rational[-1, 2])^Rational[1, 2], Rational[
        1, 2], Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}, {-(1 + 2 5^Rational[-1, 2])^
         Rational[1, 2], 0, Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}}, {{-1.1135163644116068`, 
       0.8090169943749475, -0.2628655560595668}, {-0.6881909602355868, 
       0.5, -1.1135163644116068`}, {-1.3763819204711736`, 0, 
        0.2628655560595668}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{(1 + 2 5^Rational[-1, 2])^Rational[1, 2], 0, Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {(Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {(Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}}, {{
       1.3763819204711736`, 0, -0.2628655560595668}, {1.1135163644116066`, 
       0.8090169943749475, 0.2628655560595668}, {
       1.1135163644116066`, -0.8090169943749475, 0.2628655560595668}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{(Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2], Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {(Rational[1, 4] + 
         Rational[1, 2] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[-1, 2], (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {(Rational[1, 8] + Rational[1, 8] 5^Rational[-1, 2])^
        Rational[1, 2], Rational[1, 4] (-3 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}}, {{
      1.1135163644116066`, -0.8090169943749475, 0.2628655560595668}, {
      0.6881909602355868, -0.5, 1.1135163644116066`}, {
      0.42532540417601994`, -1.3090169943749475`, -0.2628655560595668}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{(Rational[1, 4] + Rational[1, 2] 5^Rational[-1, 2])^
        Rational[1, 2], 
        Rational[-1, 2], (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {(Rational[1, 4] + Rational[1, 2] 5^Rational[-1, 2])^
        Rational[1, 2], Rational[
        1, 2], (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {
       Root[1 - 20 #^2 + 80 #^4& , 2, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), (Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2]}}, {{
      0.6881909602355868, -0.5, 1.1135163644116066`}, {0.6881909602355868, 
      0.5, 1.1135163644116066`}, {-0.2628655560595668, -0.8090169943749475, 
      1.1135163644116066`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{(Rational[1, 4] + Rational[1, 2] 5^Rational[-1, 2])^
        Rational[1, 2], Rational[
        1, 2], (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {(Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {
       Root[1 - 20 #^2 + 80 #^4& , 2, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), (Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2]}}, {{
      0.6881909602355868, 0.5, 1.1135163644116066`}, {1.1135163644116066`, 
      0.8090169943749475, 0.2628655560595668}, {-0.2628655560595668, 
      0.8090169943749475, 1.1135163644116066`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{(Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2], Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {(1 + 2 5^Rational[-1, 2])^
        Rational[1, 2], 0, Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {(Rational[1, 8] + 
         Rational[1, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (3 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}}, {{1.1135163644116066`, 
       0.8090169943749475, 0.2628655560595668}, {
       1.3763819204711736`, 0, -0.2628655560595668}, {0.42532540417601994`, 
       1.3090169943749475`, -0.2628655560595668}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{(1 + 2 5^Rational[-1, 2])^Rational[1, 2], 0, Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {(Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {(
         Rational[1, 10] (5 + 5^Rational[1, 2]))^Rational[1, 2], 0, Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}}, {{
       1.3763819204711736`, 0, -0.2628655560595668}, {
       1.1135163644116066`, -0.8090169943749475, 0.2628655560595668}, {
       0.85065080835204, 0, -1.1135163644116068`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 20 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (3 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {(Rational[1, 8] + 
         Rational[1, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (3 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {
       Root[1 - 100 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}}, {{-0.42532540417601994`, 
      1.3090169943749475`, 0.2628655560595668}, {0.42532540417601994`, 
      1.3090169943749475`, -0.2628655560595668}, {-1.1135163644116068`, 
      0.8090169943749475, -0.2628655560595668}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 20 #^2 + 80 #^4& , 3, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}, {(
         Rational[1, 10] (5 + 5^Rational[1, 2]))^Rational[1, 2], 0, Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}, {
       Rational[-1, 2] (1 + 2 5^Rational[-1, 2])^Rational[1, 2], Rational[
        1, 2], Root[1 - 100 #^2 + 80 #^4& , 1, 0]}}, {{0.2628655560595668, 
       0.8090169943749475, -1.1135163644116068`}, {
       0.85065080835204, 0, -1.1135163644116068`}, {-0.6881909602355868, 
       0.5, -1.1135163644116068`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 20 #^2 + 80 #^4& , 3, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}, {(Rational[1, 8] + 
         Rational[1, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (-3 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {
       Rational[-1, 2] (1 + 2 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[-1, 2], Root[1 - 100 #^2 + 80 #^4& , 1, 0]}}, {{
      0.2628655560595668, -0.8090169943749475, -1.1135163644116068`}, {
      0.42532540417601994`, -1.3090169943749475`, -0.2628655560595668}, \
{-0.6881909602355868, -0.5, -1.1135163644116068`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 20 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (-3 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {
       Root[1 - 20 #^2 + 80 #^4& , 2, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), (Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2]}, {
       Root[1 - 100 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 
         0]}}, {{-0.42532540417601994`, -1.3090169943749475`, 
      0.2628655560595668}, {-0.2628655560595668, -0.8090169943749475, 
      1.1135163644116066`}, {-1.1135163644116068`, -0.8090169943749475, \
-0.2628655560595668}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 5 #^2 + 5 #^4& , 1, 0], 
        0, (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {
       Root[1 - 20 #^2 + 80 #^4& , 2, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), (Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {-(1 + 2 5^Rational[-1, 2])^Rational[1, 2], 0, Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}}, {{-0.85065080835204, 0, 
        1.1135163644116066`}, {-0.2628655560595668, 0.8090169943749475, 
       1.1135163644116066`}, {-1.3763819204711736`, 0, 
        0.2628655560595668}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 100 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {
       Rational[-1, 2] (1 + 2 5^Rational[-1, 2])^Rational[1, 2], Rational[
        1, 2], Root[1 - 100 #^2 + 80 #^4& , 1, 0]}, {
       Rational[-1, 2] (1 + 2 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[-1, 2], Root[
        1 - 100 #^2 + 80 #^4& , 1, 
         0]}}, {{-1.1135163644116068`, -0.8090169943749475, \
-0.2628655560595668}, {-0.6881909602355868, 
      0.5, -1.1135163644116068`}, {-0.6881909602355868, -0.5, \
-1.1135163644116068`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{-(1 + 2 5^Rational[-1, 2])^Rational[1, 2], 0, Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {
       Rational[-1, 2] (1 + 2 5^Rational[-1, 2])^Rational[1, 2], Rational[
        1, 2], Root[1 - 100 #^2 + 80 #^4& , 1, 0]}, {
       Root[1 - 100 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}}, {{-1.3763819204711736`, 0, 
        0.2628655560595668}, {-0.6881909602355868, 
       0.5, -1.1135163644116068`}, {-1.1135163644116068`, \
-0.8090169943749475, -0.2628655560595668}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{(Rational[1, 4] + Rational[1, 2] 5^Rational[-1, 2])^
        Rational[1, 2], 
        Rational[-1, 2], (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {(Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {(Rational[1, 4] + 
         Rational[1, 2] 5^Rational[-1, 2])^Rational[1, 2], Rational[
        1, 2], (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}}, {{0.6881909602355868, -0.5, 1.1135163644116066`}, {
      1.1135163644116066`, 0.8090169943749475, 0.2628655560595668}, {
      0.6881909602355868, 0.5, 1.1135163644116066`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{(Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2], Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {(Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {(Rational[1, 4] + 
         Rational[1, 2] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[-1, 2], (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}}, {{1.1135163644116066`, -0.8090169943749475, 
      0.2628655560595668}, {1.1135163644116066`, 0.8090169943749475, 
      0.2628655560595668}, {0.6881909602355868, -0.5, 
      1.1135163644116066`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 20 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (-3 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {(Rational[1, 4] + 
         Rational[1, 2] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[-1, 2], (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {
       Root[1 - 20 #^2 + 80 #^4& , 2, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), (Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}}, {{-0.42532540417601994`, -1.3090169943749475`, 
      0.2628655560595668}, {0.6881909602355868, -0.5, 
      1.1135163644116066`}, {-0.2628655560595668, -0.8090169943749475, 
      1.1135163644116066`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{(Rational[1, 8] + Rational[1, 8] 5^Rational[-1, 2])^
        Rational[1, 2], Rational[1, 4] (-3 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {(Rational[1, 4] + 
         Rational[1, 2] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[-1, 2], (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {
       Root[1 - 20 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (-3 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}}, {{
      0.42532540417601994`, -1.3090169943749475`, -0.2628655560595668}, {
      0.6881909602355868, -0.5, 
      1.1135163644116066`}, {-0.42532540417601994`, -1.3090169943749475`, 
      0.2628655560595668}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 5 #^2 + 5 #^4& , 1, 0], 
        0, (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {(Rational[1, 4] + Rational[1, 2] 5^Rational[-1, 2])^
        Rational[1, 2], Rational[
        1, 2], (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {
       Root[1 - 20 #^2 + 80 #^4& , 2, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), (Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}}, {{-0.85065080835204, 0, 1.1135163644116066`}, {
       0.6881909602355868, 0.5, 1.1135163644116066`}, {-0.2628655560595668, 
       0.8090169943749475, 1.1135163644116066`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 20 #^2 + 80 #^4& , 2, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), (Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {(Rational[1, 4] + Rational[1, 2] 5^Rational[-1, 2])^
        Rational[1, 2], Rational[
        1, 2], (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {
       Root[1 - 5 #^2 + 5 #^4& , 1, 0], 
        0, (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}}, {{-0.2628655560595668, -0.8090169943749475, 
       1.1135163644116066`}, {0.6881909602355868, 0.5, 
       1.1135163644116066`}, {-0.85065080835204, 0, 
        1.1135163644116066`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 20 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (3 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {(Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {(Rational[1, 8] + 
         Rational[1, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (3 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}}, {{-0.42532540417601994`, 
      1.3090169943749475`, 0.2628655560595668}, {1.1135163644116066`, 
      0.8090169943749475, 0.2628655560595668}, {0.42532540417601994`, 
      1.3090169943749475`, -0.2628655560595668}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 20 #^2 + 80 #^4& , 2, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), (Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {(Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {
       Root[1 - 20 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (3 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}}, {{-0.2628655560595668, 
      0.8090169943749475, 1.1135163644116066`}, {1.1135163644116066`, 
      0.8090169943749475, 0.2628655560595668}, {-0.42532540417601994`, 
      1.3090169943749475`, 0.2628655560595668}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 20 #^2 + 80 #^4& , 3, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}, {(1 + 2 5^Rational[-1, 2])^
        Rational[1, 2], 0, Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {(
         Rational[1, 10] (5 + 5^Rational[1, 2]))^Rational[1, 2], 0, Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}}, {{0.2628655560595668, 
       0.8090169943749475, -1.1135163644116068`}, {
       1.3763819204711736`, 0, -0.2628655560595668}, {
       0.85065080835204, 0, -1.1135163644116068`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{(Rational[1, 8] + Rational[1, 8] 5^Rational[-1, 2])^
        Rational[1, 2], Rational[1, 4] (3 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {(1 + 2 5^Rational[-1, 2])^
        Rational[1, 2], 0, Root[1 - 20 #^2 + 80 #^4& , 2, 0]}, {
       Root[1 - 20 #^2 + 80 #^4& , 3, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}}, {{0.42532540417601994`, 
       1.3090169943749475`, -0.2628655560595668}, {
       1.3763819204711736`, 0, -0.2628655560595668}, {0.2628655560595668, 
       0.8090169943749475, -1.1135163644116068`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 20 #^2 + 80 #^4& , 3, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}, {(Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {(Rational[1, 8] + 
         Rational[1, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (-3 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}}, {{
      0.2628655560595668, -0.8090169943749475, -1.1135163644116068`}, {
      1.1135163644116066`, -0.8090169943749475, 0.2628655560595668}, {
      0.42532540417601994`, -1.3090169943749475`, -0.2628655560595668}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{(Rational[1, 10] (5 + 5^Rational[1, 2]))^Rational[1, 2], 0, 
        Root[1 - 100 #^2 + 80 #^4& , 1, 0]}, {(Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {
       Root[1 - 20 #^2 + 80 #^4& , 3, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}}, {{
       0.85065080835204, 0, -1.1135163644116068`}, {
       1.1135163644116066`, -0.8090169943749475, 0.2628655560595668}, {
       0.2628655560595668, -0.8090169943749475, -1.1135163644116068`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[-1, 2] (1 + 2 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 2], Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}, {(Rational[1, 8] + 
         Rational[1, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (3 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {
       Root[1 - 20 #^2 + 80 #^4& , 3, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}}, {{-0.6881909602355868, 
      0.5, -1.1135163644116068`}, {0.42532540417601994`, 
      1.3090169943749475`, -0.2628655560595668}, {0.2628655560595668, 
      0.8090169943749475, -1.1135163644116068`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 100 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {(Rational[1, 8] + 
         Rational[1, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (3 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {
       Rational[-1, 2] (1 + 2 5^Rational[-1, 2])^Rational[1, 2], Rational[
        1, 2], Root[1 - 100 #^2 + 80 #^4& , 1, 0]}}, {{-1.1135163644116068`, 
      0.8090169943749475, -0.2628655560595668}, {0.42532540417601994`, 
      1.3090169943749475`, -0.2628655560595668}, {-0.6881909602355868, 
      0.5, -1.1135163644116068`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[-1, 2] (1 + 2 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[-1, 2], Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}, {(
         Rational[1, 10] (5 + 5^Rational[1, 2]))^Rational[1, 2], 0, Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}, {
       Root[1 - 20 #^2 + 80 #^4& , 3, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 100 #^2 + 80 #^4& , 1, 
         0]}}, {{-0.6881909602355868, -0.5, -1.1135163644116068`}, {
       0.85065080835204, 0, -1.1135163644116068`}, {
       0.2628655560595668, -0.8090169943749475, -1.1135163644116068`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[-1, 2] (1 + 2 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 2], Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}, {(
         Rational[1, 10] (5 + 5^Rational[1, 2]))^Rational[1, 2], 0, Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}, {
       Rational[-1, 2] (1 + 2 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[-1, 2], Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}}, {{-0.6881909602355868, 
       0.5, -1.1135163644116068`}, {
       0.85065080835204, 
        0, -1.1135163644116068`}, {-0.6881909602355868, -0.5, \
-1.1135163644116068`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 100 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {(Rational[1, 8] + 
         Rational[1, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (-3 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {
       Root[1 - 20 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (-3 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 
         0]}}, {{-1.1135163644116068`, -0.8090169943749475, \
-0.2628655560595668}, {
      0.42532540417601994`, -1.3090169943749475`, -0.2628655560595668}, \
{-0.42532540417601994`, -1.3090169943749475`, 0.2628655560595668}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Rational[-1, 2] (1 + 2 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[-1, 2], Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}, {(Rational[1, 8] + 
         Rational[1, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (-3 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {
       Root[1 - 100 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 
         0]}}, {{-0.6881909602355868, -0.5, -1.1135163644116068`}, {
      0.42532540417601994`, -1.3090169943749475`, -0.2628655560595668}, \
{-1.1135163644116068`, -0.8090169943749475, -0.2628655560595668}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{-(1 + 2 5^Rational[-1, 2])^Rational[1, 2], 0, Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {
       Root[1 - 20 #^2 + 80 #^4& , 2, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), (Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2]}, {
       Root[1 - 5 #^2 + 5 #^4& , 1, 0], 
        0, (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}}, {{-1.3763819204711736`, 0, 
        0.2628655560595668}, {-0.2628655560595668, -0.8090169943749475, 
       1.1135163644116066`}, {-0.85065080835204, 0, 
        1.1135163644116066`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 100 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {
       Root[1 - 20 #^2 + 80 #^4& , 2, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), (Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {-(1 + 2 5^Rational[-1, 2])^Rational[1, 2], 0, Root[
        1 - 20 #^2 + 80 #^4& , 3, 
         0]}}, {{-1.1135163644116068`, -0.8090169943749475, \
-0.2628655560595668}, {-0.2628655560595668, -0.8090169943749475, 
       1.1135163644116066`}, {-1.3763819204711736`, 0, 
        0.2628655560595668}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 100 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {
       Root[1 - 20 #^2 + 80 #^4& , 2, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), (Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2]}, {
       Root[1 - 20 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (3 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}}, {{-1.1135163644116068`, 
      0.8090169943749475, -0.2628655560595668}, {-0.2628655560595668, 
      0.8090169943749475, 1.1135163644116066`}, {-0.42532540417601994`, 
      1.3090169943749475`, 0.2628655560595668}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{-(1 + 2 5^Rational[-1, 2])^Rational[1, 2], 0, Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {
       Root[1 - 20 #^2 + 80 #^4& , 2, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), (Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2]}, {
       Root[1 - 100 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}}, {{-1.3763819204711736`, 0, 
        0.2628655560595668}, {-0.2628655560595668, 0.8090169943749475, 
       1.1135163644116066`}, {-1.1135163644116068`, 
       0.8090169943749475, -0.2628655560595668}}]]}}]], "Output",
 CellID->2116491842],

Cell[BoxData[
 Graphics3DBox[{
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 100 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {
       Rational[-1, 2] (1 + 2 5^Rational[-1, 2])^Rational[1, 2], Rational[
        1, 2], Root[1 - 100 #^2 + 80 #^4& , 1, 0]}, {
       Rational[-1, 2] (1 + 2 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[-1, 2], Root[1 - 100 #^2 + 80 #^4& , 1, 0]}, {
       Root[1 - 100 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {-(1 + 2 5^Rational[-1, 2])^
         Rational[1, 2], 0, Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}}, {{-1.1135163644116068`, 
       0.8090169943749475, -0.2628655560595668}, {-0.6881909602355868, 
       0.5, -1.1135163644116068`}, {-0.6881909602355868, -0.5, \
-1.1135163644116068`}, {-1.1135163644116068`, -0.8090169943749475, \
-0.2628655560595668}, {-1.3763819204711736`, 0, 0.2628655560595668}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{(1 + 2 5^Rational[-1, 2])^Rational[1, 2], 0, Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {(Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {(Rational[1, 4] + 
         Rational[1, 2] 5^Rational[-1, 2])^Rational[1, 2], Rational[
        1, 2], (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {(Rational[1, 4] + Rational[1, 2] 5^Rational[-1, 2])^
        Rational[1, 2], 
        Rational[-1, 2], (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {(Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}}, {{
       1.3763819204711736`, 0, -0.2628655560595668}, {1.1135163644116066`, 
       0.8090169943749475, 0.2628655560595668}, {0.6881909602355868, 0.5, 
       1.1135163644116066`}, {0.6881909602355868, -0.5, 
       1.1135163644116066`}, {1.1135163644116066`, -0.8090169943749475, 
       0.2628655560595668}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{(Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2], Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {(Rational[1, 4] + 
         Rational[1, 2] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[-1, 2], (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {
       Root[1 - 20 #^2 + 80 #^4& , 2, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), (Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2]}, {
       Root[1 - 20 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (-3 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {(Rational[1, 8] + 
         Rational[1, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (-3 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}}, {{
      1.1135163644116066`, -0.8090169943749475, 0.2628655560595668}, {
      0.6881909602355868, -0.5, 
      1.1135163644116066`}, {-0.2628655560595668, -0.8090169943749475, 
      1.1135163644116066`}, {-0.42532540417601994`, -1.3090169943749475`, 
      0.2628655560595668}, {
      0.42532540417601994`, -1.3090169943749475`, -0.2628655560595668}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{(Rational[1, 4] + Rational[1, 2] 5^Rational[-1, 2])^
        Rational[1, 2], 
        Rational[-1, 2], (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {(Rational[1, 4] + Rational[1, 2] 5^Rational[-1, 2])^
        Rational[1, 2], Rational[
        1, 2], (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {
       Root[1 - 20 #^2 + 80 #^4& , 2, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), (Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2]}, {
       Root[1 - 5 #^2 + 5 #^4& , 1, 0], 
        0, (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {
       Root[1 - 20 #^2 + 80 #^4& , 2, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), (Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2]}}, {{
       0.6881909602355868, -0.5, 1.1135163644116066`}, {0.6881909602355868, 
       0.5, 1.1135163644116066`}, {-0.2628655560595668, 0.8090169943749475, 
       1.1135163644116066`}, {-0.85065080835204, 0, 
        1.1135163644116066`}, {-0.2628655560595668, -0.8090169943749475, 
       1.1135163644116066`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{(Rational[1, 4] + Rational[1, 2] 5^Rational[-1, 2])^
        Rational[1, 2], Rational[
        1, 2], (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {(Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {(Rational[1, 8] + 
         Rational[1, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (3 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {
       Root[1 - 20 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (3 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {
       Root[1 - 20 #^2 + 80 #^4& , 2, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), (Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2]}}, {{
      0.6881909602355868, 0.5, 1.1135163644116066`}, {1.1135163644116066`, 
      0.8090169943749475, 0.2628655560595668}, {0.42532540417601994`, 
      1.3090169943749475`, -0.2628655560595668}, {-0.42532540417601994`, 
      1.3090169943749475`, 0.2628655560595668}, {-0.2628655560595668, 
      0.8090169943749475, 1.1135163644116066`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{(Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2], Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {(1 + 2 5^Rational[-1, 2])^
        Rational[1, 2], 0, Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {(
         Rational[1, 10] (5 + 5^Rational[1, 2]))^Rational[1, 2], 0, Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}, {
       Root[1 - 20 #^2 + 80 #^4& , 3, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}, {(Rational[1, 8] + 
         Rational[1, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (3 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}}, {{1.1135163644116066`, 
       0.8090169943749475, 0.2628655560595668}, {
       1.3763819204711736`, 0, -0.2628655560595668}, {
       0.85065080835204, 0, -1.1135163644116068`}, {0.2628655560595668, 
       0.8090169943749475, -1.1135163644116068`}, {0.42532540417601994`, 
       1.3090169943749475`, -0.2628655560595668}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{(1 + 2 5^Rational[-1, 2])^Rational[1, 2], 0, Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {(Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {(Rational[1, 8] + 
         Rational[1, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (-3 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {
       Root[1 - 20 #^2 + 80 #^4& , 3, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}, {(
         Rational[1, 10] (5 + 5^Rational[1, 2]))^Rational[1, 2], 0, Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}}, {{
       1.3763819204711736`, 0, -0.2628655560595668}, {
       1.1135163644116066`, -0.8090169943749475, 0.2628655560595668}, {
       0.42532540417601994`, -1.3090169943749475`, -0.2628655560595668}, {
       0.2628655560595668, -0.8090169943749475, -1.1135163644116068`}, {
       0.85065080835204, 0, -1.1135163644116068`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 20 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (3 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {(Rational[1, 8] + 
         Rational[1, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (3 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {
       Root[1 - 20 #^2 + 80 #^4& , 3, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}, {
       Rational[-1, 2] (1 + 2 5^Rational[-1, 2])^Rational[1, 2], Rational[
        1, 2], Root[1 - 100 #^2 + 80 #^4& , 1, 0]}, {
       Root[1 - 100 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}}, {{-0.42532540417601994`, 
      1.3090169943749475`, 0.2628655560595668}, {0.42532540417601994`, 
      1.3090169943749475`, -0.2628655560595668}, {0.2628655560595668, 
      0.8090169943749475, -1.1135163644116068`}, {-0.6881909602355868, 
      0.5, -1.1135163644116068`}, {-1.1135163644116068`, 
      0.8090169943749475, -0.2628655560595668}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 20 #^2 + 80 #^4& , 3, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}, {(
         Rational[1, 10] (5 + 5^Rational[1, 2]))^Rational[1, 2], 0, Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}, {
       Root[1 - 20 #^2 + 80 #^4& , 3, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}, {
       Rational[-1, 2] (1 + 2 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[-1, 2], Root[1 - 100 #^2 + 80 #^4& , 1, 0]}, {
       Rational[-1, 2] (1 + 2 5^Rational[-1, 2])^Rational[1, 2], Rational[
        1, 2], Root[1 - 100 #^2 + 80 #^4& , 1, 0]}}, {{0.2628655560595668, 
       0.8090169943749475, -1.1135163644116068`}, {
       0.85065080835204, 0, -1.1135163644116068`}, {
       0.2628655560595668, -0.8090169943749475, -1.1135163644116068`}, \
{-0.6881909602355868, -0.5, -1.1135163644116068`}, {-0.6881909602355868, 
       0.5, -1.1135163644116068`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 20 #^2 + 80 #^4& , 3, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 100 #^2 + 80 #^4& , 1, 0]}, {(Rational[1, 8] + 
         Rational[1, 8] 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[1, 4] (-3 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {
       Root[1 - 20 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (-3 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {
       Root[1 - 100 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {
       Rational[-1, 2] (1 + 2 5^Rational[-1, 2])^Rational[1, 2], 
        Rational[-1, 2], Root[1 - 100 #^2 + 80 #^4& , 1, 0]}}, {{
      0.2628655560595668, -0.8090169943749475, -1.1135163644116068`}, {
      0.42532540417601994`, -1.3090169943749475`, -0.2628655560595668}, \
{-0.42532540417601994`, -1.3090169943749475`, 
      0.2628655560595668}, {-1.1135163644116068`, -0.8090169943749475, \
-0.2628655560595668}, {-0.6881909602355868, -0.5, -1.1135163644116068`}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 20 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (-3 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {
       Root[1 - 20 #^2 + 80 #^4& , 2, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), (Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2]}, {
       Root[1 - 5 #^2 + 5 #^4& , 1, 0], 
        0, (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {-(1 + 2 5^Rational[-1, 2])^Rational[1, 2], 0, Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {
       Root[1 - 100 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (-1 - 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 
         0]}}, {{-0.42532540417601994`, -1.3090169943749475`, 
       0.2628655560595668}, {-0.2628655560595668, -0.8090169943749475, 
       1.1135163644116066`}, {-0.85065080835204, 0, 
        1.1135163644116066`}, {-1.3763819204711736`, 0, 
        0.2628655560595668}, {-1.1135163644116068`, -0.8090169943749475, \
-0.2628655560595668}}]]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[
     NCache[{{Root[1 - 5 #^2 + 5 #^4& , 1, 0], 
        0, (Rational[5, 8] + Rational[11, 8] 5^Rational[-1, 2])^
        Rational[1, 2]}, {
       Root[1 - 20 #^2 + 80 #^4& , 2, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), (Rational[5, 8] + 
         Rational[11, 8] 5^Rational[-1, 2])^Rational[1, 2]}, {
       Root[1 - 20 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (3 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}, {
       Root[1 - 100 #^2 + 80 #^4& , 1, 0], 
        Rational[1, 4] (1 + 5^Rational[1, 2]), Root[
        1 - 20 #^2 + 80 #^4& , 2, 0]}, {-(1 + 2 5^Rational[-1, 2])^
         Rational[1, 2], 0, Root[
        1 - 20 #^2 + 80 #^4& , 3, 0]}}, {{-0.85065080835204, 0, 
        1.1135163644116066`}, {-0.2628655560595668, 0.8090169943749475, 
       1.1135163644116066`}, {-0.42532540417601994`, 1.3090169943749475`, 
       0.2628655560595668}, {-1.1135163644116068`, 
       0.8090169943749475, -0.2628655560595668}, {-1.3763819204711736`, 0, 
        0.2628655560595668}}]]}}]], "Output",
 CellID->959259586]
}, Open  ]],

Cell[TextData[{
 "Lastly, you can create new point references using the ",
 StyleBox["PointRef`Constructor[Expr]",
  FontFamily->"Prestige Elite Std Bold"],
 " static method, then add them to a Facet, following a half-edge, using the ",
 StyleBox["HalfEdge@DetourToVertex[PointRef]",
  FontFamily->"Prestige Elite Std Bold"],
 " function.  Here is a function that takes in a Polyhedron and stellates it. \
 While this is slower than the built in stellate function, it illustrates how \
to use the above functions."
}], "Text",
 CellID->1481603727],

Cell[BoxData[
 RowBox[{
  RowBox[{"stellate", "[", "poly_", "]"}], ":=", "\[IndentingNewLine]", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"facetList", "=", 
      RowBox[{"poly", "@", "FacetArray"}]}], "}"}], ",", 
    "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"Map", "[", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{
        RowBox[{"(", 
         RowBox[{"Module", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"midPoint", "=", 
              RowBox[{"#", "@", "Midpoint"}]}], ",", "p", ",", 
             "stellateFactor", ",", "halfEdgeList", ",", "edgeToPoint", ",", 
             "newFacets", ",", "normal"}], "}"}], ",", "\[IndentingNewLine]", 
           
           RowBox[{
            RowBox[{"stellateFactor", "=", 
             RowBox[{"EuclideanDistance", "[", 
              RowBox[{"midPoint", ",", 
               RowBox[{
                RowBox[{"(", 
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{"#", "@", "Head"}], ")"}], "@", "Start"}], ")"}], 
                "@", "Expr"}]}], "]"}]}], ";", "\[IndentingNewLine]", 
            RowBox[{"p", " ", "=", " ", 
             RowBox[{"PointRef`Constructor", "[", "midPoint", "]"}]}], ";", 
            "\[IndentingNewLine]", 
            RowBox[{
             RowBox[{"(", 
              RowBox[{"#", "@", "Head"}], ")"}], "@", 
             RowBox[{"DetourToVertex", "[", "p", "]"}]}], ";", 
            "\[IndentingNewLine]", 
            RowBox[{"halfEdgeList", "=", 
             RowBox[{
              RowBox[{"(", 
               RowBox[{"#", "@", "HalfEdgeArray"}], ")"}], 
              "\[LeftDoubleBracket]", 
              RowBox[{"4", ";;"}], "\[RightDoubleBracket]"}]}], ";", 
            "\[IndentingNewLine]", 
            RowBox[{
             RowBox[{"edgeToPoint", "[", "he_", "]"}], ":=", 
             RowBox[{"#", "@", 
              RowBox[{"SubDivide", "[", 
               RowBox[{
                RowBox[{"he", "@", "End"}], ",", "p"}], "]"}]}]}], ";", 
            "\[IndentingNewLine]", " ", 
            RowBox[{"newFacets", "=", 
             RowBox[{"Map", "[", 
              RowBox[{
               RowBox[{
                RowBox[{"edgeToPoint", "[", "#", "]"}], "&"}], ",", 
               "halfEdgeList"}], "]"}]}], ";", "\[IndentingNewLine]", 
            RowBox[{"poly", "@", 
             RowBox[{"AddFacets", "[", "newFacets", "]"}]}], ";", 
            "\[IndentingNewLine]", 
            RowBox[{"normal", " ", "=", " ", 
             RowBox[{
              RowBox[{"(", 
               RowBox[{
                RowBox[{"(", 
                 RowBox[{"#", "@", "Head"}], ")"}], "@", "Plane"}], ")"}], 
              "@", "Normal"}]}], ";", "\[IndentingNewLine]", 
            RowBox[{
             RowBox[{"p", "@", "Expr"}], "=", 
             RowBox[{
              RowBox[{"p", "@", "Expr"}], "+", 
              RowBox[{"stellateFactor", "*", "normal"}]}]}], ";", 
            "\[IndentingNewLine]", "1"}]}], "]"}], ")"}], "&"}], ",", 
       "facetList"}], "]"}], ";"}]}], "]"}]}]], "Input",
 CellID->7687385],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"cube", " ", "=", " ", 
   RowBox[{"PolyIO`PolyFromName", "[", "\"\<Cube\>\"", "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"cube", "@", 
   RowBox[{"MakeNumerical", "[", "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"stellate", "[", "cube", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Graphics3D", "[", 
  RowBox[{"cube", "@", "Graphics"}], "]"}]}], "Input",
 CellID->352860875],

Cell[BoxData[
 Graphics3DBox[{
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{0.5, 0.5, 0.5}, {-0.5, 0.5, 0.5}, {0., 0., 
     1.20710678118655}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{0.5, 0.5, 0.5}, {0.5, -0.5, 0.5}, {1.20710678118655, 0., 
     0.}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{0.5, 0.5, 0.5}, {0.5, 0.5, -0.5}, {0., 1.20710678118655, 
     0.}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.5, 0.5, 0.5}, {-0.5, 0.5, -0.5}, {-1.20710678118655, 0.,
      0.}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.5, -0.5, -0.5}, {-0.5, 0.5, -0.5}, {0., 
     0., -1.20710678118655}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.5, -0.5, 0.5}, {-0.5, -0.5, -0.5}, {
     0., -1.20710678118655, 0.}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.5, -0.5, 0.5}, {0., 0., 1.20710678118655}, {-0.5, 0.5, 
     0.5}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{0.5, -0.5, 0.5}, {0., 0., 1.20710678118655}, {-0.5, -0.5, 
     0.5}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{0.5, 0.5, 0.5}, {0., 0., 1.20710678118655}, {0.5, -0.5, 
     0.5}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{0.5, -0.5, -0.5}, {1.20710678118655, 0., 0.}, {0.5, -0.5, 
     0.5}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{0.5, 0.5, -0.5}, {1.20710678118655, 0., 0.}, {
     0.5, -0.5, -0.5}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{0.5, 0.5, 0.5}, {1.20710678118655, 0., 0.}, {0.5, 
     0.5, -0.5}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.5, 0.5, -0.5}, {0., 1.20710678118655, 0.}, {0.5, 
     0.5, -0.5}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.5, 0.5, 0.5}, {0., 1.20710678118655, 0.}, {-0.5, 
     0.5, -0.5}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{0.5, 0.5, 0.5}, {0., 1.20710678118655, 0.}, {-0.5, 0.5, 
     0.5}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.5, -0.5, -0.5}, {-1.20710678118655, 0., 0.}, {-0.5, 
     0.5, -0.5}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.5, -0.5, 0.5}, {-1.20710678118655, 0., 
     0.}, {-0.5, -0.5, -0.5}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.5, 0.5, 0.5}, {-1.20710678118655, 0., 0.}, {-0.5, -0.5, 
     0.5}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{0.5, 0.5, -0.5}, {0., 0., -1.20710678118655}, {-0.5, 
     0.5, -0.5}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{0.5, -0.5, -0.5}, {0., 0., -1.20710678118655}, {0.5, 
     0.5, -0.5}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.5, -0.5, -0.5}, {0., 0., -1.20710678118655}, {
     0.5, -0.5, -0.5}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{0.5, -0.5, -0.5}, {0., -1.20710678118655, 
     0.}, {-0.5, -0.5, -0.5}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{0.5, -0.5, 0.5}, {0., -1.20710678118655, 0.}, {
     0.5, -0.5, -0.5}}]}, 
   {RGBColor[1, 1, 1], 
    Polygon3DBox[{{-0.5, -0.5, 0.5}, {0., -1.20710678118655, 0.}, {0.5, -0.5, 
     0.5}}]}}]], "Output",
 CellID->1177259522]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Conclusion", "Section"],

Cell["\<\
It is our hope that this tool will prove useful to researchers in the folding \
community who are looking for a simple, intuitive and interactive tool with \
which to model unfoldings.  In addition, this interface allows a considerable \
option for expansion; in particular, we hope to add an implementation for \
computing shortest paths as soon as possible [2], since this will allow the \
computation of more general types of unfoldings such as star and source \
unfoldings [4].  Implementations of these shortest path algorithms are known \
to be surprisingly tricky [6], and this type of computation is one of the \
motivations for using the half-edge data structure in our design.\
\>", "Text"],

Cell[TextData[{
 "In addition, this ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " front end opens the possibility of combining the visualization tools of ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " with more powerful geometric libraries such as CGAL, since many of our C# \
implementations are the same data structures used by those stronger and more \
extensive libraries.  We hope to explore the option of tying into those \
libraries as well in future work."
}], "Text",
 CellID->1193080299]
}, Open  ]],

Cell[CellGroupData[{

Cell["Acknowledgments", "Section"],

Cell["\<\
Research for this work was supported in part by the NSF under Grant No. CCF \
1054779, as well as an REU Supplemental Grant.\
\>", "Text"]
}, Open  ]],

Cell[CellGroupData[{

Cell["References", "Section",
 CellID->496069258],

Cell[TextData[{
 "A.I Bobenko and I. Izmestiev, \[OpenCurlyDoubleQuote]Alexandrov\
\[CloseCurlyQuote]s theorem, weighted Delaunay triangulations, and mixed \
volumes,\[CloseCurlyDoubleQuote] ",
 StyleBox["Annales de l\[CloseCurlyQuote]institut Fourier",
  FontSlant->"Italic"],
 ", ",
 StyleBox["58",
  FontWeight->"Bold"],
 "(2), 2008 pp. 447\[Dash]506."
}], "Reference"],

Cell[TextData[{
 "J. Chen and Y. Han, \[OpenCurlyDoubleQuote]Shortest Paths on a Polyhedron, \
Part I: Computing Shortest Paths,\[CloseCurlyDoubleQuote] ",
 StyleBox["International Journal of Computational Geometry and Applications, ",
  FontSlant->"Italic"],
 StyleBox["6",
  FontWeight->"Bold"],
 ", 1996 pp. 127\[Dash]144."
}], "Reference"],

Cell[TextData[{
 "M. de Berg, O. Cheong, M. van Kreveld, and M. Overmars, ",
 StyleBox["Computational Geometry: Appications and Algorithms",
  FontSlant->"Italic"],
 ", 3rd ed., Springer, 2008."
}], "Reference"],

Cell[TextData[{
 "E. Demaine and J. O\[CloseCurlyQuote]Rourke, ",
 StyleBox["Geometric Folding Algorithm: Linkages, Origami, Polyhedra",
  FontSlant->"Italic"],
 ", Cambridge University Press, 2008."
}], "Reference"],

Cell[TextData[{
 "E. Demaine, M. Demaine, A. Lubiw, and J. O\[CloseCurlyQuote]Rourke",
 StyleBox[", ",
  FontSlant->"Italic"],
 "\[OpenCurlyDoubleQuote]Examples, Counterexamples, and Enumeration Results \
for Foldings and Unfoldings between Polygons and Polytopes\
\[CloseCurlyDoubleQuote]",
 StyleBox[",",
  FontSlant->"Italic"],
 " Technical Report: Smith College, 2000."
}], "Reference"],

Cell[TextData[{
 "B. Kaneva and J. O\[CloseCurlyQuote]Rourke, \[OpenCurlyDoubleQuote]An \
Implementation of Chen and Han\[CloseCurlyQuote]s Shortest Paths Algorithm,\
\[CloseCurlyDoubleQuote] in ",
 StyleBox["Proceedings of the 12th Canadian Conference on Computational \
Geometry (CCCG 2000)",
  FontSlant->"Italic"],
 ", New Brunswick, 2000 pp. 139\[Dash]146. "
}], "Reference"],

Cell[TextData[{
 "D.E. Muller and F.P. Preparata, \[OpenCurlyDoubleQuote]Finding the \
intersection of two convex polyhedra,\[CloseCurlyDoubleQuote] ",
 StyleBox["Theoretical Computer Science",
  FontSlant->"Italic"],
 ", ",
 StyleBox["7",
  FontWeight->"Bold"],
 ", 1978 pp. 217\[Dash]236. "
}], "Reference"]
}, Open  ]],

Cell[CellGroupData[{

Cell["About the Authors", "SectionAboutAuthor"],

Cell["\<\
Chris Conlon is a student majoring in Computer Science and Mathematics at \
Washington University. Following his graduation he will be working as a \
Software Development Engineer for Microsoft\[CloseCurlyQuote]s Windows \
division.\
\>", "TextAboutAuthor"],

Cell["\<\
Richard Pham is an engineering undergraduate with a second major in \
mathematics at Saint Louis University.\
\>", "TextAboutAuthor"],

Cell["\<\
Kyle Sykes is a Mathematics Ph.D. student at Saint Louis University\
\[CloseCurlyQuote]s Department of Mathematics and Computer Science.\
\>", "Text",
 CellID->109342928],

Cell["\<\
Dr. Erin Wolf Chambers is an associate professor at Saint Louis University\
\[CloseCurlyQuote]s Department of Mathematics and Computer Science, with \
research focusing on computation geometry and topology.\
\>", "Text",
 CellID->732696338],

Cell[TextData[StyleBox["Christopher Conlon", "AboutAuthorB"]], \
"TextAboutAuthor",
 CellID->1328340278],

Cell[TextData[StyleBox["Richard Pham", "AboutAuthorB"]], "TextAboutAuthor",
 CellID->175058134],

Cell[TextData[{
 StyleBox["Kyle Sykes", "AboutAuthorB"],
 "\n",
 StyleBox["Saint Louis University\nDepartment of Mathematics and Computer \
Science\n221 N. Grand Blvd\nSt. Louis, MO 63103", "AboutAuthorI"],
 "\n",
 StyleBox[ButtonBox["ksykes2@slu.edu",
  BaseStyle->"Hyperlink",
  ButtonData->{
    URL["mailto:submissions@mathematica-journal.com"], None},
  ButtonNote->"submissions@mathematica-journal.com"], "AboutAuthorI"]
}], "TextAboutAuthor",
 CellID->560017850],

Cell[TextData[{
 StyleBox["Erin Chambers", "AboutAuthorB"],
 "\n",
 StyleBox["Saint Louis University\nDepartment of Mathematics and Computer \
Science\n221 N. Grand Blvd\nSt. Louis, MO 63103", "AboutAuthorI"],
 "\n",
 StyleBox[ButtonBox["echambe5@slu.edu",
  BaseStyle->"Hyperlink",
  ButtonData->{
    URL["mailto:submissions@mathematica-journal.com"], None},
  ButtonNote->"submissions@mathematica-journal.com"], "AboutAuthorI"]
}], "TextAboutAuthor",
 CellID->1946663796],

Cell[TextData[{
 "\t",
 StyleBox["1",
  FontVariations->{"CompatibilityType"->"Superscript"}],
 "\t",
 "Available",
 " ",
 "at",
 " ",
 "http",
 ":",
 "//",
 "mathcs",
 ".",
 "slu",
 ".",
 "edu",
 "/",
 "~",
 "chambers",
 "/",
 "papers",
 "/",
 "unfolding_package",
 "/",
 "index",
 ".",
 "html",
 "."
}], "Reference",
 Editable->False,
 TaggingRules->{ReferenceNoteData -> ""},
 CellTags->"0000545E",
 CellID->1404852268]
}, Open  ]]
}, Open  ]]
},
AutoGeneratedPackage->None,
WindowToolbars->"EditBar",
WindowSize->{640, 640},
Visible->True,
ScrollingOptions->{"VerticalScrollRange"->Fit},
ShowCellBracket->False,
Deployed->True,
TaggingRules->{
 "DAHPreferences" -> {
   "DefaultUSERCVSDIR" -> 
    "C:\\Users\\joycet\\cvs_checkouts_DAHDefault\\Pubs\\Internal\\joycet", 
    "DAHEmailOptions" -> {
     "From" -> "joycet@wolfram.com", "To" -> "q-docs@wolfram.com", "Subject" -> 
      "bonk detected: ", "Server" -> "mail.wolfram.com"}, 
    "CVSBranchTags" -> {"B8_0"}}, "AnnotationsDeleted" -> False},
CreateCellID->True,
CellContext->Notebook,
TrackCellChangeTimes->False,
Magnification:>1.25 Inherited,
FrontEndVersion->"9.0 for Mac OS X x86 (32-bit, 64-bit Kernel) (January 25, \
2013)",
StyleDefinitions->Notebook[{
   Cell[
    CellGroupData[{
      Cell[
       TextData[{"Style Definitions for \n", 
         StyleBox["The Mathematica Journal", FontSlant -> "Italic"]}], 
       "Subtitle", CellMargins -> {{0, Inherited}, {Inherited, 0}}, 
       CellFrameMargins -> {{20, 4}, {8, 20}}, FontSize -> 36, FontWeight -> 
       "Bold", FontColor -> GrayLevel[1], Background -> GrayLevel[0]], 
      Cell[
       StyleData[StyleDefinitions -> "Default_8.0.nb"]], 
      Cell[
       CellGroupData[{
         Cell[
         "Styles Brought in from Core.nb, adjusted for TMJ", "Section", 
          CellFrame -> False, CellDingbat -> None, ShowCellBracket -> True, 
          CellMargins -> {{0, 0}, {10, 40}}, 
          CellFrameMargins -> {{20, 4}, {8, 8}}, FontColor -> GrayLevel[1], 
          Background -> RGBColor[0.269902, 0.558434, 0.715618]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Code"], PageWidth -> DirectedInfinity[1], 
             CellMargins -> {{57, 21}, {10, 10}}, Evaluatable -> True, 
             CellGroupingRules -> "InputGrouping", TextClipboardType -> 
             "Package", PageBreakWithin -> False, GroupPageBreakWithin -> 
             False, InitializationCell -> True, DefaultFormatType -> 
             DefaultInputFormatType, AutoIndent -> False, ShowAutoStyles -> 
             True, "TwoByteSyntaxCharacterAutoReplacement" -> True, 
             HyphenationOptions -> {
              "HyphenationCharacter" -> "\[Continuation]"}, 
             AutoItalicWords -> {}, LanguageCategory -> "Mathematica", 
             AutoSpacing -> False, ShowStringCharacters -> True, NumberMarks -> 
             True, DigitBlock -> DirectedInfinity[1], ZeroWidthTimes -> True, 
             LineBreakWithin -> False, LineIndent -> 0, CounterIncrements -> 
             "Code", MenuSortingValue -> 1375, MenuCommandKey -> "8", 
             FontSize -> 11, FontWeight -> "Bold", Background -> 
             RGBColor[0.9, 0.9, 1], $CellContext`StripStyleOnPaste -> True], 
            Cell[
             StyleData["Code", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Code", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Code", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell["Brought in from Core.nb, removed FontSize", "Text"], 
         Cell[
          StyleData["MSG"], StyleMenuListing -> None, FontFamily -> 
          "Helvetica"], 
         Cell["Brought in from Core.nb, not modified", "Text"], 
         Cell[
          StyleData["PrintUsage"], Editable -> False, PageWidth -> 
          WindowWidth, CellFrame -> {{0, 0}, {0, 3}}, CellFrameColor -> 
          RGBColor[1, 0.6000000000000001, 0], FontFamily -> "Helvetica", 
          FontSize -> 10, Background -> RGBColor[1, 0.993332, 0.899718]]}, 
        Closed]], 
      Cell[
       CellGroupData[{
         Cell[
         "Style Environment Names", "Section", CellFrame -> False, 
          CellDingbat -> None, ShowCellBracket -> True, 
          CellMargins -> {{0, 0}, {10, 40}}, 
          CellFrameMargins -> {{20, 4}, {8, 8}}, FontColor -> GrayLevel[1], 
          Background -> RGBColor[0.269902, 0.558434, 0.715618]], 
         Cell[
          CellGroupData[{
            Cell[
            "Corrected style environment names to use the MenuPosition values \
from Core.nb. ", "Text"], 
            Cell[
             StyleData[All, "Working"], 
             CellBracketOptions -> {
              "Color" -> RGBColor[0.115343, 0.350561, 0.362966]}, 
             ShowCellLabel -> True, CellFrameLabelMargins -> 6, ScriptMinSize -> 
             9, MenuSortingValue -> 1100], 
            Cell[
             StyleData[All, "Presentation"], ScreenStyleEnvironment -> 
             "Presentation", MenuSortingValue -> 1200, Magnification -> 1.25], 
            Cell[
             StyleData[All, "Printout"], PageWidth -> PaperWidth, 
             ShowCellBracket -> True, CellLabelAutoDelete -> False, 
             Hyphenation -> True, 
             HyphenationOptions -> {"HyphenationMinLengths" -> {3, 4}}, 
             ScriptMinSize -> 5, MenuSortingValue -> 1500, 
             PrivateFontOptions -> {"FontType" -> "Outline"}, Magnification -> 
             0.9]}, Open]], 
         Cell[
          CellGroupData[{
            Cell[
            "Disabled Menu appearance for SlideShow and Condensed", "Text"], 
            Cell[
             StyleData[All, "SlideShow"], PageWidth -> WindowWidth, 
             DockedCells -> 
             FEPrivate`FrontEndResource["FEExpressions", "SlideshowToolbar"], 
             ScrollingOptions -> {
              "PagewiseDisplay" -> True, "VerticalScrollRange" -> Fit}, 
             ShowCellBracket -> False, ShowAutoStyles -> False, ScriptMinSize -> 
             9, MenuSortingValue -> 1300, StyleMenuListing -> None], 
            Cell[
             StyleData[All, "Condensed"], PageWidth -> WindowWidth, 
             CellLabelMargins -> {{8, Inherited}, {Inherited, Inherited}}, 
             ShowAutoStyles -> False, ScriptMinSize -> 8, MenuSortingValue -> 
             1400, StyleMenuListing -> None]}, Open]]}, Closed]], 
      Cell[
       CellGroupData[{
         Cell[
         "Notebook Options", "Section", CellFrame -> False, CellDingbat -> 
          None, ShowCellBracket -> True, CellMargins -> {{0, 0}, {10, 40}}, 
          CellFrameMargins -> {{20, 4}, {8, 8}}, FontColor -> GrayLevel[1], 
          Background -> RGBColor[0.269902, 0.558434, 0.715618]], 
         Cell[
         "The options defined for the style below will be used at the \
Notebook level.", "Text"], 
         Cell[
          StyleData["Notebook"], PageHeaders -> {{
             Cell[
              TextData[{
                CounterBox["Page"]}], "PageNumber"], Inherited, 
             Cell["Author(s)", "Header"]}, {
             Cell["Article Title", "Header"], Inherited, 
             Cell[
              TextData[{
                CounterBox["Page"]}], "PageNumber"]}}, PageFooters -> {{
             Cell[
              TextData[{"The Mathematica Journal ", 
                StyleBox["volume", FontWeight -> "Bold"], 
                ":issue \[Copyright] year Wolfram Media, Inc."}], "Footer"], 
             Inherited, 
             Cell[
              TextData[{
                ValueBox["FileName"], " ", 
                ValueBox["Date"]}], "Footer"]}, {
             Cell[
              TextData[{
                ValueBox["FileName"], " ", 
                ValueBox["Date"]}], "Footer"], Inherited, 
             Cell[
              TextData[{"The Mathematica Journal ", 
                StyleBox["volume", FontWeight -> "Bold"], 
                ":issue \[Copyright] year Wolfram Media, Inc."}], "Footer"]}},
           PrintingOptions -> {
           "FacingPages" -> True, "FirstPageHeader" -> False, 
            "PageFooterMargins" -> {36, 36}, "PageHeaderMargins" -> {42, 42}, 
            "PrintRegistrationMarks" -> False, 
            "PrintingMargins" -> {{90, 90}, {90, 90}}}, CellFrameLabelMargins -> 
          6, HyphenationOptions -> {
           "HyphenationCharacter" -> "-", "HyphenationFreeZone" -> 12, 
            "HyphenationMinLengths" -> {2, 3}}, StyleMenuListing -> None]}, 
        Closed]], 
      Cell[
       CellGroupData[{
         Cell[
         "Styles for Headings", "Section", CellFrame -> False, CellDingbat -> 
          None, ShowCellBracket -> True, CellMargins -> {{0, 0}, {10, 40}}, 
          CellFrameMargins -> {{20, 4}, {8, 8}}, FontColor -> GrayLevel[1], 
          Background -> RGBColor[0.269902, 0.558434, 0.715618]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Title"], ShowCellBracket -> False, ShowSelection -> 
             True, CellMargins -> {{21, 21}, {0, 15}}, 
             CellGroupingRules -> {"TitleGrouping", 0}, PageBreakBelow -> 
             False, Hyphenation -> False, LineSpacing -> {1, 1}, 
             CounterIncrements -> "Title", 
             CounterAssignments -> {{"Subtitle", 0}, {"Section", 0}, {
               "Subsection", 0}, {"Subsubsection", 0}, {"List", 0}, {
               "NumberedFigure", 0}, {"NumberedTable", 0}, {
               "NumberedProgram", 0}, {"Equation", 0}, {"Text", 0}, {
               "SmallText", 0}, {"Reference", 0}}, MenuSortingValue -> 1100, 
             FontFamily -> "Times", FontSize -> 36, FontWeight -> "Plain", 
             FontSlant -> "Italic"], 
            Cell[
             StyleData["Title", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Title", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Title", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Subtitle"], ShowCellBracket -> False, ShowSelection -> 
             True, CellMargins -> {{21, 21}, {5, 2}}, 
             CellGroupingRules -> {"TitleGrouping", 10}, PageBreakBelow -> 
             False, Hyphenation -> False, LineSpacing -> {1, 1}, 
             CounterIncrements -> "Subtitle", FontFamily -> "Times", FontSize -> 
             24, FontSlant -> "Italic"], 
            Cell[
             StyleData["Subtitle", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Subtitle", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Subtitle", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          StyleData["Subsubtitle"], MenuSortingValue -> "None"], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Section"], CellFrame -> False, CellDingbat -> 
             "\[FilledSquare]", CellMargins -> {{21, 21}, {10, 30}}, 
             Evaluatable -> False, 
             CellGroupingRules -> {"SectionGrouping", 40}, PageBreakBelow -> 
             False, Hyphenation -> False, CounterIncrements -> "Section", 
             CounterAssignments -> {{"Subsection", 0}, {"Subsubsection", 0}, {
               "ItemNumbered", 0}}, AspectRatioFixed -> True, FontFamily -> 
             "Helvetica", FontSize -> 16, FontWeight -> "Bold", FontColor -> 
             RGBColor[
              0.7013504234378576, 0.3030136568245975, 0.12634470130464637`]], 
            
            Cell[
             StyleData["Section", "Presentation", StyleDefinitions -> None]], 
            
            Cell[
             StyleData["Section", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Section", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Subsection"], CellDingbat -> "\[EmptySquare]", 
             CellMargins -> {{21, 21}, {10, 26}}, 
             CellGroupingRules -> {"SectionGrouping", 50}, PageBreakBelow -> 
             False, Hyphenation -> False, LineSpacing -> {1, 1}, 
             CounterIncrements -> "Subsection", 
             CounterAssignments -> {{"Subsubsection", 0}, {
               "ItemNumbered", 0}}, FontFamily -> "Helvetica", FontSize -> 14,
              FontWeight -> "Bold", FontColor -> GrayLevel[0]], 
            Cell[
             StyleData[
             "Subsection", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Subsection", "SlideShow", StyleDefinitions -> None]], 
            
            Cell[
             StyleData["Subsection", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Subsubsection"], CellDingbat -> 
             "\[FilledSmallSquare]", CellMargins -> {{21, 21}, {6, 20}}, 
             CellGroupingRules -> {"SectionGrouping", 60}, PageBreakBelow -> 
             False, Hyphenation -> False, LineSpacing -> {1, 1}, 
             CounterIncrements -> "Subsubsection", 
             CounterAssignments -> {{"ItemNumbered", 0}}, FontFamily -> 
             "Helvetica", FontSize -> 12, FontWeight -> "Bold", FontSlant -> 
             "Oblique"], 
            Cell[
             StyleData[
             "Subsubsection", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "Subsubsection", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "Subsubsection", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Subsubsubsection"], CellDingbat -> None, 
             CellMargins -> {{21, 21}, {6, 20}}, 
             CellGroupingRules -> {"SectionGrouping", 70}, PageBreakBelow -> 
             False, Hyphenation -> False, LineSpacing -> {1, 1}, 
             CounterIncrements -> "Subsubsubsection", 
             CounterAssignments -> {{"ItemNumbered", 0}}, StyleMenuListing -> 
             None, FontFamily -> "Helvetica", FontSize -> 12, FontWeight -> 
             "Bold"], 
            Cell[
             StyleData[
             "Subsubsubsection", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "Subsubsubsection", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "Subsubsubsection", "Printout", StyleDefinitions -> None]]}, 
           Closed]]}, Closed]], 
      Cell[
       CellGroupData[{
         Cell[
         "Styles for Body Text", "Section", CellFrame -> False, CellDingbat -> 
          None, ShowCellBracket -> True, CellMargins -> {{0, 0}, {10, 40}}, 
          CellFrameMargins -> {{20, 4}, {8, 8}}, FontColor -> GrayLevel[1], 
          Background -> RGBColor[0.269902, 0.558434, 0.715618]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Text"], CellMargins -> {{21, 21}, {4, 4}}, 
             CounterIncrements -> "Text", 
             CounterAssignments -> {{"ItemNumbered", 0}}, MenuSortingValue -> 
             1370, MenuCommandKey -> "7", FontFamily -> "Times", FontSize -> 
             12], 
            Cell[
             StyleData["Text", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Text", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Text", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Quote"], 
             CellMargins -> {{45, 45}, {Inherited, Inherited}}, 
             MenuSortingValue -> 1520, FontFamily -> "Times", FontSize -> 12], 
            Cell[
             StyleData["Quote", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Quote", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Quote", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]]}, Closed]], 
      Cell[
       CellGroupData[{
         Cell[
         "Styles for Input, Output, and Graphics", "Section", CellFrame -> 
          False, CellDingbat -> None, ShowCellBracket -> True, 
          CellMargins -> {{0, 0}, {10, 40}}, 
          CellFrameMargins -> {{20, 4}, {8, 8}}, FontColor -> GrayLevel[1], 
          Background -> RGBColor[0.269902, 0.558434, 0.715618]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Input"], CellMargins -> {{57, 21}, {10, 10}}, 
             Evaluatable -> True, CellGroupingRules -> "InputGrouping", 
             CellHorizontalScrolling -> True, PageBreakWithin -> False, 
             GroupPageBreakWithin -> False, 
             CellLabelMargins -> {{23, Inherited}, {Inherited, Inherited}}, 
             CellFrameColor -> GrayLevel[0.869993], DefaultFormatType -> 
             DefaultInputFormatType, LineSpacing -> {1, 1}, 
             AutoItalicWords -> {}, ShowStringCharacters -> True, NumberMarks -> 
             True, CounterIncrements -> "Input", MenuSortingValue -> 1400, 
             FontSize -> 11, FontWeight -> "Bold", Background -> None], 
            Cell[
             StyleData["Input", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Input", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Input", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Output"], CellMargins -> {{57, 21}, {13, 5}}, 
             CellEditDuplicate -> True, CellGroupingRules -> "OutputGrouping",
              CellHorizontalScrolling -> True, PageBreakWithin -> False, 
             GroupPageBreakWithin -> False, GeneratedCell -> True, 
             CellAutoOverwrite -> True, 
             CellLabelMargins -> {{23, Inherited}, {Inherited, Inherited}}, 
             CellFrameColor -> GrayLevel[0.869993], DefaultFormatType -> 
             DefaultOutputFormatType, LineSpacing -> {1, 1}, 
             AutoItalicWords -> {}, CounterIncrements -> "Output", 
             StyleMenuListing -> None, FontSize -> 11, Background -> None], 
            Cell[
             StyleData["Output", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Output", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Output", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Message"], CellFrame -> {{0.25, 0.25}, {0, 0}}, 
             CellDingbat -> "\[WarningSign]", 
             CellMargins -> {{57, 21}, {13, 0}}, CellGroupingRules -> 
             "OutputGrouping", PageBreakWithin -> False, GroupPageBreakWithin -> 
             False, GeneratedCell -> True, CellAutoOverwrite -> True, 
             ShowCellLabel -> False, 
             CellLabelMargins -> {{23, Inherited}, {Inherited, Inherited}}, 
             CellFrameColor -> GrayLevel[0.869993], CellFrameLabelMargins -> 
             0, DefaultFormatType -> DefaultOutputFormatType, 
             LineSpacing -> {1, 1}, AutoItalicWords -> {}, StyleMenuListing -> 
             None, FontFamily -> "Helvetica", FontSize -> 10, FontColor -> 
             RGBColor[0, 0, 1], Background -> GrayLevel[0.949996]], 
            Cell[
             StyleData["Message", "Presentation", StyleDefinitions -> None]], 
            
            Cell[
             StyleData["Message", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Message", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Print"], CellFrame -> True, 
             CellMargins -> {{57, 21}, {13, 0}}, CellGroupingRules -> 
             "OutputGrouping", CellHorizontalScrolling -> True, 
             PageBreakWithin -> False, GroupPageBreakWithin -> False, 
             GeneratedCell -> True, CellAutoOverwrite -> True, ShowCellLabel -> 
             False, CellLabelMargins -> {{23, Inherited}, {
               Inherited, Inherited}}, CellFrameColor -> GrayLevel[0], 
             DefaultFormatType -> DefaultOutputFormatType, 
             LineSpacing -> {1, 1}, AutoItalicWords -> {}, StyleMenuListing -> 
             None, FontFamily -> "Helvetica", FontSize -> 10], 
            Cell[
             StyleData["Print", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Print", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Print", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          
          TextData[{
           "PlacedGraphics cell style to be used when importing a graphic \
from another  application or when presenting a graphic not associated with ", 
            
            StyleBox["Mathematica", FontSlant -> "Italic"], 
            " input. May be followed by NumberedFigureCaption."}], "Text"], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["PlacedGraphics"], CellFrame -> False, 
             CellMargins -> {{21, 21}, {8, 10}}, CellGroupingRules -> 
             "GraphicsGrouping", CellHorizontalScrolling -> True, 
             ShowCellLabel -> False, TextAlignment -> Left, 
             LineSpacing -> {1, 1}, 
             InsetBoxOptions -> {
              BaseStyle -> {CellFrame -> None, Background -> None}}], 
            Cell[
             StyleData[
             "PlacedGraphics", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "PlacedGraphics", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "PlacedGraphics", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["CellLabel"], 
             CellMargins -> {{5, Inherited}, {Inherited, Inherited}}, 
             LineSpacing -> {1, 1}, StyleMenuListing -> None, FontFamily -> 
             "Helvetica", FontSize -> 8, FontSlant -> "Oblique", FontColor -> 
             RGBColor[0.115343, 0.350561, 0.362966]], 
            Cell[
             StyleData[
             "CellLabel", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["CellLabel", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["CellLabel", "Printout", StyleDefinitions -> None]]}, 
           Closed]]}, Closed]], 
      Cell[
       CellGroupData[{
         Cell[
         "Styles for Automatic Numbering and Lists", "Section", CellFrame -> 
          False, CellDingbat -> None, ShowCellBracket -> True, 
          CellMargins -> {{0, 0}, {10, 40}}, 
          CellFrameMargins -> {{20, 4}, {8, 8}}, FontColor -> GrayLevel[1], 
          Background -> RGBColor[0.269902, 0.558434, 0.715618]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["DisplayFormulaNumbered"], 
             CellMargins -> {{39, 21}, {4, 4}}, CellFrameLabels -> {{None, 
                Cell[
                 TextData[{"(", 
                   CounterBox["DisplayFormulaNumbered"], ")"}], 
                 CellSize -> {30, Inherited}, TextAlignment -> Right]}, {
               None, None}}, DefaultFormatType -> TraditionalForm, 
             HyphenationOptions -> {
              "HyphenationCharacter" -> "\[Continuation]"}, 
             LineSpacing -> {1, 1}, LanguageCategory -> "Formula", 
             ScriptLevel -> 0, SingleLetterItalics -> True, CounterIncrements -> 
             "DisplayFormulaNumbered", MenuSortingValue -> 1700, 
             UnderoverscriptBoxOptions -> {
              LimitsPositioning -> True}, $CellContext`StripStyleOnPaste -> 
             True], 
            Cell[
             StyleData[
             "DisplayFormulaNumbered", "Presentation", StyleDefinitions -> 
              None]], 
            Cell[
             StyleData[
             "DisplayFormulaNumbered", "SlideShow", StyleDefinitions -> 
              None]], 
            Cell[
             StyleData[
             "DisplayFormulaNumbered", "Printout", StyleDefinitions -> 
              None]]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["InlineFormula"], CellMargins -> {{10, 4}, {0, 8}}, 
             HyphenationOptions -> {
              "HyphenationCharacter" -> "\[Continuation]"}, LanguageCategory -> 
             "Formula", ScriptLevel -> 1, SingleLetterItalics -> True, 
             MenuSortingValue -> None, $CellContext`StripStyleOnPaste -> 
             True], 
            Cell[
             StyleData[
             "InlineFormula", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "InlineFormula", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "InlineFormula", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["NumberedFigureCaption"], CellDingbat -> 
             "\[FilledUpTriangle]", CellMargins -> {{21, 21}, {8, 0}}, 
             PageBreakAbove -> False, TextAlignment -> Left, 
             LineSpacing -> {1, 1}, CounterIncrements -> "NumberedFigure", 
             MenuSortingValue -> 1711, FormatTypeAutoConvert -> False, 
             FontFamily -> "Helvetica", FontSize -> 10], 
            Cell[
             StyleData[
             "NumberedFigureCaption", "Presentation", StyleDefinitions -> 
              None]], 
            Cell[
             StyleData[
             "NumberedFigureCaption", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "NumberedFigureCaption", "Printout", StyleDefinitions -> None]]},
            Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["NumberedTableCaption"], CellDingbat -> 
             "\[FilledUpTriangle]", CellMargins -> {{21, 21}, {8, 0}}, 
             PageBreakAbove -> False, LineSpacing -> {1, 1}, 
             CounterIncrements -> "NumberedTable", MenuSortingValue -> 1712, 
             FontFamily -> "Helvetica", FontSize -> 10], 
            Cell[
             StyleData[
             "NumberedTableCaption", "Presentation", StyleDefinitions -> 
              None]], 
            Cell[
             StyleData[
             "NumberedTableCaption", "SlideShow", StyleDefinitions -> None]], 
            
            Cell[
             StyleData[
             "NumberedTableCaption", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["NumberedProgramCaption"], CellDingbat -> 
             "\[FilledUpTriangle]", CellMargins -> {{21, 21}, {8, 0}}, 
             PageBreakAbove -> False, LineSpacing -> {1, 1}, 
             CounterIncrements -> "NumberedProgram", MenuSortingValue -> 1713,
              FormatTypeAutoConvert -> False, FontFamily -> "Helvetica", 
             FontSize -> 10], 
            Cell[
             StyleData[
             "NumberedProgramCaption", "Presentation", StyleDefinitions -> 
              None]], 
            Cell[
             StyleData[
             "NumberedProgramCaption", "SlideShow", StyleDefinitions -> 
              None]], 
            Cell[
             StyleData[
             "NumberedProgramCaption", "Printout", StyleDefinitions -> 
              None]]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Caption"], CellDingbat -> "\[FilledUpTriangle]", 
             CellMargins -> {{21, 21}, {Inherited, 5}}, PageBreakAbove -> 
             False, LineSpacing -> {1, 1}, FontFamily -> "Helvetica", 
             FontSize -> 10], 
            Cell[
             StyleData["Caption", "Presentation", StyleDefinitions -> None]], 
            
            Cell[
             StyleData["Caption", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Caption", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Item"], CellDingbat -> "\[FilledSmallCircle]", 
             CellMargins -> {{58, 21}, {Inherited, Inherited}}, 
             LineSpacing -> {1, 1}, 
             CounterAssignments -> {{"SubitemNumbered", 0}}, MenuSortingValue -> 
             1775, FontFamily -> "Times", FontSize -> 12], 
            Cell[
             StyleData["Item", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Item", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Item", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Subitem"], CellDingbat -> "\[FilledSmallCircle]", 
             CellMargins -> {{74, 21}, {Inherited, Inherited}}, 
             LineSpacing -> {1, 1}, MenuSortingValue -> 1776, FontFamily -> 
             "Times", FontSize -> 12], 
            Cell[
             StyleData["Subitem", "Presentation", StyleDefinitions -> None]], 
            
            Cell[
             StyleData["Subitem", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Subitem", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["ItemNumbered"], CellDingbat -> Cell[
               TextData[{
                 CounterBox["ItemNumbered"], "."}], FontWeight -> "Bold", 
               CellSize -> {20, Inherited}, TextAlignment -> Right], 
             CellMargins -> {{58, 21}, {Inherited, Inherited}}, CellBaseline -> 
             Baseline, LineSpacing -> {1, 1}, TabSpacings -> {4.}, 
             CounterAssignments -> {{"SubitemNumbered", 0}}, MenuSortingValue -> 
             1777, FontFamily -> "Times", FontSize -> 12], 
            Cell[
             StyleData[
             "ItemNumbered", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "ItemNumbered", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["ItemNumbered", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["SubitemNumbered"], CellDingbat -> Cell[
               TextData[{
                 CounterBox["SubitemNumbered", CounterFunction :> (Part[
                    CharacterRange["a", "z"], #]& )], "."}], FontWeight -> 
               "Bold"], CellMargins -> {{74, 21}, {Inherited, Inherited}}, 
             CellBaseline -> Baseline, LineSpacing -> {1, 1}, 
             MenuSortingValue -> 1778, FontFamily -> "Times", FontSize -> 12], 
            Cell[
             StyleData[
             "SubitemNumbered", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "SubitemNumbered", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "SubitemNumbered", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData[
             "ItemParagraph", StyleDefinitions -> StyleData["Item"]], 
             CellDingbat -> None, CounterIncrements -> "ItemParagraph", 
             MenuSortingValue -> 1779], 
            Cell[
             StyleData[
             "ItemParagraph", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "ItemParagraph", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["ItemParagraph", "Printout", StyleDefinitions -> None],
              TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData[
             "SubitemParagraph", StyleDefinitions -> StyleData["Subitem"]], 
             CellDingbat -> None, CounterIncrements -> "SubitemParagraph", 
             MenuSortingValue -> 1800], 
            Cell[
             StyleData[
             "SubitemParagraph", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "SubitemParagraph", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "SubitemParagraph", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Reference"], CellDingbat -> Cell[
               TextData[{"[", 
                 CounterBox["Reference"], "]"}], "SR", 
               CellSize -> {25, Inherited}, TextAlignment -> Right], 
             CellMargins -> {{47, 21}, {Inherited, Inherited}}, 
             CellFrameLabels -> {{None, None}, {None, None}}, 
             LineSpacing -> {1, 1}, CounterIncrements -> "Reference", 
             MenuSortingValue -> 1870, FontFamily -> "Helvetica", FontSize -> 
             10], 
            Cell[
             StyleData["Reference", "Presentation", StyleDefinitions -> None],
              CellMargins -> {{59, 21}, {Inherited, Inherited}}], 
            Cell[
             StyleData["Reference", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Reference", "Printout", StyleDefinitions -> None], 
             CellMargins -> {{45, 21}, {Inherited, Inherited}}, 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData[
             "DOIReference", StyleDefinitions -> StyleData["Reference"]], 
             CellDingbat -> None, CellMargins -> {{21, 21}, {Inherited, 10}}, 
             CounterIncrements -> "DOIReference", FontSize -> 9], 
            Cell[
             StyleData["DOIReference", "Presentation"], 
             CellMargins -> {{21, 21}, {Inherited, 10}}], 
            Cell[
             StyleData["DOIReference", "Printout"], 
             CellMargins -> {{21, 21}, {Inherited, 10}}]}, Closed]], 
         Cell[
          StyleData[
          "DOIReference1", StyleDefinitions -> StyleData["DOIReference"]], 
          CellChangeTimes -> {{3.500647185533589*^9, 3.500647185556703*^9}}], 
         
         Cell[
          StyleData[
          "DOIReference10", StyleDefinitions -> StyleData["DOIReference"]], 
          CellChangeTimes -> {{3.500647185533589*^9, 
           3.5006471855594378`*^9}}]}, Closed]], 
      Cell[
       CellGroupData[{
         Cell[
         "Journal Element Styles", "Section", CellFrame -> False, CellDingbat -> 
          None, ShowCellBracket -> True, CellMargins -> {{0, 0}, {10, 40}}, 
          CellFrameMargins -> {{20, 4}, {8, 8}}, FontColor -> GrayLevel[1], 
          Background -> RGBColor[0.269902, 0.558434, 0.715618]], 
         Cell[
          StyleData["OnlineHeader"], ShowCellBracket -> False, ShowSelection -> 
          True, CellMargins -> {{0, 0}, {0, 0}}, 
          CellGroupingRules -> {"TitleGrouping", 30}, PageBreakBelow -> False,
           CellFrameMargins -> {{21, 21}, {2, 8}}, Hyphenation -> False, 
          LineSpacing -> {1, 1}, StyleMenuListing -> None, FontFamily -> 
          "Times", FontSize -> 14, FontWeight -> "Plain", FontSlant -> 
          "Italic", FontColor -> 
          RGBColor[
           0.9864194705119402, 0.9585259784847792, 0.7428549629968719], 
          Background -> RGBColor[0, 0, 0]], 
         Cell[
         "ColumnTitle is a renaming of PreTitle.", "Text", 
          CellChangeTimes -> {{3.4810538075243597`*^9, 
           3.481053831482122*^9}}], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["ColumnTitle"], ShowCellBracket -> False, 
             CellMargins -> {{21, 21}, {14, 4}}, 
             CellGroupingRules -> {"TitleGrouping", 0}, PageBreakBelow -> 
             False, CellFrameMargins -> {{55, 4}, {8, 20}}, Hyphenation -> 
             False, LineSpacing -> {1, 1}, StyleMenuListing -> None, 
             FontFamily -> "Helvetica", FontSize -> 13, FontWeight -> 
             "Regular"], 
            Cell[
             StyleData[
             "ColumnTitle", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["ColumnTitle", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["ColumnTitle", "Printout", StyleDefinitions -> None]]},
            Closed]], 
         Cell[
         "Author to be used after the Title cell with author name(s). Author \
name(s) may be preceded by \"Edited by \" for certain columns. Text in author \
cell to be used as the left page header.", "Text"], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Author"], ShowCellBracket -> False, ShowSelection -> 
             True, CellMargins -> {{21, 21}, {4, 6}}, CellGroupingRules -> 
             "NormalGrouping", PageBreakBelow -> False, Hyphenation -> False, 
             LineSpacing -> {1, 1}, ParagraphSpacing -> {0, 0}, 
             MenuSortingValue -> 1155, FontFamily -> "Helvetica", FontSize -> 
             14, FontWeight -> "Bold"], 
            Cell[
             StyleData["Author", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Author", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Author", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Abstract"], ShowCellBracket -> False, ShowSelection -> 
             True, CellMargins -> {{21, 83}, {4, 25}}, Hyphenation -> False, 
             LineSpacing -> {1, 3}, MenuSortingValue -> 1156, FontFamily -> 
             "Helvetica", FontSize -> 13, FontWeight -> "Regular", FontSlant -> 
             "Plain"], 
            Cell[
             StyleData["Abstract", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Abstract", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Abstract", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Question"], CellFrame -> {{0, 0}, {0, 2}}, 
             CellDingbat -> "Q:", CellMargins -> {{45, 45}, {8, 8}}, 
             CellFrameMargins -> {{0, 0}, {2, 4}}, LineSpacing -> {1, 1}, 
             MenuSortingValue -> 1820, FontFamily -> "Times", FontSize -> 14, 
             FontWeight -> "Bold", FontColor -> 
             RGBColor[0.115511, 0.321752, 0.580118]], 
            Cell[
             StyleData["Question", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Question", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Question", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Answer"], CellDingbat -> 
             Cell["A:", FontWeight -> "Bold"], 
             CellMargins -> {{45, 45}, {Inherited, Inherited}}, 
             LineSpacing -> {1, 1}, CounterIncrements -> "Text", 
             MenuSortingValue -> 1860, FontFamily -> "Times", FontSize -> 12], 
            Cell[
             StyleData["Answer", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Answer", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Answer", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["TextAboutAuthor"], CellMargins -> {{21, 21}, {2, 5}}, 
             LineSpacing -> {1, 1}, CounterIncrements -> "Text", 
             MenuSortingValue -> 1880, FontSize -> 12], 
            Cell[
             StyleData[
             "TextAboutAuthor", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "TextAboutAuthor", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "TextAboutAuthor", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["SectionAboutAuthor"], 
             CellMargins -> {{21, 21}, {10, 30}}, 
             CellGroupingRules -> {"SectionGrouping", 40}, PageBreakBelow -> 
             False, CellFrameMargins -> 4, Hyphenation -> False, 
             LineSpacing -> {1, 1}, MenuSortingValue -> 1875, FontFamily -> 
             "Helvetica", FontSize -> 12, FontWeight -> "Bold"], 
            Cell[
             StyleData[
             "SectionAboutAuthor", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "SectionAboutAuthor", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "SectionAboutAuthor", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
         "Styles for algorithm listings, based on BulletedList, indent an \
additional 12 points for each level, dingbat also changes", "Text"], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Algorithm1"], CellDingbat -> "\[FilledSmallCircle]", 
             CellMargins -> {{58, 21}, {Inherited, Inherited}}, 
             LineSpacing -> {1, 1}, FontFamily -> "Times", FontSize -> 12], 
            Cell[
             StyleData[
             "Algorithm1", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Algorithm1", "SlideShow", StyleDefinitions -> None]], 
            
            Cell[
             StyleData["Algorithm1", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Algorithm2"], CellDingbat -> "\[Dash]", 
             CellMargins -> {{74, 21}, {Inherited, Inherited}}, 
             LineSpacing -> {1, 1}, FontFamily -> "Times", FontSize -> 12], 
            Cell[
             StyleData[
             "Algorithm2", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Algorithm2", "SlideShow", StyleDefinitions -> None]], 
            
            Cell[
             StyleData["Algorithm2", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Algorithm3"], CellDingbat -> "\[Star]", 
             CellMargins -> {{86, 21}, {Inherited, Inherited}}, 
             LineSpacing -> {1, 1}, FontFamily -> "Times", FontSize -> 12], 
            Cell[
             StyleData[
             "Algorithm3", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Algorithm3", "SlideShow", StyleDefinitions -> None]], 
            
            Cell[
             StyleData["Algorithm3", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Algorithm4"], CellDingbat -> "\[CenterDot]", 
             CellMargins -> {{98, 21}, {Inherited, Inherited}}, 
             LineSpacing -> {1, 1}, FontFamily -> "Times", FontSize -> 12], 
            Cell[
             StyleData[
             "Algorithm4", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Algorithm4", "SlideShow", StyleDefinitions -> None]], 
            
            Cell[
             StyleData["Algorithm4", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]]}, Closed]], 
      Cell[
       CellGroupData[{
         Cell[
         "Enunciations", "Section", CellFrame -> False, CellDingbat -> None, 
          ShowCellBracket -> True, CellMargins -> {{0, 0}, {10, 40}}, 
          CellFrameMargins -> {{20, 4}, {8, 8}}, FontColor -> GrayLevel[1], 
          Background -> RGBColor[0.269902, 0.558434, 0.715618]], 
         Cell["Theorem", "Subsubsection", MenuSortingValue -> 1871], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Theorem"], CellMargins -> {{21, 21}, {4, 4}}, 
             CellGroupingRules -> "GraphicsGrouping", LineSpacing -> {1, 1}, 
             ParagraphIndent -> 24, CounterIncrements -> "Theorem", 
             CounterAssignments -> {{"EnunciationItem1Numbered", 0}, {
               "Item1Numbered", 0}}, MenuSortingValue -> 1871, FontSlant -> 
             "Italic"], 
            Cell[
             StyleData["Theorem", "Presentation", StyleDefinitions -> None]], 
            
            Cell[
             StyleData["Theorem", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Theorem", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["TheoremLabel"], StyleMenuListing -> None, FontWeight -> 
             "Bold", FontSlant -> "Plain"], 
            Cell[
             StyleData[
             "TheoremLabel", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "TheoremLabel", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "TheoremLabel", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["TheoremContinuation"], 
             CellMargins -> {{21, 21}, {4, 4}}, CellGroupingRules -> 
             "GraphicsGrouping", LineSpacing -> {1, 1}, CounterIncrements -> 
             "TheoremContinuation", MenuSortingValue -> 1872, FontSlant -> 
             "Italic"], 
            Cell[
             StyleData[
             "TheoremContinuation", "Presentation", StyleDefinitions -> 
              None]], 
            Cell[
             StyleData[
             "TheoremContinuation", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "TheoremContinuation", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell["Example", "Subsubsection", StyleMenuListing -> None], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Example"], CellMargins -> {{21, 21}, {4, 4}}, 
             CellGroupingRules -> "GraphicsGrouping", LineSpacing -> {1, 1}, 
             ParagraphIndent -> 24, CounterIncrements -> "Example", 
             CounterAssignments -> {{"EnunciationItem1Numbered", 0}, {
               "Item1Numbered", 0}}, MenuSortingValue -> 1873, FontSlant -> 
             "Plain"], 
            Cell[
             StyleData["Example", "Presentation", StyleDefinitions -> None]], 
            
            Cell[
             StyleData["Example", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Example", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["ExampleLabel"], StyleMenuListing -> None, FontWeight -> 
             "Bold", FontSlant -> "Italic"], 
            Cell[
             StyleData[
             "ExampleLabel", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "ExampleLabel", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "ExampleLabel", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["ExampleContinuation"], 
             CellMargins -> {{21, 21}, {4, 4}}, CellGroupingRules -> 
             "GraphicsGrouping", LineSpacing -> {1, 1}, CounterIncrements -> 
             "ExampleContinuation", MenuSortingValue -> 1874], 
            Cell[
             StyleData[
             "ExampleContinuation", "Presentation", StyleDefinitions -> 
              None]], 
            Cell[
             StyleData[
             "ExampleContinuation", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "ExampleContinuation", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell["Proof", "Subsubsection", StyleMenuListing -> None], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Proof"], CellMargins -> {{21, 21}, {4, 4}}, 
             CellGroupingRules -> "GraphicsGrouping", LineSpacing -> {1, 1}, 
             ParagraphIndent -> 24, 
             CounterAssignments -> {{"EnunciationItem1Numbered", 0}, {
               "Item1Numbered", 0}}, MenuSortingValue -> 1875, FontSlant -> 
             "Plain"], 
            Cell[
             StyleData["Proof", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Proof", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Proof", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["ProofLabel"], StyleMenuListing -> None, FontWeight -> 
             "Bold", FontSlant -> "Italic"], 
            Cell[
             StyleData[
             "ProofLabel", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["ProofLabel", "SlideShow", StyleDefinitions -> None]], 
            
            Cell[
             StyleData["ProofLabel", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["ProofContinuation"], 
             CellMargins -> {{21, 21}, {4, 4}}, CellGroupingRules -> 
             "GraphicsGrouping", LineSpacing -> {1, 1}, CounterIncrements -> 
             "ProofContinuation"], 
            Cell[
             StyleData[
             "ProofContinuation", "Presentation", StyleDefinitions -> None]], 
            
            Cell[
             StyleData[
             "ProofContinuation", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "ProofContinuation", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["QED"], CellMargins -> {{21, 21}, {8, 0}}, 
             StyleMenuListing -> None, FontSize -> 14], 
            Cell[
             StyleData["QED", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["QED", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["QED", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell["Corollary", "Subsubsection", StyleMenuListing -> None], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Corollary"], CellMargins -> {{21, 21}, {4, 4}}, 
             CellGroupingRules -> "GraphicsGrouping", Hyphenation -> True, 
             LineSpacing -> {1, 1}, ParagraphIndent -> 24, CounterIncrements -> 
             "Corollary", 
             CounterAssignments -> {{"EnunciationItem1Numbered", 0}, {
               "Item1Numbered", 0}}, StyleMenuListing -> None, FontSlant -> 
             "Italic"], 
            Cell[
             StyleData[
             "Corollary", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Corollary", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Corollary", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["CorollaryLabel"], StyleMenuListing -> None, 
             FontWeight -> "Bold", FontSlant -> "Plain"], 
            Cell[
             StyleData[
             "CorollaryLabel", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "CorollaryLabel", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "CorollaryLabel", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["CorollaryContinuation"], 
             CellMargins -> {{21, 21}, {4, 4}}, CellGroupingRules -> 
             "GraphicsGrouping", Hyphenation -> True, LineSpacing -> {1, 1}, 
             CounterIncrements -> "CorollaryContinuation", StyleMenuListing -> 
             None, FontSlant -> "Italic"], 
            Cell[
             StyleData[
             "CorollaryContinuation", "Presentation", StyleDefinitions -> 
              None]], 
            Cell[
             StyleData[
             "CorollaryContinuation", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "CorollaryContinuation", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell["Lemma", "Subsubsection", StyleMenuListing -> None], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Lemma"], CellMargins -> {{21, 21}, {4, 4}}, 
             CellGroupingRules -> "GraphicsGrouping", Hyphenation -> True, 
             LineSpacing -> {1, 1}, ParagraphIndent -> 24, CounterIncrements -> 
             "Lemma", 
             CounterAssignments -> {{"EnunciationItem1Numbered", 0}, {
               "Item1Numbered", 0}}, StyleMenuListing -> None, FontSlant -> 
             "Italic"], 
            Cell[
             StyleData["Lemma", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Lemma", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Lemma", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["LemmaLabel"], StyleMenuListing -> None, FontWeight -> 
             "Bold", FontSlant -> "Plain"], 
            Cell[
             StyleData[
             "LemmaLabel", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["LemmaLabel", "SlideShow", StyleDefinitions -> None]], 
            
            Cell[
             StyleData["LemmaLabel", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["LemmaContinuation"], 
             CellMargins -> {{21, 21}, {4, 4}}, CellGroupingRules -> 
             "GraphicsGrouping", Hyphenation -> True, LineSpacing -> {1, 1}, 
             CounterIncrements -> "LemmaContinuation", StyleMenuListing -> 
             None, FontSlant -> "Italic"], 
            Cell[
             StyleData[
             "LemmaContinuation", "Presentation", StyleDefinitions -> None]], 
            
            Cell[
             StyleData[
             "LemmaContinuation", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "LemmaContinuation", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell["Definition", "Subsubsection", StyleMenuListing -> None], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Definition"], CellMargins -> {{21, 21}, {4, 4}}, 
             CellGroupingRules -> "GraphicsGrouping", Hyphenation -> True, 
             LineSpacing -> {1, 1}, ParagraphIndent -> 24, CounterIncrements -> 
             "Definition", 
             CounterAssignments -> {{"EnunciationItem1Numbered", 0}, {
               "Item1Numbered", 0}}, StyleMenuListing -> None, FontSlant -> 
             "Italic"], 
            Cell[
             StyleData[
             "Definition", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Definition", "SlideShow", StyleDefinitions -> None]], 
            
            Cell[
             StyleData["Definition", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["DefinitionLabel"], StyleMenuListing -> None, 
             FontWeight -> "Bold", FontSlant -> "Plain"], 
            Cell[
             StyleData[
             "DefinitionLabel", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "DefinitionLabel", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "DefinitionLabel", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["DefinitionContinuation"], 
             CellMargins -> {{21, 21}, {4, 4}}, CellGroupingRules -> 
             "GraphicsGrouping", Hyphenation -> True, LineSpacing -> {1, 1}, 
             CounterIncrements -> "DefinitionContinuation", StyleMenuListing -> 
             None, FontSlant -> "Italic"], 
            Cell[
             StyleData[
             "DefinitionContinuation", "Presentation", StyleDefinitions -> 
              None]], 
            Cell[
             StyleData[
             "DefinitionContinuation", "SlideShow", StyleDefinitions -> 
              None]], 
            Cell[
             StyleData[
             "DefinitionContinuation", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell["Proposition", "Subsubsection", StyleMenuListing -> None], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Proposition"], CellMargins -> {{21, 21}, {4, 4}}, 
             CellGroupingRules -> "GraphicsGrouping", Hyphenation -> True, 
             LineSpacing -> {1, 1}, ParagraphIndent -> 24, CounterIncrements -> 
             "Proposition", 
             CounterAssignments -> {{"EnunciationItem1Numbered", 0}, {
               "Item1Numbered", 0}}, StyleMenuListing -> None, FontSlant -> 
             "Italic"], 
            Cell[
             StyleData[
             "Proposition", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Proposition", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Proposition", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["PropositionLabel"], StyleMenuListing -> None, 
             FontWeight -> "Bold", FontSlant -> "Plain"], 
            Cell[
             StyleData[
             "PropositionLabel", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "PropositionLabel", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "PropositionLabel", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["PropositionContinuation"], 
             CellMargins -> {{21, 21}, {4, 4}}, CellGroupingRules -> 
             "GraphicsGrouping", Hyphenation -> True, LineSpacing -> {1, 1}, 
             CounterIncrements -> "PropositionContinuation", StyleMenuListing -> 
             None, FontSlant -> "Italic"], 
            Cell[
             StyleData[
             "PropositionContinuation", "Presentation", StyleDefinitions -> 
              None]], 
            Cell[
             StyleData[
             "PropositionContinuation", "SlideShow", StyleDefinitions -> 
              None]], 
            Cell[
             StyleData[
             "PropositionContinuation", "Printout", StyleDefinitions -> None],
              TextJustification -> 1.]}, Closed]], 
         Cell["Conjecture", "Subsubsection", StyleMenuListing -> None], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Conjecture"], CellMargins -> {{21, 21}, {4, 4}}, 
             CellGroupingRules -> "GraphicsGrouping", Hyphenation -> True, 
             LineSpacing -> {1, 1}, ParagraphIndent -> 24, CounterIncrements -> 
             "Conjecture", 
             CounterAssignments -> {{"EnunciationItem1Numbered", 0}, {
               "Item1Numbered", 0}}, StyleMenuListing -> None, FontSlant -> 
             "Italic"], 
            Cell[
             StyleData[
             "Conjecture", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Conjecture", "SlideShow", StyleDefinitions -> None]], 
            
            Cell[
             StyleData["Conjecture", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["ConjectureLabel"], StyleMenuListing -> None, 
             FontWeight -> "Bold", FontSlant -> "Plain"], 
            Cell[
             StyleData[
             "ConjectureLabel", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "ConjectureLabel", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "ConjectureLabel", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["ConjectureContinuation"], 
             CellMargins -> {{21, 21}, {4, 4}}, CellGroupingRules -> 
             "GraphicsGrouping", Hyphenation -> True, LineSpacing -> {1, 1}, 
             CounterIncrements -> "ConjectureContinuation", StyleMenuListing -> 
             None, FontSlant -> "Italic"], 
            Cell[
             StyleData[
             "ConjectureContinuation", "Presentation", StyleDefinitions -> 
              None]], 
            Cell[
             StyleData[
             "ConjectureContinuation", "SlideShow", StyleDefinitions -> 
              None]], 
            Cell[
             StyleData[
             "ConjectureContinuation", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell["Axiom", "Subsubsection", StyleMenuListing -> None], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Axiom"], CellMargins -> {{21, 21}, {4, 4}}, 
             CellGroupingRules -> "GraphicsGrouping", Hyphenation -> True, 
             LineSpacing -> {1, 1}, ParagraphIndent -> 24, CounterIncrements -> 
             "Axiom", 
             CounterAssignments -> {{"EnunciationItem1Numbered", 0}, {
               "Item1Numbered", 0}}, StyleMenuListing -> None, FontSlant -> 
             "Italic"], 
            Cell[
             StyleData["Axiom", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Axiom", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Axiom", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["AxiomLabel"], StyleMenuListing -> None, FontWeight -> 
             "Bold", FontSlant -> "Plain"], 
            Cell[
             StyleData[
             "AxiomLabel", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["AxiomLabel", "SlideShow", StyleDefinitions -> None]], 
            
            Cell[
             StyleData["AxiomLabel", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["AxiomContinuation"], 
             CellMargins -> {{21, 21}, {4, 4}}, CellGroupingRules -> 
             "GraphicsGrouping", Hyphenation -> True, LineSpacing -> {1, 1}, 
             CounterIncrements -> "AxiomContinuation", StyleMenuListing -> 
             None, FontSlant -> "Italic"], 
            Cell[
             StyleData[
             "AxiomContinuation", "Presentation", StyleDefinitions -> None]], 
            
            Cell[
             StyleData[
             "AxiomContinuation", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "AxiomContinuation", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell["Rule", "Subsubsection", StyleMenuListing -> None], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Rule"], CellMargins -> {{21, 21}, {4, 4}}, 
             CellGroupingRules -> "GraphicsGrouping", Hyphenation -> True, 
             LineSpacing -> {1, 1}, ParagraphIndent -> 24, CounterIncrements -> 
             "Rule", CounterAssignments -> {{"EnunciationItem1Numbered", 0}, {
               "Item1Numbered", 0}}, StyleMenuListing -> None, FontSlant -> 
             "Italic"], 
            Cell[
             StyleData["Rule", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Rule", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Rule", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["RuleLabel"], StyleMenuListing -> None, FontWeight -> 
             "Bold", FontSlant -> "Plain"], 
            Cell[
             StyleData[
             "RuleLabel", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["RuleLabel", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["RuleLabel", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["RuleContinuation"], CellMargins -> {{21, 21}, {4, 4}},
              CellGroupingRules -> "GraphicsGrouping", Hyphenation -> True, 
             LineSpacing -> {1, 1}, CounterIncrements -> "RuleContinuation", 
             StyleMenuListing -> None, FontSlant -> "Italic"], 
            Cell[
             StyleData[
             "RuleContinuation", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "RuleContinuation", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "RuleContinuation", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell["Remark", "Subsubsection", StyleMenuListing -> None], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Remark"], CellMargins -> {{21, 21}, {4, 4}}, 
             CellGroupingRules -> "GraphicsGrouping", Hyphenation -> True, 
             LineSpacing -> {1, 1}, ParagraphIndent -> 24, CounterIncrements -> 
             "Remark", 
             CounterAssignments -> {{"EnunciationItem1Numbered", 0}, {
               "Item1Numbered", 0}}, StyleMenuListing -> None, FontSlant -> 
             "Plain"], 
            Cell[
             StyleData["Remark", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Remark", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Remark", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["RemarkLabel"], StyleMenuListing -> None, FontWeight -> 
             "Bold", FontSlant -> "Italic"], 
            Cell[
             StyleData[
             "RemarkLabel", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["RemarkLabel", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["RemarkLabel", "Printout", StyleDefinitions -> None]]},
            Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["RemarkContinuation"], 
             CellMargins -> {{21, 21}, {4, 4}}, CellGroupingRules -> 
             "GraphicsGrouping", Hyphenation -> True, LineSpacing -> {1, 1}, 
             CounterIncrements -> "RemarkContinuation", StyleMenuListing -> 
             None], 
            Cell[
             StyleData[
             "RemarkContinuation", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "RemarkContinuation", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "RemarkContinuation", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell["Solution", "Subsubsection", StyleMenuListing -> None], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Solution"], CellMargins -> {{21, 21}, {4, 4}}, 
             CellGroupingRules -> "GraphicsGrouping", Hyphenation -> True, 
             LineSpacing -> {1, 1}, ParagraphIndent -> 24, 
             CounterAssignments -> {{"EnunciationItem1Numbered", 0}, {
               "Item1Numbered", 0}}, StyleMenuListing -> None, FontSlant -> 
             "Plain"], 
            Cell[
             StyleData["Solution", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Solution", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Solution", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["SolutionLabel"], StyleMenuListing -> None, FontWeight -> 
             "Bold", FontSlant -> "Italic"], 
            Cell[
             StyleData[
             "SolutionLabel", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "SolutionLabel", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "SolutionLabel", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["SolutionContinuation"], 
             CellMargins -> {{21, 21}, {4, 4}}, CellGroupingRules -> 
             "GraphicsGrouping", Hyphenation -> True, LineSpacing -> {1, 1}, 
             CounterIncrements -> "SolutionContinuation", StyleMenuListing -> 
             None], 
            Cell[
             StyleData[
             "SolutionContinuation", "Presentation", StyleDefinitions -> 
              None]], 
            Cell[
             StyleData[
             "SolutionContinuation", "SlideShow", StyleDefinitions -> None]], 
            
            Cell[
             StyleData[
             "SolutionContinuation", "Printout", StyleDefinitions -> None], 
             TextJustification -> 1.]}, Closed]]}, Closed]], 
      Cell[
       CellGroupData[{
         Cell[
         "Display Formulas and Programming", "Section", CellFrame -> False, 
          CellDingbat -> None, ShowCellBracket -> True, 
          CellMargins -> {{0, 0}, {10, 40}}, 
          CellFrameMargins -> {{20, 4}, {8, 8}}, FontColor -> GrayLevel[1], 
          Background -> RGBColor[0.269902, 0.558434, 0.715618]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["DisplayFormula"], CellMargins -> {{39, 21}, {4, 4}}, 
             CellHorizontalScrolling -> True, PageBreakAbove -> False, 
             DefaultFormatType -> TraditionalForm, LineSpacing -> {1, 1}, 
             ScriptLevel -> 0, SingleLetterItalics -> True, SpanMaxSize -> 
             DirectedInfinity[1], FormatTypeAutoConvert -> False, FontFamily -> 
             "Times", FontSize -> 12, 
             UnderoverscriptBoxOptions -> {LimitsPositioning -> True}, 
             GridBoxOptions -> {AllowScriptLevelChange -> False}], 
            Cell[
             StyleData[
             "DisplayFormula", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "DisplayFormula", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "DisplayFormula", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Program"], CellMargins -> {{21, 21}, {8, 10}}, 
             LineSpacing -> {1, 1}, MenuSortingValue -> 1455, FontFamily -> 
             "Courier", FontSize -> 12, FontWeight -> "Plain"], 
            Cell[
             StyleData["Program", "Presentation", StyleDefinitions -> None]], 
            
            Cell[
             StyleData["Program", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Program", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Table"], CellMargins -> {{21, 21}, {8, 10}}, 
             DefaultFormatType -> TraditionalForm, TextAlignment -> Center, 
             LineSpacing -> {1, 1}, FontFamily -> "Times", FontSize -> 12, 
             Background -> GrayLevel[0.899001]], 
            Cell[
             StyleData["Table", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Table", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Table", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
         "PseudoCellExpression cell style to be used when displaying \
unformatted box expressions. ", "Text"], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["PseudoCellExpression"], 
             CellFrame -> {{0, 0}, {0, 0.5}}, 
             CellMargins -> {{21, 21}, {Inherited, Inherited}}, 
             CellFrameMargins -> 2, LineSpacing -> {1, 1}, FontFamily -> 
             "Courier", FontSize -> 12], 
            Cell[
             StyleData[
             "PseudoCellExpression", "Presentation", StyleDefinitions -> 
              None]], 
            Cell[
             StyleData[
             "PseudoCellExpression", "SlideShow", StyleDefinitions -> None]], 
            
            Cell[
             StyleData[
             "PseudoCellExpression", "Printout", StyleDefinitions -> None]]}, 
           Closed]]}, Closed]], 
      Cell[
       CellGroupData[{
         Cell[
         "Styles for Headers and Footers", "Section", CellFrame -> False, 
          CellDingbat -> None, ShowCellBracket -> True, 
          CellMargins -> {{0, 0}, {10, 40}}, 
          CellFrameMargins -> {{20, 4}, {8, 8}}, FontColor -> GrayLevel[1], 
          Background -> RGBColor[0.269902, 0.558434, 0.715618]], 
         Cell[
          StyleData["Header"], CellMargins -> {{0, 0}, {4, 1}}, 
          StyleMenuListing -> None, FontFamily -> "Times", FontSize -> 9, 
          FontSlant -> "Italic"], 
         Cell[
          StyleData["PageNumber"], CellMargins -> {{0, 0}, {4, 1}}, 
          StyleMenuListing -> None, FontFamily -> "Times", FontSize -> 9, 
          FontWeight -> "Bold"], 
         Cell[
          StyleData["Footer"], CellMargins -> {{0, 0}, {0, 4}}, 
          StyleMenuListing -> None, FontFamily -> "Helvetica", FontSize -> 7, 
          FontSlant -> "Oblique"]}, Closed]], 
      Cell[
       CellGroupData[{
         Cell[
         "Hyperlink Styles", "Section", CellFrame -> False, CellDingbat -> 
          None, ShowCellBracket -> True, CellMargins -> {{0, 0}, {10, 40}}, 
          CellFrameMargins -> {{20, 4}, {8, 8}}, FontColor -> GrayLevel[1], 
          Background -> RGBColor[0.269902, 0.558434, 0.715618]], 
         Cell["The cells below define styles used for ButtonBoxes.", "Text"], 
         
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Hyperlink"], StyleMenuListing -> None, 
             ButtonStyleMenuListing -> Automatic, 
             FontVariations -> {"Underline" -> True}, FontColor -> 
             RGBColor[
              0.9230792706187534, 0.3988097962920577, 0.1662928206301976], 
             ButtonBoxOptions -> {
              Active -> True, ButtonFunction :> (FrontEndExecute[{
                  FrontEnd`NotebookLocate[#2]}]& ), ButtonNote -> 
               ButtonData}], 
            Cell[
             StyleData[
             "Hyperlink", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["Hyperlink", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["Hyperlink", "Printout", StyleDefinitions -> None], 
             FontVariations -> {"Underline" -> False}, FontColor -> 
             GrayLevel[0]]}, Closed]], 
         Cell[
         "The following styles are for linking automatically to the locally \
installed on-line help system.", "Text"], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["MainBookLink"], StyleMenuListing -> None, 
             ButtonStyleMenuListing -> Automatic, 
             FontVariations -> {"Underline" -> True}, FontColor -> 
             RGBColor[
              0.9230792706187534, 0.3988097962920577, 0.1662928206301976], 
             ButtonBoxOptions -> {
              Active -> True, Appearance -> {Automatic, None}, 
               ButtonFunction :> (FrontEndExecute[{
                  FrontEnd`HelpBrowserLookup["MainBook", #]}]& )}], 
            Cell[
             StyleData[
             "MainBookLink", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "MainBookLink", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "MainBookLink", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["AddOnsLink"], StyleMenuListing -> None, 
             ButtonStyleMenuListing -> Automatic, 
             FontVariations -> {"Underline" -> True}, FontColor -> 
             RGBColor[
              0.9230792706187534, 0.3988097962920577, 0.1662928206301976], 
             ButtonBoxOptions -> {
              Active -> True, Appearance -> {Automatic, None}, 
               ButtonFunction :> (FrontEndExecute[{
                  FrontEnd`HelpBrowserLookup["AddOns", #]}]& )}], 
            Cell[
             StyleData[
             "AddOnsLink", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["AddOnsLink", "SlideShow", StyleDefinitions -> None]], 
            
            Cell[
             StyleData["AddOnsLink", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["RefGuideLink"], StyleMenuListing -> None, 
             ButtonStyleMenuListing -> Automatic, 
             FontVariations -> {"Underline" -> True}, FontColor -> 
             RGBColor[
              0.9230792706187534, 0.3988097962920577, 0.1662928206301976], 
             ButtonBoxOptions -> {
              Active -> True, Appearance -> {Automatic, None}, 
               ButtonFunction :> (FrontEndExecute[{
                  FrontEnd`HelpBrowserLookup["RefGuide", #]}]& )}], 
            Cell[
             StyleData[
             "RefGuideLink", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "RefGuideLink", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "RefGuideLink", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["GettingStartedLink"], StyleMenuListing -> None, 
             ButtonStyleMenuListing -> Automatic, 
             FontVariations -> {"Underline" -> True}, FontColor -> 
             RGBColor[
              0.9230792706187534, 0.3988097962920577, 0.1662928206301976], 
             ButtonBoxOptions -> {
              Active -> True, Appearance -> {Automatic, None}, 
               ButtonFunction :> (FrontEndExecute[{
                  FrontEnd`HelpBrowserLookup["GettingStarted", #]}]& )}], 
            Cell[
             StyleData[
             "GettingStartedLink", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "GettingStartedLink", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "GettingStartedLink", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["OtherInformationLink"], StyleMenuListing -> None, 
             ButtonStyleMenuListing -> Automatic, 
             FontVariations -> {"Underline" -> True}, FontColor -> 
             RGBColor[
              0.9230792706187534, 0.3988097962920577, 0.1662928206301976], 
             ButtonBoxOptions -> {
              Active -> True, Appearance -> {Automatic, None}, 
               ButtonFunction :> (FrontEndExecute[{
                  FrontEnd`HelpBrowserLookup["OtherInformation", #]}]& )}], 
            Cell[
             StyleData[
             "OtherInformationLink", "Presentation", StyleDefinitions -> 
              None]], 
            Cell[
             StyleData[
             "OtherInformationLink", "SlideShow", StyleDefinitions -> None]], 
            
            Cell[
             StyleData[
             "OtherInformationLink", "Printout", StyleDefinitions -> None]]}, 
           Closed]]}, Closed]], 
      Cell[
       CellGroupData[{
         Cell[
         "FormatType Styles", "Section", CellFrame -> False, CellDingbat -> 
          None, ShowCellBracket -> True, CellMargins -> {{0, 0}, {10, 40}}, 
          CellFrameMargins -> {{20, 4}, {8, 8}}, FontColor -> GrayLevel[1], 
          Background -> RGBColor[0.269902, 0.558434, 0.715618]], 
         Cell[
         "These cells define styles that are mixed in with other cells.  If \
the FormatType of a cell style matches the name of one of the styles defined \
below, then that style is applied along with the local cell style \
definitions. ", "Text", CellMargins -> {{24, 0}, {Inherited, Inherited}}], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["CellExpression"], CellMargins -> {{54, 24}, {2, 4}}, 
             ShowCellLabel -> False, ShowSpecialCharacters -> False, 
             AllowInlineCells -> False, Hyphenation -> False, 
             LineSpacing -> {1, 1}, AutoItalicWords -> {}, StyleMenuListing -> 
             None, FontFamily -> "Courier", FontSize -> 12, Background -> 
             GrayLevel[1]], 
            Cell[
             StyleData[
             "CellExpression", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "CellExpression", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "CellExpression", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["InputForm"], PageWidth -> WindowWidth, 
             InputAutoReplacements -> {}, AllowInlineCells -> False, 
             Hyphenation -> False, AutoSpacing -> False, NumberMarks -> True, 
             AutoNumberFormatting -> False, StyleMenuListing -> None, 
             FontFamily -> "Courier"], 
            Cell[
             StyleData[
             "InputForm", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["InputForm", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData["InputForm", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["OutputForm"], StyleMenuListing -> None, FontFamily -> 
             "Courier"], 
            Cell[
             StyleData[
             "OutputForm", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["OutputForm", "SlideShow", StyleDefinitions -> None]], 
            
            Cell[
             StyleData["OutputForm", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["StandardForm"], 
             InputAutoReplacements -> {
              "->" -> "\[Rule]", ":>" -> "\[RuleDelayed]", "<=" -> 
               "\[LessEqual]", ">=" -> "\[GreaterEqual]", "!=" -> 
               "\[NotEqual]", "==" -> "\[Equal]", $CellContext`ParentList}, 
             "TwoByteSyntaxCharacterAutoReplacement" -> True, 
             SingleLetterItalics -> False, StyleMenuListing -> None, 
             FontFamily -> "Courier"], 
            Cell[
             StyleData[
             "StandardForm", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "StandardForm", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "StandardForm", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["TraditionalForm"], TextClipboardType -> "PlainText", 
             InputAutoReplacements -> {
              "->" -> "\[Rule]", ":>" -> "\[RuleDelayed]", "<=" -> 
               "\[LessEqual]", ">=" -> "\[GreaterEqual]", "!=" -> 
               "\[NotEqual]", "==" -> "\[Equal]", $CellContext`ParentList}, 
             ShowSyntaxStyles -> False, 
             "TwoByteSyntaxCharacterAutoReplacement" -> True, 
             SingleLetterItalics -> True, TraditionalFunctionNotation -> True,
              DelimiterMatching -> None, ZeroWidthTimes -> False, 
             StyleMenuListing -> None], 
            Cell[
             StyleData[
             "TraditionalForm", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "TraditionalForm", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "TraditionalForm", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
         "The style defined below is mixed in to any cell that is in an \
inline cell within another.", "Text", 
          CellMargins -> {{24, 0}, {Inherited, Inherited}}], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["InlineCell"], TextAlignment -> Left, ScriptLevel -> 1,
              StyleMenuListing -> None], 
            Cell[
             StyleData[
             "InlineCell", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData["InlineCell", "SlideShow", StyleDefinitions -> None]], 
            
            Cell[
             StyleData["InlineCell", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["InlineCellEditing"], StyleMenuListing -> None, 
             Background -> RGBColor[1, 0.749996, 0.8]], 
            Cell[
             StyleData[
             "InlineCellEditing", "Presentation", StyleDefinitions -> None]], 
            
            Cell[
             StyleData[
             "InlineCellEditing", "SlideShow", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "InlineCellEditing", "Printout", StyleDefinitions -> None]]}, 
           Closed]]}, Closed]], 
      Cell[
       CellGroupData[{
         Cell[
         "Inline Formatting", "Section", CellFrame -> False, CellDingbat -> 
          None, ShowCellBracket -> True, CellMargins -> {{0, 0}, {10, 40}}, 
          CellFrameMargins -> {{20, 4}, {8, 8}}, FontColor -> GrayLevel[1], 
          Background -> RGBColor[0.269902, 0.558434, 0.715618]], 
         Cell[
          StyleData["RM"], FontWeight -> "Plain", FontSlant -> "Plain"], 
         Cell[
          StyleData["MR"], 
          HyphenationOptions -> {"HyphenationCharacter" -> "\[Continuation]"},
           StyleMenuListing -> None, FontFamily -> "Courier", FontWeight -> 
          "Plain", FontSlant -> "Plain"], 
         Cell[
          StyleData["MO"], 
          HyphenationOptions -> {"HyphenationCharacter" -> "\[Continuation]"},
           StyleMenuListing -> None, FontFamily -> "Courier", FontWeight -> 
          "Plain", FontSlant -> "Oblique"], 
         Cell[
          StyleData["MB"], 
          HyphenationOptions -> {"HyphenationCharacter" -> "\[Continuation]"},
           StyleMenuListing -> None, FontFamily -> "Courier", FontWeight -> 
          "Bold", FontSlant -> "Plain"], 
         Cell[
          StyleData["MBO"], 
          HyphenationOptions -> {"HyphenationCharacter" -> "\[Continuation]"},
           StyleMenuListing -> None, FontFamily -> "Courier", FontWeight -> 
          "Bold", FontSlant -> "Oblique"], 
         Cell[
          StyleData["AboutAuthorR"], FontFamily -> "Times", FontWeight -> 
          "Plain", FontSlant -> "Plain"], 
         Cell[
          StyleData["AboutAuthorI"], FontFamily -> "Times", FontWeight -> 
          "Plain", FontSlant -> "Italic"], 
         Cell[
          StyleData["AboutAuthorB"], FontFamily -> "Times", FontWeight -> 
          "Bold", FontSlant -> "Plain"], 
         Cell[
          StyleData["AboutAuthorBI"], FontFamily -> "Times", FontWeight -> 
          "Bold", FontSlant -> "Italic"], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["MCode"], "TwoByteSyntaxCharacterAutoReplacement" -> 
             True, HyphenationOptions -> {
              "HyphenationCharacter" -> "\[Continuation]"}, LanguageCategory -> 
             "Formula", AutoSpacing -> True, ScriptLevel -> 1, 
             SingleLetterItalics -> False, SpanMaxSize -> 1, StyleMenuListing -> 
             None, FontFamily -> "Courier", 
             ButtonBoxOptions -> {Appearance -> {Automatic, None}}, 
             FractionBoxOptions -> {BaseStyle -> {SpanMaxSize -> Automatic}}, 
             GridBoxOptions -> {
              GridBoxItemSize -> {
                "Columns" -> {{Automatic}}, "ColumnsIndexed" -> {}, 
                 "Rows" -> {{1.}}, "RowsIndexed" -> {}}}], 
            Cell[
             StyleData["MCode", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["Math"], DefaultFormatType -> "DefaultTextFormatType", 
             DefaultInlineFormatType -> "TraditionalForm", LanguageCategory -> 
             "Formula", AutoSpacing -> True, ScriptLevel -> 1, 
             AutoMultiplicationSymbol -> False, SingleLetterItalics -> True, 
             SpanMaxSize -> DirectedInfinity[1], StyleMenuListing -> None, 
             FontFamily -> "Times", 
             ButtonBoxOptions -> {Appearance -> {Automatic, None}}, 
             GridBoxOptions -> {
              BaseStyle -> {FontFamily -> "Times"}, GridBoxDividers -> {}, 
               GridBoxItemSize -> {
                "Columns" -> {{Automatic}}, "ColumnsIndexed" -> {}, 
                 "Rows" -> {{1.}}, "RowsIndexed" -> {}}, 
               GridBoxSpacings -> {}}], 
            Cell[
             StyleData["Math", "Printout", StyleDefinitions -> None]]}, 
           Closed]]}, Closed]], 
      Cell[
       CellGroupData[{
         Cell[
         "Editorial", "Section", CellFrame -> False, CellDingbat -> None, 
          ShowCellBracket -> True, CellMargins -> {{0, 0}, {10, 40}}, 
          CellFrameMargins -> {{20, 4}, {8, 8}}, 
          CellChangeTimes -> {{3.481313643935946*^9, 3.481313646546287*^9}}, 
          FontColor -> GrayLevel[1], Background -> 
          RGBColor[0.269902, 0.558434, 0.715618]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["EditorialComment"], CellFrame -> False, CellDingbat -> 
             "\[FilledCircle]", 
             CellMargins -> {{36, 25}, {Inherited, Inherited}}, 
             LineSpacing -> {1, 1}, MenuSortingValue -> None, FontColor -> 
             RGBColor[
              0.9230792706187534, 0.3988097962920577, 0.1662928206301976], 
             Background -> GrayLevel[1]], 
            Cell[
             StyleData[
             "EditorialComment", "Presentation", StyleDefinitions -> None]], 
            Cell[
             StyleData[
             "EditorialComment", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["TextAnnotation"], CellFrame -> 1, CellFrameColor -> 
             RGBColor[0.8, 0, 0], AutoSpacing -> False, LineIndent -> 
             Automatic, FontSize -> 11, FontWeight -> "Plain", FontColor -> 
             RGBColor[0.4, 0.2, 0.2], Background -> GrayLevel[0.999]], 
            Cell[
             StyleData[
             "TextAnnotation", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["TextAnnotationButton"], Editable -> False, FontFamily -> 
             "Verdana", FontSize -> 9, 
             ButtonBoxOptions -> {
              Active -> True, Appearance -> "DialogBox", 
               ButtonFunction :> (Needs["DocuTools`"]; 
                DocuTools`GenerateAnnotationDialog[]), ButtonMargins -> 1, 
               Evaluator -> Automatic, Method -> "Queued"}], 
            Cell[
             StyleData[
             "TextAnnotationButton", "Printout", StyleDefinitions -> None]]}, 
           Closed]], 
         Cell[
          CellGroupData[{
            Cell[
             StyleData["TextAnnotationRemoveButton"], Editable -> False, 
             FontFamily -> "Verdana", FontSize -> 9, 
             ButtonBoxOptions -> {
              Active -> True, Appearance -> "DialogBox", 
               ButtonFunction :> (Needs["DocuTools`"]; 
                DocuTools`AnnotationRemove[
                 DocuTools`CalledFromFrameLabel -> True]), ButtonMargins -> 1,
                Evaluator -> Automatic, Method -> "Queued"}], 
            Cell[
             StyleData[
             "TextAnnotationRemoveButton", "Printout", StyleDefinitions -> 
              None]]}, Closed]]}, Closed]]}, Open]]}, 
  WindowSize -> {740, 596}, 
  WindowMargins -> {{20, Automatic}, {Automatic, 44}}, FrontEndVersion -> 
  "9.0 for Mac OS X x86 (32-bit, 64-bit Kernel) (January 25, 2013)", 
  StyleDefinitions -> "Default.nb"],
$CellContext`CreateCellID -> True,
PrivateNotebookOptions -> {"NotebookAuthor" -> ""}
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{
 "OnlineHeader"->{
  Cell[1463, 33, 189, 7, 34, "OnlineHeader",
   CellTags->"OnlineHeader"]},
 "visualizefacetsurface"->{
  Cell[88797, 1920, 83, 1, 71, "Section",
   CellTags->"visualizefacetsurface"]},
 "0000545E"->{
  Cell[192647, 4297, 422, 33, 32, "Reference",
   CellTags->"0000545E",
   CellID->1404852268]}
 }
*)
(*CellTagsIndex
CellTagsIndex->{
 {"OnlineHeader", 288521, 6466},
 {"visualizefacetsurface", 288625, 6469},
 {"0000545E", 288722, 6472}
 }
*)
(*NotebookFileOutline
Notebook[{
Cell[1463, 33, 189, 7, 34, "OnlineHeader",
 CellTags->"OnlineHeader"],
Cell[CellGroupData[{
Cell[1677, 44, 25, 0, 64, "Title"],
Cell[1705, 46, 69, 0, 72, "Subtitle"],
Cell[1777, 48, 82, 5, 92, "Author"],
Cell[1862, 55, 753, 14, 240, "Abstract"],
Cell[CellGroupData[{
Cell[2640, 73, 31, 0, 71, "Section"],
Cell[2674, 75, 2934, 46, 639, "Text"],
Cell[5611, 123, 86, 1, 26, "Text",
 CellID->799345357],
Cell[CellGroupData[{
Cell[5722, 128, 139, 2, 26, "Item",
 CellID->2087203114],
Cell[5864, 132, 174, 2, 44, "Item",
 CellID->945852015],
Cell[6041, 136, 183, 3, 44, "Item",
 CellID->987435173],
Cell[6227, 141, 145, 2, 26, "Item",
 CellID->778041850]
}, Open  ]],
Cell[6387, 146, 93, 1, 26, "Text",
 CellID->515607011],
Cell[CellGroupData[{
Cell[6505, 151, 133, 6, 26, "Item",
 CellID->1670847904],
Cell[6641, 159, 221, 6, 44, "Item",
 CellID->1274786515],
Cell[6865, 167, 240, 5, 61, "Item",
 CellID->142640034],
Cell[7108, 174, 122, 3, 26, "Item",
 CellID->884044482]
}, Open  ]],
Cell[7245, 180, 470, 12, 105, "Text",
 CellID->710518232]
}, Open  ]],
Cell[CellGroupData[{
Cell[7752, 197, 51, 0, 71, "Section"],
Cell[7806, 199, 1113, 25, 115, "Text",
 CellID->1336417947],
Cell[8922, 226, 134, 3, 59, "Input",
 CellID->936329127],
Cell[9059, 231, 956, 21, 149, "Text",
 CellID->857793265],
Cell[CellGroupData[{
Cell[10040, 256, 240, 6, 59, "Input",
 CellID->327947408],
Cell[10283, 264, 2317, 46, 510, "Output",
 CellID->1405669908]
}, Open  ]],
Cell[12615, 313, 655, 14, 129, "Text",
 CellID->197286588],
Cell[CellGroupData[{
Cell[13295, 331, 341, 10, 59, "Input",
 CellID->1627614049],
Cell[13639, 343, 5638, 128, 483, "Output",
 CellID->626543109]
}, Open  ]],
Cell[19292, 474, 321, 9, 68, "Text",
 CellID->765747173],
Cell[19616, 485, 333, 10, 59, "Input",
 CellID->1693894068],
Cell[19952, 497, 227, 7, 48, "Text",
 CellID->1004999003],
Cell[CellGroupData[{
Cell[20204, 508, 289, 8, 59, "Input",
 CellID->2088320435],
Cell[20496, 518, 5658, 129, 510, "Output",
 CellID->1197711722]
}, Open  ]],
Cell[26169, 650, 370, 8, 68, "Text",
 CellID->1426468694],
Cell[CellGroupData[{
Cell[26564, 662, 2995, 90, 257, "Input",
 CellID->868174100],
Cell[29562, 754, 59186, 1160, 460, "Output",
 CellID->1576688323]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[88797, 1920, 83, 1, 71, "Section",
 CellTags->"visualizefacetsurface"],
Cell[88883, 1923, 5260, 108, 1028, "Text"]
}, Open  ]],
Cell[CellGroupData[{
Cell[94180, 2036, 36, 0, 71, "Section"],
Cell[94219, 2038, 194, 4, 46, "Text",
 CellID->1511728776],
Cell[94416, 2044, 1053, 30, 295, "Code",
 CellID->1075739759],
Cell[95472, 2076, 236, 6, 28, "Text",
 CellID->1811261754],
Cell[95711, 2084, 37, 1, 26, "Text",
 CellID->1423401863],
Cell[95751, 2087, 217, 6, 68, "Text",
 CellID->480095212],
Cell[CellGroupData[{
Cell[95993, 2097, 469, 15, 77, "Input",
 CellID->691364291],
Cell[96465, 2114, 2832, 55, 544, "Output",
 CellID->647598643]
}, Open  ]],
Cell[99312, 2172, 540, 16, 68, "Text",
 Evaluatable->False,
 CellID->1253523743],
Cell[CellGroupData[{
Cell[99877, 2192, 987, 33, 122, "Input",
 CellID->1158971531],
Cell[100867, 2227, 3297, 65, 495, "Output",
 CellID->743269905]
}, Open  ]],
Cell[104179, 2295, 193, 6, 28, "Text",
 CellID->684085901],
Cell[CellGroupData[{
Cell[104397, 2305, 2007, 67, 221, "Input",
 CellID->561520948],
Cell[106407, 2374, 2316, 46, 510, "Output",
 CellID->224918736],
Cell[108726, 2422, 1638, 35, 461, "Output",
 CellID->637977232]
}, Open  ]],
Cell[110379, 2460, 366, 9, 66, "Text",
 Evaluatable->False,
 CellID->1885448352],
Cell[CellGroupData[{
Cell[110770, 2473, 286, 9, 59, "Input",
 CellID->461756932],
Cell[111059, 2484, 1878, 40, 412, "Output",
 CellID->97488753]
}, Open  ]],
Cell[112952, 2527, 684, 12, 147, "Text",
 CellID->1864247904],
Cell[CellGroupData[{
Cell[113661, 2543, 1413, 43, 185, "Input",
 CellID->223535809],
Cell[115077, 2588, 5650, 129, 502, "Output",
 CellID->2110932657],
Cell[120730, 2719, 2487, 50, 502, "Output",
 CellID->2015317759],
Cell[123220, 2771, 2779, 56, 502, "Output",
 CellID->1333495029]
}, Open  ]],
Cell[126014, 2830, 306, 9, 68, "Text",
 CellID->1960301734],
Cell[CellGroupData[{
Cell[126345, 2843, 433, 13, 59, "Input",
 CellID->897543842],
Cell[126781, 2858, 3717, 76, 631, "Output",
 CellID->911612311]
}, Open  ]],
Cell[130513, 2937, 456, 10, 90, "Text",
 CellID->280680454],
Cell[CellGroupData[{
Cell[130994, 2951, 475, 13, 95, "Input",
 CellID->1645710326],
Cell[131472, 2966, 8197, 166, 496, "Output",
 CellID->96382170]
}, Open  ]],
Cell[139684, 3135, 451, 12, 70, "Text",
 Evaluatable->False,
 CellID->954616986],
Cell[CellGroupData[{
Cell[140160, 3151, 773, 26, 107, "Input",
 CellID->397356965],
Cell[140936, 3179, 25209, 493, 473, "Output",
 CellID->2116491842],
Cell[166148, 3674, 13470, 253, 473, "Output",
 CellID->959259586]
}, Open  ]],
Cell[179633, 3930, 547, 11, 109, "Text",
 CellID->1481603727],
Cell[180183, 3943, 3152, 78, 311, "Input",
 CellID->7687385],
Cell[CellGroupData[{
Cell[183360, 4025, 450, 12, 95, "Input",
 CellID->352860875],
Cell[183813, 4039, 2883, 74, 510, "Output",
 CellID->1177259522]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[186745, 4119, 29, 0, 71, "Section"],
Cell[186777, 4121, 710, 10, 165, "Text"],
Cell[187490, 4133, 514, 12, 105, "Text",
 CellID->1193080299]
}, Open  ]],
Cell[CellGroupData[{
Cell[188041, 4150, 34, 0, 71, "Section"],
Cell[188078, 4152, 148, 3, 46, "Text"]
}, Open  ]],
Cell[CellGroupData[{
Cell[188263, 4160, 49, 1, 71, "Section",
 CellID->496069258],
Cell[188315, 4163, 372, 10, 38, "Reference"],
Cell[188690, 4175, 343, 8, 38, "Reference"],
Cell[189036, 4185, 211, 5, 38, "Reference"],
Cell[189250, 4192, 216, 5, 38, "Reference"],
Cell[189469, 4199, 390, 10, 52, "Reference"],
Cell[189862, 4211, 380, 8, 52, "Reference"],
Cell[190245, 4221, 309, 9, 38, "Reference"]
}, Open  ]],
Cell[CellGroupData[{
Cell[190591, 4235, 47, 0, 66, "SectionAboutAuthor"],
Cell[190641, 4237, 267, 5, 59, "TextAboutAuthor"],
Cell[190911, 4244, 143, 3, 42, "TextAboutAuthor"],
Cell[191057, 4249, 180, 4, 46, "Text",
 CellID->109342928],
Cell[191240, 4255, 250, 5, 66, "Text",
 CellID->732696338],
Cell[191493, 4262, 104, 2, 24, "TextAboutAuthor",
 CellID->1328340278],
Cell[191600, 4266, 95, 1, 24, "TextAboutAuthor",
 CellID->175058134],
Cell[191698, 4269, 469, 12, 111, "TextAboutAuthor",
 CellID->560017850],
Cell[192170, 4283, 474, 12, 111, "TextAboutAuthor",
 CellID->1946663796],
Cell[192647, 4297, 422, 33, 32, "Reference",
 CellTags->"0000545E",
 CellID->1404852268]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 7x01KCGtPJUeRDKH4CPKvMkL *)
