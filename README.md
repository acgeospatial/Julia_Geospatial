# Julia_Geospatial
Examples for a blog series on Geospatial Julia using ArchGDAL.
The aim of this series is to have a look at the potential for Julia in Geospatial technology. I am more focused on Raster data, in particular data from Satellites - in these posts I will be using Sentinel 2a data. I will be using the ArchGDAL package for this work. There maybe other packages available, at present (Feb 2019) ArchGDAL offered far more than any other Julia package that I could find. I am more than happy to be corrected though.

<br>
I don't claim any expertise on Julia Lang - I am just learning. If you have any contributions to make this code better I will happily take them. 

## Imagery

Isle_Wight.tif (https://github.com/acgeospatial/Julia_Geospatial/blob/master/Isle_wight.tif) is a sample image to be used in some of these scripts. It is a 10m spatial resolution RGB Sentinel 2a image from 2017 (May i think). I have preprocessed it as performed a 99% clip stretch on the data. This was done in Python using Rasterio, but should be possible in ArchGDAL as well.

![alt tag](http://www.acgeospatial.co.uk/wp-content/uploads/2019/02/0-768x413.png)

## Corresponding blog posts

Blog 1 - http://www.acgeospatial.co.uk/julia-prt1/ <br>
Blog 2 - http://www.acgeospatial.co.uk/julia-prt2/

## Planned - coming soon

Blog 3 - reading / writing / displaying images

