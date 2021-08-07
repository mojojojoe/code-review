___The docker image___

The docker container is available on docker hub.
To access the container (assuming you have docker installed)...
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

Unfortunately, there was an extra step, which involved me first using my native instance of Julia at localhost to download and compile these packages. This process generated large binaries which caused the container to swell in size when included. The files, housed in .julia were added to the container I had generated and then committed and pushed to dockerhub.

The "k-means.jl' tries to plot the datapoints. The connection from a remote machine to localhost is blocked in Ubuntu, hence after a long delay an error will be returned after the include("k-means.jl") directive. However the other variables will have been loaded and and processing can be performed by typing
```
kmeans(5)
```
The '5' can be any integer and represents the number of iterations that can be performed.

An array of 4 dataframes are returned. Please see the code.

Honestly the code is not complete. But I feel like I have given enough time to this project. Hopefully an accurate reflection of my ability and level is to be seen. 

One last thing, julia v1.0.5 is used. The latest (v1.6.2) is problematic with loading the Distributions package.
