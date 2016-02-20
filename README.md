# docker-tutorial
A environment and series of examples for learn about docker.

# To participate in the tutorial you need
1. a laptop with
  * 1-2GB of free RAM
  * 5GB of free disk space in your home directory
1. To have performed the setup steps below.


# You *MUST* do the following before you arrive to your tutorial session
* Install Virtual Box if you don't already have it

 You can get there here

        https://www.virtualbox.org/wiki/Downloads

* Install docker-machine<br>

 You ONLY need docker-machine, not the completion scripts.
 You find the installation steps for your platform here.

       https://docs.docker.com/machine/install-machine/

* Run the following commands to prepare your laptop

       docker-machine create --driver virtualbox tutorial
       docker-machine ssh tutorial curl --silent -o /tmp/setup_lab.sh -L  https://raw.githubusercontent.com/timdaman/docker-tutorial/master/setup_lab.sh
       docker-machine ssh tutorial /tmp/setup_lab.sh`

The reason why I asking you to do this work ahead of time is because

* I am going to dive straight into using Docker rather than wasting a lot of time showing how to install it. If you are not prepared you will fall behind.
* In a busy class if everyone tried to download the needed files for the example there is a high risk that the network would collapse under the combined demand. These prep steps caches almost all the data you need to follow along.
* This give you a chance to deal with any installation problems before coming to tutorial.
