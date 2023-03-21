Create file in /etc/docker/demon.json to have images on your home partition.
{
  "data-root": "/home/gw/.docker-images",
  "storage-driver": "overlay2"
}       
