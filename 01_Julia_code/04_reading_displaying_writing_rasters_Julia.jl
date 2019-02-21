
using GDAL
GDAL.allregister()
dataset = GDAL.open("Isle_wight.tif", GDAL.GA_ReadOnly)
print(dataset)

band = GDAL.getrasterband(dataset, 1)
print(band)

using ImageView, Images
img = load("Isle_wight.tif")

img[350,225] ## column and row

img[1000,1] 

sizeof(img)

typeof(img)

size(img) ## this is the equivalent of array.shape() in Python

using ArchGDAL
# http://yeesian.com/ArchGDAL.jl/latest/rasters.html
ArchGDAL.registerdrivers() do
ArchGDAL.read("Isle_wight.tif") do dataset
    typeof(dataset)
    end
end

using Colors
ArchGDAL.registerdrivers() do
ArchGDAL.read("Isle_wight.tif") do dataset
    band = ArchGDAL.getband(dataset,1)
    band_array = ArchGDAL.read(band) # read into array
    println(typeof(band_array))
    ## we need to convert to a float scaled between 0 - 1 to display (input in UInt8)    
    band_array_float = band_array / 255
    println(typeof(band_array_float))
    imgg = Gray.(band_array_float)
    end
end

using Colors
ArchGDAL.registerdrivers() do
ArchGDAL.read("Isle_wight.tif") do dataset
    band = ArchGDAL.getband(dataset,1)
    new = ArchGDAL.read(band) # read into array
    band = ArchGDAL.getband(dataset,1)
    band_array = ArchGDAL.read(band) # read into array

    ## transpose    
    band_array_adjust = permutedims(band_array, (2,1))
        
    ## we need to convert to a float scaled between 0 - 1 to display (input in UInt8)    
    band_array_float = band_array_adjust / 255
    println(typeof(band_array_float))
    imgg = Gray.(band_array_float)
        
    end
end

using Colors
ArchGDAL.registerdrivers() do
ArchGDAL.read("Isle_wight.tif") do dataset
    band1 = ArchGDAL.getband(dataset,1)
    band2 = ArchGDAL.getband(dataset,2)
    band3 = ArchGDAL.getband(dataset,3)
    b1 = ArchGDAL.read(band1)/255 # read into array
    b2 = ArchGDAL.read(band2)/255
    b3 = ArchGDAL.read(band3)/255
    b1_n = permutedims(b1, (2,1))
    b2_n = permutedims(b2, (2,1))
    b3_n = permutedims(b3, (2,1))
    total = cat(dims=3, b1_n, b2_n, b3_n)
    typeof(total)
    imgc2 = colorview(RGB, permuteddimsview(total, (3,1,2)))

    end
end

## learning about for loops
x = 1,2,3
println(length(x))


for i = 1:length(x)
  println(x[i])
end

using Colors
ArchGDAL.registerdrivers() do    
ArchGDAL.read("isle_wight.tif") do dataset
    #println(dataset)
    number_rasters = (ArchGDAL.nraster(dataset))
    width = ArchGDAL.width(dataset)
    height = ArchGDAL.height(dataset)
    println(width)
    println(height)
    m = Array{Float64}(undef, height, width, number_rasters)

    
    for i = 1:number_rasters
      band = ArchGDAL.getband(dataset,i)
        b = ArchGDAL.read(band)/255 
        b_n = permutedims(b, (2,1)) 
        m[:, :, i] = b_n
    end
    typeof(m)
    imgc2 = colorview(RGB, permuteddimsview(m, (3,1,2)))

    end
end

using ArchGDAL; const AG = ArchGDAL ## make AG the shortcut to ArchGDAL, by doing this I call AG. rather than ArchGDAL.
AG.registerdrivers() do
    AG.read("Isle_wight.tif") do dataset
    band1 = ArchGDAL.getband(dataset,1) ## read in 1 band
    ref = AG.getproj(dataset) ## get the project
    new1 = ArchGDAL.read(band1) ## get the data into an array
    geotransform = AG.getgeotransform(dataset) ## get the geotransformation propoerties
    println(geotransform)
    println("projection:")
    println(ref)
        
    raster = AG.unsafe_create(
        "band1.tif",
        AG.getdriver("GTiff"),
        width = ArchGDAL.width(dataset),
        height = ArchGDAL.height(dataset),
        nbands = 1,
        dtype = UInt8
    )
    ## assign the projection and transformation parameters
    AG.setgeotransform!(raster, geotransform)
    AG.setproj!(raster, ref)
    
    ## write the raster    
    AG.write!(
        raster,
        new1,  # image to "burn" into the raster
        1,      # update band 1
    )
    AG.destroy(raster)
    end
end

using ArchGDAL; const AG = ArchGDAL
using Colors
AG.registerdrivers() do
AG.read("band1.tif") do dataset
    band = AG.getband(dataset,1)
    new = AG.read(band) # read into array
    band = AG.getband(dataset,1)
    band_array = AG.read(band) # read into array

    ## transpose    
    band_array_adjust = permutedims(band_array, (2,1))
        
    ## we need to convert to a float scaled between 0 - 1 to display (input in UInt8)    
    band_array_float = band_array_adjust / 255

    imgg = Gray.(band_array_float)
        
    end
end
