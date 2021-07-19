using Distributions
using Plots

const DATAPOINTS = 100
const NUM_CENTROIDS = 3

struct DataPoint
    x::Float64
    y::Float64
    centroid::Integer
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
    centroid_no = rand(DiscreteUniform(1,3))
    data = Array{DataPoint}(undef,DATAPOINTS,1)
    for i in 1:DATAPOINTS
        data[i] = datum_generator(cpArr)
    end
    data
end

data = create_data_array(centroid_param_array)

data

x_data = Array{Float64}(undef,DATAPOINTS,1)
y_data = Array{Float64}(undef,DATAPOINTS,1)

for i in 1:DATAPOINTS
    x_data[i],y_data[i] = data[i].x, data[i].y
end

scatter(x_data, y_data,)

##############FINISHED###################

function k-means(iterations::int, num-centroids::int)
     = sample(num-centroids, data)

    for datum in data
        for i in 1:len(centroid_arr)
            dist[i] = distance_measure(datum, centroid_arr[i])
        end

##########################################
