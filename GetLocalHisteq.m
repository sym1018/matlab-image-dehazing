function g = GetLocalHisteq(I)
 
g = adapthisteq(I,'clipLimit',0.02,'Distribution','rayleigh');
