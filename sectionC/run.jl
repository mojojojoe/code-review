#!/usr/bin/env julia

include("k-means.jl")

DATAPOINTS = 1000

NUM_CENTROIDS = 6

CENTROID_PARM = generate_centroid_parms()

km = kmeans(5)

scatter(km[1][!,:x],km[1][!,:y])

scatter!(km[2][!,:x],km[2][!,:y])

scatter!(km[3][!,:x],km[3][!,:y])

