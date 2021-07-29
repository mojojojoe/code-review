using Distributions
using Plots
using Random
using DataFrames

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

function make_centroids()
#Create the centroid points for reference and then create the data points and generate associated information
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



c = make_centroids() # should be run before make_data_points()
d = make_data_points()

scatter(c.x,d.y)

scatter!(d.x,d.y)

function generate_distances(dp::DataFrame,centr::DataFrame)
    dist=Array{Float64}(undef,DATAPOINTS,NUM_CENTROIDS)
    for p in 1:DATAPOINTS
        for c in 1:NUM_CENTROIDS
            dist[p,c]=euclid_distance(dp[p,:x], dp[p,:y],centr[c,:x],centr[c,:y])
        end
    end
    dist
end         

dists = generate_distances(dp,cents)

function assign_centres_get_distances(dists::Array{Float64,2})
    assigned = DataFrame()
    for i in 1:DATAPOINTS
        minid = argmin(dists[i,:])
        mindist = minimum(dists[i,:])
        tmp = DataFrame(assig_cent=minid,min_dist=mindist)
        append!(assigned, tmp)
    end 
    assigned
end 

##ACHIEVED, ALLOTTED CENTROIDS BASED ON MINIMUM DISTANCE
##TODO, GROUP BY CENTROIDS and CALCULATE A METRIC
## REITERATE AND RECALCULATE METRIC etc. until METRIC stop going down 
##METRIC = SUM OF MIN_DISTS IN GROUP/ NUMBER OF POINTs IN GROUP
acgd = assign_centres_get_distances(dists)

acd_df = DataFrame(acgd)

g_acd_df = groupby(acd_df,:assig_cent)

g_acd_nrow = combine(g_acd_df,nrow)

g_acd_sum = combine(g_acd_df, nrow, :min_dist => sum => :sum, :min_dist => mean => :mean)

