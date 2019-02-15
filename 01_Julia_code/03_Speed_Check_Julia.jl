
using ArchGDAL; const AG = ArchGDAL

function gdal_time()
AG.registerdrivers() do
    AG.read("Isle_wight.tif") do dataset
    band1 = AG.getband(dataset,1)
    array = AG.read(band1)
    #size(array)
    end
end
end

using BenchmarkTools

@btime gdal_time()
