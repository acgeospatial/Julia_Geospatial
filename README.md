# Julia_Geospatial
Examples for a blog series on Geospatial Julia using ArchGDAL.
The aim of this series is to have a look at the potential for Julia in Geospatial technology. I am more focused on Raster data, in particular data from Satellites - in these posts I will be using Sentinel 2a data. I will be using the ArchGDAL package for this work. There maybe other packages available, at present (Feb 2019) ArchGDAL offered far more than any other Julia package that I could find. I am more than happy to be corrected though.

<br>
I don't claim any expertise on Julia Lang - I am just learning. If you have any contributions to make this code better I will happily take them. 

## An important note - UPDATE

<b> Dec 2021 I have updated all the code for Julia 1.7.0. Plus added a new notebook and blog. Enjoy!</b>

brief blog post here - http://www.acgeospatial.co.uk/julia-prt4/ <br>

## Imagery

Isle_Wight.tif (https://github.com/acgeospatial/Julia_Geospatial/blob/master/Isle_wight.tif) is a sample image to be used in some of these scripts. It is a 10m spatial resolution RGB Sentinel 2a image from 2017 (from May I think). I have preprocessed it. I have performed a 99% clip stretch on the data for better display. This was done in Python using Rasterio, but should be possible in ArchGDAL as well, perhaps using https://juliastats.github.io/StatsBase.jl

![alt tag](http://www.acgeospatial.co.uk/wp-content/uploads/2019/02/0-768x413.png)

## Corresponding blog posts

Blog 1 (Feb 2019) - http://www.acgeospatial.co.uk/julia-prt1/ <br>
Blog 2 (Feb 2019) - http://www.acgeospatial.co.uk/julia-prt2/ <br>
Blog 3 (Feb 2019) - http://www.acgeospatial.co.uk/julia-prt3/ <br>
Blog 4 (Dec 2021) - http://www.acgeospatial.co.uk/julia-prt4/ <br>

## Notebooks of interest
Raster data and ArchGDAL here
https://github.com/acgeospatial/Julia_Geospatial/blob/master/02_Notebooks/04_reading_displaying_writing_rasters_Julia.ipynb


Vector data and ArchGDAL here
https://github.com/acgeospatial/Julia_Geospatial/blob/master/02_Notebooks/05_testing_shapefile.ipynb


Sentinel 2 and GeoArrays here
https://github.com/acgeospatial/Julia_Geospatial/blob/master/02_Notebooks/06_working_with_Sentinel2.ipynb

## Planned - nothing at present - email me info.acgeospatial@gmail.co.uk



