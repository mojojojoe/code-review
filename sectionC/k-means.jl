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
    centroid_no = rand(DiscreteUniform(1,3))
    data = Array{DataPoint}(undef,DATAPOINTS,1)
    for i in 1:DATAPOINTS
        data[i] = datum_generator(cpArr)
    end
    data
end

data = create_data_array(centroid_param_array)
matrix = Matrix{Float64}(any,DATAPOINTS) = []
centroids = Array{Float64,1}(undef,3)


function extract_data_matrix(dat::Array{DataPoint})
    mat = Array{Float64}(undef,DATAPOINTS,2)
    for i in 1:length(data)
        mat[i,1],mat[i,2] = dat[i].x, dat[i].y
    end
    mat
end

matrix = extract_data_matrix(data)
#
# x_data = Array{Float64}(undef,DATAPOINTS,1)
# y_data = Array{Float64}(undef,DATAPOINTS,1)
#
# for i in 1:DATAPOINTS
#     x_data[i],y_data[i] = data[i].x, data[i].y
# end

scatter(matrix[:,1],matrix[:,2])
sample!(matrix,centroids)
##############FINISHED###################
##Works...
function euclid_distance(centroid::Float64,x::Float64,y::Float64)
    sqrt((centroid[1] - x)^2 + (centroid[2] - y)^2)
end



euclid_distance(solution,matrix)

##Doesnt work
# function get_distances(centroid_sample::Array{Float64,2}, mat::Array{Float64,2})
#     dist_betw_centroid_n_datapoint = Array{Float64}(undef,DATAPOINTS,NUM_CENTROIDS)
#     for i in 1:DATAPOINTS
#         for j in 1:NUM_CENTROIDS
#             distances_betw_centroid_datapoints[i,j] = euclid_distance(centroid_sample[j,:], mat[i,1], mat[i,1])
#         end
#     end
#     distance_betw_centroid_datapoints
# end
#
# function k_means(d::Array{DataPoint})
#     centroids = Array{Float64,2}(undef,3)
#     m = extract_data_matrix(data)
#     s = sample!(m,centroids)
#
#
#     distance_array = get_distances(s,m)
#     distance_array
# end
#
#
# solution = k_means(data)
# ##########################################
# solution
