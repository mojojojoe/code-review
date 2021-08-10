### The Julia kernel ###

Julia v1.0.5 is used because of a bug in loading the Distributions package from the repository in v1.6.2

---


### "k-means.jl" - the code

My code consists of eleven functions:
1.`generate_centroid_parms()`,
2.`generate_x_point()`,
3.`generate_y_point()`,
4.`euclid_distance()`,
5.`make_centrs()`,
6.`make_data_points()`,
7.`generate_distaces()`,
8.`reprocess_clusters()`,
9.`generate_new_centrs()`,
10.`get_error()` and
11.`kmeans()`

Functions 1 to 3 and 6 allude to generating the data points. A deeper level of generation is provided because static rand number generation parameters are not given, rather the parameters themselves are random variables of normal and Cauchy distributions.

Function 4 is the basic metric function, measuring the distance in 2-d euclidean space.

Functions 5 and 9 use different algorithms to generate centers according to their stages in the k-means algorithm.

Functions 7 and 8 are utilites to process distance meansures and calculate cluster allocations according to the distances.

Finally function 10 returns the error obtained.

Function 11 is incompleted but incorportes and brings together the first 10 functions.

---

### The docker image ###

The docker container is available on docker hub.
To access the container (assuming you have docker installed and the daemon running)
type,
```sh
docker pull mojojojoe72/code-review:kmeans 
```
And once the container is downloaded (it's about 1G), run it with
```sh
docker run -it mojojojoe72/code-review:kmeans
```

The docker will boot into Julia with the 5 packages used in the code already installed and precompiled.
So that all that is required is to load the code, which is also in the default folder ("/root") of the container.
```Julia 
include("k-means.jl")
```
The 'k-means.jl' code is also included in the github repository under 'sectionC' along with the Dockerfile used to create the image and a few dependent files.

Unfortunately, there was an extra step, which involved me first using my native instance of Julia at localhost to download and compile the packages used in my code. This process generated large binaries which caused the container to swell in size when included. The files, housed in .julia were added to the container I had generated and then committed and then pushed to dockerhub.

This step can be circumvented by adding 
```julia
Pkg"instantiate"
```
placing it before the Pkg"precompile" command in the Dockerfile.

The "k-means.jl' code has a command `scatter()` which tries to plot the datapoints. The connection from a remote machine to localhost is blocked in Ubuntu, hence after a long delay an error will be returned after the `include("k-means.jl")` directive. I have not tested this on a Mac or under Windows, however the plotting feature may just work there.

Other variables will have been loaded and the processing can be performed by typing
```julia
kmeans(5)
```
where the '5' can be any integer and represents the number of iterations that will be performed.

An array of 4 dataframes are returned. Please see the code. This array (for 5 iterations) is also stored in a variable called km. And simply typing `km` at the Julia prompt will return the array of dataframes already alluded to.

Honestly the code is not complete. However, with hope, an accurate reflection of my ability and level is to be seen - and that it is seen in a good light. 

One last thing, Julia v1.0.5 is used. The latest (v1.6.2) was problematic with loading the Distributions package in the container.
