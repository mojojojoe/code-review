#TODO create single array to hold all calculations
#TODO classify all methods
#TODO finish algorithm




using Distributions
using Plots
using Random
using DataFrames

const DATAPOINTS = 100
const NUM_CENTROIDS = 3

function generate_centroid_parms()
    c = Array{Float64}(undef,NUM_CENTROIDS,4)
    for i in 1:NUM_CENTROIDS
        c[i,1] = rand(Normal(100,100))
        c[i,2] = abs(rand(Normal(100,100)))
        c[i,3] = rand(Normal(100,100))
        c[i,4] = abs(rand(Normal(100,100)))
    end
    c
end

const CENTROID_PARM = generate_centroid_parms()

CENTROID_PARM[2,1]

function generate_x_point(c::Integer)
    p = rand(Normal(CENTROID_PARM[c,1],CENTROID_PARM[c,2]))
    p
end

function generate_y_point(c::Integer)
    rand(Normal(CENTROID_PARM[c,3],CENTROID_PARM[c,4]))
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
        x = generate_x_point(lot_draw)
        y = generate_y_point(lot_draw)
        tmp = DataFrame(draw=lot_draw,x=x,y=y)
        append!(data_points,tmp)
    end
    data_points
end



c = make_centroids()

scatter!(c.x,c.y)

function generate_distances(dp::DataFrame,centr::DataFrame)
    dist=Array{Float64}(undef,DATAPOINTS,NUM_CENTROIDS)
    for p in 1:DATAPOINTS
        for c in 1:NUM_CENTROIDS
            dist[p,c]=euclid_distance(dp[p,:x], dp[p,:y],centr[c,:x],centr[c,:y])
        end
    end
    dist
end         

dp = make_data_points()

cents = make_centroids()

dists = generate_distances(dp,cents)

dists

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

assign_centres_get_distances(dists)

##ACHIEVED, ALLOTTED CENTROIDS BASED ON MINIMUM DISTANCE
##TODO, GROUP BY CENTROIDS and CALCULATE A METRIC
## REITERATE AND RECALCULATE METRIC etc. until METRIC stop going down 
##METRIC = SUM OF MIN_DISTS IN GROUP/ NUMBER OF POINTs IN GROUP

#        dist = euclid_distance(x,y, centrs[1],centrs[2])

# lot_draw = rand(DiscreteUniform(1,NUM_CENTROIDS)) # a number 1 to 3
    # centrs = ref_centroids[lot_draw,:] #a pair referring to the centre drawn


# lot = findmin(ref_dists)
# lot_dist = minimum(ref_dists)
    # df = DataFrame(centroid=ref_lot, x=x, y=y, lot=lot,lot_dist=lot_dist)
    # for i in 1:DATAPOINTS-1
    #     ref_lot = rand(DiscreteUniform(1,NUM_CENTROIDS))
    #     centr_x = centroid_x[ref_lot]
    #     centr_y = centroid_y[ref_lot]
    #     x = generate_x_point(ref_lot)
    #     y = generate_y_point(ref_lot)
    #     print(ref_dists)
    #     for ID in NUM_CENTROIDS ref_dists[ID] = euclid_distance(centroid_x[ID],centroid_y[ID],x,y) end
    #     lot = findmin(ref_dists)
    #     lot_dist = minimum(ref_dists)
    #     dfl = DataFrame(centroid=ref_lot, x=x, y=y, lot=lot,lot_dist=lot_dist)
    #     append!(df,dfl)
    # end
    # df


 = populate_df()

worker

scatter(dp.x,dp.y)

scatter(worker.x,worker.y)

euclid_dist(centr_x,centr_y,x,y)

for i in 1:DATAPOINTS
    df[i,"c"] = choose_a_centroid()
    df[i,"x"] = choose_an_x_point(:c)
    df[i,"y"] = choose_an_y_point(df[i,:c])
end

df

df[99,:]

scatter(centroids[1,:],centroids[2,:])
scatter!(dp_matrix[:,1],dp_matrix[:,2])

##

distances


## Write a function that takes the distances matrix (100x3) and returns the index (1-3) of each datapoint which has min distance

function min_distances(dist::Array{Float64,2})
"""Takes distance array of dimension DATAPOINTS x NUM_CENTROIDS
"""
    m = Array{Real}(undef,DATAPOINTS,3)
    for p in 1:DATAPOINTS
        m[p,1] = p
        m[p,2] = argmin(dist[p,:])
        m[p,3] = minimum(dist[p,:])
    end
    m
end

groups = min_distances(distances)

groups

function update_centroids(g::Array{Real},dp::Array{Float64,2})
    c = Array{Float64}(undef,NUM_CENTROIDS,3)
    for p in 1:DATAPOINTS
        if g[p,3] == 0.0
            c[g[p,2],1] = dp[g[p,1],1]
            c[g[p,2],2] = dp[g[p,1],2]
            c[g[p,2],3] = g[p,1]
        end
    end
    c
end




centroids = update_centroids(groups,dp_matrix)

distances = euclid_distances(centroids,dp_matrix)
groups = min_distances(distances)


scatter!(centroids[1,:],centroids[2,:])

function cluster(min_idxs::Array{Real,2})
    clusters = Array{Float64}(undef,NUM_CENTROIDS,3)
    for c in 1:NUM_CENTROIDS
        count = 0
        S = 0
        for p in 1:DATAPOINTS
            if min_idxs[p,1] == c
                begin
                    count = count + 1
                    S = S + min_idxs[p,2]
                end
            end
           end
        clusters[c,1],clusters[c,2],clusters[c,3] = S,count,S/count
        print("\ncluster:",c," S:",S," count:",count," S/count:",S/count)
    end
    clusters
end

cluster(groups)


function datum_generator(cpArr::Array{CentroidParm})
    c = rand(DiscreteUniform(1,3))
    datum = DataPoint(rand(Normal(cpArr[c].x,cpArr[c].mu)),rand(Normal(cpArr[c].x,cpArr[c].mu)), c)
    datum
end

function create_data_array(cpArr::Array{CentroidParm})
    data = Array{DataPoint}(undef,DATAPOINTS,1)
    for i in 1:DATAPOINTS
        data[i] = datum_generator(cpArr)
    end
    data
end

data = create_data_array(centroid_param_array)
dp_matrix = Matrix{Float64}(any,DATAPOINTS) = []
centroid_samples = Array{Float64,1}(undef,3)


function extract_data_matrix(dat::Array{DataPoint})
    mat = Array{Float64}(undef,DATAPOINTS,2)
    for i in 1:length(data)
        mat[i,1],mat[i,2] = dat[i].x, dat[i].y
    end
    mat
end

dp_matrix = extract_data_matrix(data)

scatter(dp_matrix[:,1],dp_matrix[:,2])


function sample_centroids(m::Array{Float64,2})
    s = Array{Float64}(undef,NUM_CENTROIDS,3)
    for c in 1:NUM_CENTROIDS
        i = rand(DiscreteUniform(1,DATAPOINTS))
        s[c,1],s[c,2],s[c,3] = m[i,1],m[i,2],i
    end
    s
end


dp_matrix

centroids = sample_centroids(dp_matrix)



centroid_param_array = Array{CentroidParm}(undef,NUM_CENTROIDS,1)
centroid_param_array[1] = CentroidParm(1,1)
centroid_param_array[2] = CentroidParm(4,1)
centroid_param_array[3] = CentroidParm(10,2)
