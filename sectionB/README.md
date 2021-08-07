___Corporate takeovers in Africa___

The analysis is made of data pertaining to corporate takeovers in Africa between 2016 to middle 2021.
The data is qualitative, giving the names of companines involved, their sectors and national origins.
With this information counts per grouping could be made and graph relationships could be drawn.

The Rgraphviz packaged was used to generate the graphviz graphs. Rgraphviz is a bit tricky to load in R version 3.6.3.
The offical maintainer of Rgraphviz recommends R version 4.1. The jupyter kernel can be found at this website: [https://irkernel.github.io/]
But perhaps a more convenient way to get the kernel is to download this container with the command:

```
docker pull jupyter/r-notebook:r-4.1.0
```

and then to run it with:
```
docker run -it jupyter/r-notebook:r-4.1.0
```
However, there are some networking issues, which at the time of writing I still haven't resolved sufficiently to give accurate instructions on how to make this work.


Tidyverse is also made use of, especially for chaining and data preparation.


