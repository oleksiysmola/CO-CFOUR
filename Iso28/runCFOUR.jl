point::Int64 = 2
# jobSplit::Int64 = 9
# numberOfJobs::Int64 = 1000

R::Vector{Float64}=[0.9, 0.9310344827586207, 0.9620689655172414, 0.993103448275862, 1.0241379310344827, 1.0551724137931036, 1.0862068965517242, 1.1172413793103448, 1.12825, 1.1482758620689655, 1.1793103448275861, 1.210344827586207, 1.2413793103448276, 1.2724137931034483, 1.303448275862069, 1.3344827586206895, 1.3655172413793104, 1.396551724137931, 1.4275862068965517, 1.4586206896551723, 1.4896551724137932, 1.5206896551724138, 1.5517241379310345, 1.5827586206896551, 1.6137931034482758, 1.6448275862068966, 1.6758620689655173, 1.706896551724138, 1.7379310344827585, 1.7689655172413794, 1.8]                                                              

run(`xclean`)
# run(`./runGenerateCfourScript35.csh $(point) $(ROH) $(ROCL) $(A)`)
# run(`./runGenerateCfourScript37.csh $(point) $(ROH) $(ROCL) $(A)`)
# point += 1

for point in R
    run(`xclean`)
    run(`./RUN_CFOUR.csh $(point)`)
end

# for i in 1:numberOfJobs
#     run(`qsub -e CH3OH_CBS_$(point)-$(point + jobSplit).e -o CH3OH_CBS_$(point)-$(point + jobSplit).o -l h_rt="11:59:00" -l mem=70G -l tmpfs=100G RunMolproJobs.csh $(point) $(point + jobSplit)`)
#     global point = point + jobSplit
#     println(point)
# end