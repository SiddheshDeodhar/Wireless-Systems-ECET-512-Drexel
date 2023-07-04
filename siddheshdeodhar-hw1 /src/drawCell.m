function drawCell( center, radius, cellName )


 
 plot( center  + radius * exp(j*pi*(0:2:12)/6), 'k');
text( real(center), imag(center), cellName );