using Distributions
using Plots
using Random
using DataFrames
using Chain

const DATAPOINTS = 100
const NUM_CENTROIDS = 3

function generate_centroid_parms()
    c = Array{Float64}(undef,NUM_CENTROIDS,3)
    for i in 1:NUM_CENTROIDS
        c[i,1] = rand(Normal(100,100))
        c[i,2] = rand(Normal(100,100))
        c[i,3] = abs(rand(Cauchy(3,3)))
    end
    c
end

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
    df = DataFrame()
    for ID in 1:NUM_CENTROIDS
        xp = generate_x_point(ID)
        yp = generate_y_point(ID)
        tmp = DataFrame(c= ID,x = xp, y = yp)
        append!(df,tmp)
    end
    df
end


function make_data_points()
"""Create the data points """
    df = DataFrame()
    for ID in 1:DATAPOINTS
        lot_draw = rand(DiscreteUniform(1,NUM_CENTROIDS))
        xp = generate_x_point(lot_draw)
        yp = generate_y_point(lot_draw)
        tmp = DataFrame(x = xp, y = yp)
        append!(df,tmp)
    end
    df
end

function generate_distances(X::DataFrame,centrs::DataFrame)
    arr = Array{Float64}(undef,DATAPOINTS,NUM_CENTROIDS)
    for dp in 1:DATAPOINTS
        for c in 1:NUM_CENTROIDS
            x1,x2 = X[dp,:x],X[dp,:y]
            c1,c2 = centrs[c,:x],centrs[c,:y]
            arr[dp,c] = euclid_distance(x1,x2,c1,c2) 
        end
    end
    arr
end         

function update_clustr(dists::Array{Float64})
    assigned = DataFrame()
    for i in 1:DATAPOINTS
        min_id = argmin(dists[i,:])
        tmp = DataFrame(clustr = min_id)
        append!(assigned,tmp)
    end 
    assigned
end 

function generate_new_centrs(X::DataFrame,clustrs::DataFrame)
    centers = DataFrame(x = X[!,:x], y = X[!,:y], c = clustrs[:,1])
    r = @chain centers begin
        groupby(:c)
        combine(:x .=> mean => :x, :y .=> mean => :y)
    end
    r
end 

function get_error(new_centrs::DataFrame,old_centrs::DataFrame)
    sum = 0.0
    for i in 1:NUM_CENTROIDS
        sum += euclid_distance(new_centrs[i,:x],new_centrs[i,:y],old_centrs[i,:x],old_centrs[i,:y])
    end
    sum
end

function kmeans()
    centrs = make_centrs() # should be run before make_data_points()
    new_centrs= deepcopy(centrs)
    X = make_data_points() 
    dists = generate_distances(X,centrs)
    clustrs = update_clustr(dists)
    err = 1.0
    while (err != 0) begin
        dists = generate_distances(X,new_centrs)
        clustrs = update_clustr(dists)
        old_centrs = deepcopy(new_centrs)
        new_centrs = generate_new_centrs(X,clustrs)
        err = get_error(new_centrs,old_centrs)
        end
    end
    [centrs,new_centrs,X] 
end 

CENTROID_PARM = generate_centroid_parms()
km = kmeans()

scatter(km[1][!,:x],km[1][!,:y])

scatter!(km[2][!,:x],km[2][!,:y])

scatter!(km[3][!,:x],km[3][!,:y])


