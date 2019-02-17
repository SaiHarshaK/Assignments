# Matrix Project On Coordinate Geometry - EE1390

Matrix Project for the course: EE1390 - Intro to AI and ML offered by Dr. G.V.V. Sharma at IIT Hyderabad in Spring'19 semester.

## Details

* [PDF](presentation.pdf) - Contains
  * Problem Statement
  * Steps to solve the problem
  * Solution
  * Figures

* [Codes](codes/)
  * [bounds](codes/DrawBounds.py) - plots t1 and t1 ^2 as function of t and proves its minimum is 8
  * [parabola](codes/DrawParabola.py) - draws the parabola and makes a normal to it at various values of t

* [Figures](figures/)
  * [frames](figures/frames) - contains frames of normal for various points chosen on parabola
  * [video](figures/output.mp4) - animated version of the above frames
  * [minimised t1](figures/minimisation.png) - Normal at minimum (t1)^2

* Notes
  * We rendered 240 frames of the Normal and the Parabola at various values of t and stitched them together using `ffmpeg -i %d.png output.mp4`.
  * We similarly rendered the gif using `ffmpeg -i %d.png output.gif`.
  

## Contributors
* Sai Harsha Kottapalli
* Abhishek Agarwal
