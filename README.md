# Installation of Magento for performance training

1. Create a database
    `mysql -e 'create database training'`
    
2. Copy a mysql user password
    `cat ~/.my.cnf # retrieve mysql password`
    
3. Install Magento with copied mysql password (replace **[password]** with one from previous command)
    ```bash 
    magerun install --dbPass="[password]" --installSampleData=yes --magentoVersionByName="magento-mirror-1.9.2.2" --baseUrl="http://training.box/" --dbUser=app --dbHost="localhost" --dbName="training" --installationFolder="public"
    ```

# Enabling & Disabling profiling

1. Add this url to bookmark:

[Enable Profiler](javascript:%28function%28%29+%7Bdocument.cookie%3D%27XHPROF_PROFILE%3D1%3Bexpires%3DMon%2C+05+Jul+2000+00%3A00%3A00+GMT%3Bpath%3D%2F%3B%27%3B%7D%29%28%29)
[Disable Profiler](javascript:%28function%28%29+%7Bdocument.cookie%3D%27XHPROF_PROFILE%3D0%3Bexpires%3DMon%2C+05+Jul+2000+00%3A00%3A00+GMT%3Bpath%3D%2F%3B%27%3B%7D%29%28%29)

