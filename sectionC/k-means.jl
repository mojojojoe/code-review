using Distributions
using Plots

const DATAPOINTS = 100
const NUM_CENTROIDS = 3

struct DataPoint
    x::Float64
    y::Float64
    centroid::Int64
end

struct CentroidParm
    x::Float64
    mu::Float64
end


centroid_param_array = Array{CentroidParm}(undef,NUM_CENTROIDS,1)
centroid_param_array[1] = CentroidParm(1,1)
centroid_param_array[2] = CentroidParm(4,1)
centroid_param_array[3] = CentroidParm(10,2)



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

scatter(centroids[1,:],centroids[2,:])
scatter!(dp_matrix[:,1],dp_matrix[:,2])

##
function euclid_distances(s::Array{Float64,2},m::Array{Float64,2})
    dist = Array{Float64}(undef,DATAPOINTS,3)
    for p in 1:DATAPOINTS
        for c in 1:NUM_CENTROIDS
            dist[p,c] = sqrt((s[c,1] - m[p,1])^2 + (s[c,2] - m[p,2])^2)
        end
    end
    dist
end

distances = euclid_distances(centroids,dp_matrix)

distances


## Write a function that takes the distances matrix (100x3) and returns the index (1-3) of each datapoint which has min distance

function min_distances(dist::Array{Float64,2})
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
