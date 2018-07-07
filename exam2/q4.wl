poly[z_] := 6 + 6 z + 3 z^2 + z^3;
norm[x_, y_] := Norm[poly[x + y I]];
RegionPlot[norm[x,y] < 6, {x, -4, 2}, {y, -3, 3}]
