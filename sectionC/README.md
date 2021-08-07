___The docker image___

The docker container is available on docker hub.
To access the container (assuming you have docker installed and the daemon running)
type,
``` 
docker pull mojojojoe72/code-review:kmeans 
```

And once the container is downloaded (it's about 1G), run it with
``` 
docker run -it mojojojoe72/code-review:kmeans
```

The docker will boot into Julia with the 5 packages used in the code already installed and precompiled.
So that all that is required is to load the code, which is also in the default folder ("/root") of the container.
``` 
include("k-means.jl")
```
The 'k-means.jl' code is also included in the github repository under 'sectionC' along with the Dockerfile used to create the image and a few dependent files.

Unfortunately, there was an extra step, which involved me first using my native instance of Julia at localhost to download and compile the packages used in my code. This process generated large binaries which caused the container to swell in size when included. The files, housed in .julia were added to the container I had generated and then committed and then pushed to dockerhub.

This step can be circumvented by adding 
```
Pkg"instantiate"
```
placing it before the Pkg"precompile" command in the Dockerfile.

The "k-means.jl' code has a command ('scatter()') which tries to plot the datapoints. The connection from a remote machine to localhost is blocked in Ubuntu, hence after a long delay an error will be returned after the include("k-means.jl") directive. I have not tested this on a Mac or under Windows, however the plotting feature may just work there.

Other variables will have been loaded and the processing can be performed by typing
```
kmeans(5)
```
where the '5' can be any integer and represents the number of iterations that will be performed.

An array of 4 dataframes are returned. Please see the code. This array (for 5 iterations) is also stored in a variable called km. And simply typing 'km' at the Julia prompt will return the array of dataframes already alluded to.

Honestly the code is not complete. However, with hope, an accurate reflection of my ability and level is to be seen - and that it is seen in a good light. 

One last thing, Julia v1.0.5 is used. The latest (v1.6.2) was problematic with loading the Distributions package in the container.
