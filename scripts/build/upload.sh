set -o xtrace
set -e
export AWS=ubuntu@ip-172-31-37-111.eu-central-1.compute.internal
export GTfolder=/var/www/html/gt/
export build_zip=$(ls GToolkit-64-*.zip)

if [ ! -z "${TAG_NAME}" ]
then
    scp GToolkitWin64*.zip $AWS:$GTfolder
    scp GToolkitOSX64*.zip $AWS:$GTfolder
    scp GToolkitLinux64*.zip $AWS:$GTfolder
    scp releasedateinseconds $AWS:$GTfolder/.releasedateinseconds
else
    echo "TAG_NAME not set"
fi

scp $build_zip $AWS:$GTfolder 
ssh $AWS -t "cd ${GTfolder}; ls -tp | grep -v '/$' | tail -n +40 | xargs -d '\n' -r rm --"
pwd
find ../../ -type d -name workspace -mtime +4 | xargs /bin/rm -rf
set +e