using Distributions
using Plots
using Random
using DataFrames
using DataFramesMeta

const DATAPOINTS = 100
const NUM_CENTROIDS = 3

function generate_centroid_parms()
    c = Array{Float64}(undef,NUM_CENTROIDS,3)
    for i in 1:NUM_CENTROIDS
        c[i,1] = rand(Normal(100,100))
        c[i,2] = rand(Normal(100,100)))
#        c[i,3] = rand(Normal(100,100))
        c[i,3] = rand(Cauchy(3,3))
    end
    c
end

const CENTROID_PARM = generate_centroid_parms()

CENTROID_PARM[2,1]

function generate_x_point(c::Integer)
    p = rand(Normal(CENTROID_PARM[c,1],CENTROID_PARM[c,3]))
    p
end

function generate_y_point(c::Integer)
    rand(Normal(CENTROID_PARM[c,2],CENTROID_PARM[c,3]))
end

function euclid_distance(c_x::Float64,c_y::Float64,x::Float64,y::Float64)
    sqrt((c_x - x)^2 + (c_y - y)^2)
end

function make_centrs()
"""Create the centre points for reference"""
    ref_centroids = DataFrame()
    for ID in 1:NUM_CENTROIDS
        xp = generate_x_point(ID)
        yp = generate_y_point(ID)
        tmp_df = DataFrame(x=xp,y=yp)
        append!(ref_centroids,tmp_df)
    end
    ref_centroids
end


function make_data_points()
"""Create the data points """
    data_points = DataFrame()
    for ID in 1:DATAPOINTS
        lot_draw = rand(DiscreteUniform(1,NUM_CENTROIDS))
        xp = generate_x_point(lot_draw)
        yp = generate_y_point(lot_draw)
        tmp = DataFrame(draw=lot_draw,x=xp,y=yp)
        append!(data_points,tmp)
    end
    data_points
end



centres = make_centrs() # should be run before make_data_points()

X = make_data_points()

scatter(centres.x,centres.y)

scatter!(X.x,X.y)

function generate_distances(X::DataFrame,centrs::DataFrame)
    dist=Array{Float64}(undef,DATAPOINTS,NUM_CENTROIDS)
    for p in 1:DATAPOINTS
        for c in 1:NUM_CENTROIDS
            dist[p,c]=euclid_distance(X[p,:x], X[p,:y],centrs[c,:x],centrs[c,:y])
        end
    end
    dist
end         

dists = generate_distances(d,c)

function assign_clustr(dists::Array{Float64,2})
    assigned = DataFrame()
    for i in 1:DATAPOINTS
        min_id = argmin(dists[i,:])
        tmp = DataFrame(centr=min_id)
        append!(assigned, tmp)
    end 
    assigned
end 

function min_dists(dists::Array{Float64,2})
    assigned = DataFrame()
    for i in 1:DATAPOINTS
        min_dist = minimum(dists[i,:])
        tmp = DataFrame(mindist=min_dist)
        append!(assigned, tmp)
    end 
    assigned
end 

##ACHIEVED, ALLOTTED CENTROIDS BASED ON MINIMUM DISTANCE
##TODO, GROUP BY CENTROIDS and CALCULATE A METRIC
## REITERATE AND RECALCULATE METRIC etc. until METRIC stop going down 
##METRIC = SUM OF MIN_DISTS IN GROUP/ NUMBER OF POINTs IN GROUP

new_centr = assign_centres(dists)

old_centr = deepcopy(new_centr)


while (error != 0)
    dists = generate_distance(d,c)
    new_centr = assign_clustr(dists)
    old_centr = deepcopy(new_centr)

    generate_new_centres(X,clustr)
end

for CENTR in 1:NUM_CENTROIDS
    @subset(cent_n_min_dist,:assig_cent .== CENTR) 
end    
    

cent_n_min_dist[!.==1,:assig_cent]






















