# Runs simulations and makes plots

# Remove old results
rm stm_output/*.*

sim_start_time="$SECONDS"

# Run all simulations in parallel
./stm Raan pars/pars.txt pars/Raan_u_pars.txt weather/Uppsala_weather.txt level/Raan_level.txt &
./stm Tjel pars/pars.txt pars/Tjel_u_pars.txt weather/Tjele_weather.txt level/Tjel_level.txt 

sim_end_time="$SECONDS"

# Move output
mv *_temp.csv* stm_output
mv *_weather* stm_output
mv *_rates* stm_output
mv *_log* logs

# Run R scripts

cd R_scripts
  Rscript 'main_plot.R'
cd ..

plot_end_time="$SECONDS"

echo "Model runs took $(($sim_end_time-$sim_start_time)) seconds."
echo "Plotting took $(($plot_end_time-$sim_end_time)) seconds."
echo "Check the logs directory for information."

