
# coding: utf-8

# In[1]:


from osgeo import gdal


# In[2]:


get_ipython().run_cell_magic('timeit', '', '## GDAL approach\n\nraster_ds = gdal.Open("Isle_wight.tif", gdal.GA_ReadOnly)\nimage_gdal = raster_ds.GetRasterBand(1).ReadAsArray()\n#print (image_gdal.shape)')


# In[3]:


import rasterio


# In[4]:


get_ipython().run_cell_magic('timeit', '', 'with rasterio.open("Isle_wight.tif") as r:\n    arr = r.read(1)  # read raster\n    #print(arr.shape)')

