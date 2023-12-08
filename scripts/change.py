
# read all the files in the directory and print it file name
import os
import re

x = os.listdir()

"""Sample of a file
List of parameters
------------------------------------------
device_type:1
device_id:4
device_longitude:-74.09141063690186
device_latitude:4.663858856666937
device_elevation:0.0
device_radius:0.0
device_hide:0
device_draw_battery:false
device_sensor_unit_radius:20.0
device_script_file_name:StationD213.csc
"""

# keep the file exactly the same, but change the device_script_file_name to "Station{id}.csc"
for file in x:
    if file == 'change.py':
        continue
    n = file.split('_')[1]
    with open(file, 'r') as f:
        text = f.read()
        text = re.sub(r'device_script_file_name:.*', f'device_script_file_name:Station{n}.csc', text)
        with open(file, 'w') as f:
            f.write(text)
