server=http://192.168.0.135:8082/artifactory
repo=libs-snapshot-local

userName=admin
password=Adance123$

# Maven artifact location
name=we-shopify-platform
artifact=com/dsoft/$name/0.0.1-SNAPSHOT
path=$server/$repo/$artifact
echo $path

build=$(curl -u "admin":"Adance123$" $path/maven-metadata.xml | grep '<value>' | head -1 | sed "s/.*<value>\([^<]*\)<\/value>.*/\1/")
echo $build

extension=$(curl -u "admin":"Adance123$" $path/maven-metadata.xml | grep '<extension>' | head -2 | sed "s/.*<extension>\([^<]*\)<\/extension>.*/\2/")
echo $extension

artifact_name=$name-$build.war
echo $artifact_name

url=$path/$artifact_name

# Download
echo $url
wget  --user=$userName --password=$password $url
#mkdir artifact
#chmod 777 artifact
#cp $artifact_name artifact/$name.war
cp $artifact_name $name.war
mv $name.war app-files/
rm $artifact_name
