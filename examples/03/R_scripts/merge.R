
# Merge
dat$temp.slurry.meas <- dat$temp
dat <- merge(dat, mod, by = c('site', 'date'), all = TRUE)
dm <- merge(dm, mod, by = c('site', 'date'), all = TRUE)
dm <- dm[order(dm$site, dm$date), ]

# long format for plots
dl <- melt(dm, id.vars = c('site', 'date', 'doy', 'year'),
           measure.vars = c('air_temp', 'slurry_temp', 'temp'))

dl$variable <- factor(dl$variable, levels = c('air_temp', 'temp', 'slurry_temp'), labels = c('Measured air', 'Measured slurry', 'STM slurry'))
