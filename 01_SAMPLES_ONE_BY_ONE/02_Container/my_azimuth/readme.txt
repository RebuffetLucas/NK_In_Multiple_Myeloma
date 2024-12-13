
This image contains:

 - R 4.0.3
 - Rstudio server (installation requires the userconf.sh file)


# ######################
     COMPILE THE IMAGE
# ######################

docker build -t my_azimuth /mnt/DOSI/PLATEFORMES/BIOINFORMATIQUE/03_WORKSPACE/rebuffet/NK_Multiple_Myeloma/01_SAMPLES_ONE_BY_ONE/02_Container/my_azimuth

# ######################
     RUN THE IMAGE
# ######################

docker run -d --name my_azimuth -p 8879:8787 -v /mnt:/mnt -e USER=$(whoami) -e USERID=$(id -u) -e GROUPID=$(id -g) -e PASSWORD=coucou my_azimuth

