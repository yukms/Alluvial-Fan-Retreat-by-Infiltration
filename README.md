# Alluvial-Fan-Retreat-by-Infiltration

This code is for alluvial fan modeling which shows auto-retreat by infiltration.

We assume  simple triangluar shape fan geometry, onstant sediment flux, water flux,and surface slope.

Before retreat, alluvial fan progradation is calculated by mass balance equation ( sediment input is equal to deposition)
during the progradation, we calculate the qw_inf (infiltration water flux) which is vertically downward.
qw_inf[mm^2/sec] is equated as the alluvial fan area[mm^2] times infiltration coefficient [1/sec].
Retreat starts when qw_inf overcomes the qw as fan grows.


When retreat started,

fan margin location is calculated using the quadratic fomula.
based on the relation of 'new deposit thickness * fan margin location = qs * time'
let fan margin location as 'x', then we can yield the infiltration water flux with that margin location.
Then we can get the 'x' where the infiltration water flux equals to water flux, using the quadratic fomula.

