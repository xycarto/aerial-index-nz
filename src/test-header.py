from osgeo import gdal
import os
import s3fs
import json
import geopandas as gp
from shapely.geometry import box

s3 = s3fs.S3FileSystem(anon=True)
# top = s3.ls('nz-imagery')
CRS = 4326

with s3.open('nz-imagery/wellington/upper-hutt_2017_0.1m/rgb/2193/BQ32_500_007060.json', 'rb') as f:
    jdata = json.load(f)

poly = box(*jdata['bbox'])

gp_extent = gp.GeoDataFrame(index=[0], crs=CRS, geometry=[poly])

gp_extent.to_file('data/test.gpkg', driver='GPKG')



