
This image contains:

 - R 4.0.3
 - Rstudio server (installation requires the userconf.sh file)


# ######################
     COMPILE THE IMAGE
# ######################

cd /mnt/DOSI/EVLAB/BIOINFO/BIOINFO_PROJECT/NK_Multiple_Myeloma/01_SAMPLES_ONE_BY_ONE/02_Container
docker load -i cosmx_azimuth.tar

# ######################
     RUN THE IMAGE
# ######################

docker run -d --name cosmx_azimuth -p 8880:8787 -v /mnt:/mnt -e USER=$(whoami) -e USERID=$(id -u) -e GROUPID=$(id -g) -e PASSWORD=coucou cosmx_azimuth

