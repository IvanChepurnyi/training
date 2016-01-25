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

1. Add this urls to bookmarks:

Enable Profiler:
`javascript:(function() {document.cookie='XHPROF_PROFILE=1;expires=Mon, 05 Jul 2200 00:00:00 GMT;path=/;';}())`

Disable Profiler:
`javascript:(function() {document.cookie='XHPROF_PROFILE=0;expires=Mon, 05 Jul 2200 00:00:00 GMT;path=/;';}())`
