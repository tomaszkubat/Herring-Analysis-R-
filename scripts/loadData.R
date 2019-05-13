############################################################################################
# cleaning data
############################################################################################


# load raw data
dataRaw <- read.table(
  file = 'data/raw/herringDataRaw.csv',
  sep = ',',
  na.strings = c('?'), # treat given characters as NA
  row.names = 1, # read first column as row.name
  header = TRUE, # treat first row as a header
  colClasses = c("integer", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "integer", "numeric", "numeric", "numeric", "numeric", "factor", "numeric")
)

# rename column (add human-readable labels)
dataRaw <- rename(dataRaw, 
    planktonCfin1 = cfin1, # dostępność planktonu [zagęszczenie Calanus finmarchicus gat. 1]
    planktonCfin2 = cfin2, # dostępność planktonu [zagęszczenie Calanus finmarchicus gat. 2]
    planktonChel1 = chel1, # dostępność planktonu [zagęszczenie Calanus helgolandicus gat. 1]
    planktonChel2 = chel2, # dostępność planktonu [zagęszczenie Calanus helgolandicus gat. 2]
    planktonLcop1 = lcop1, # dostępność planktonu [zagęszczenie widłonogów gat. 1]
    planktonLcop2 = lcop2, # dostępność planktonu [zagęszczenie widłonogów gat. 2]
    fryLeftPrc = fbar, # natężenie połowów w regionie [ułamek pozostawionego narybku]
    fryAnnualSize = recr, # roczny narybek [liczba śledzi]
    fryLeftAnnualPrc = cumf, #łączne roczne natężenie połowów w regionie [ułamek pozostawionego narybku];
    herringsNumber = totaln, # łączna liczba ryb złowionych w ramach połowu [liczba śledzi]
    waterTemperature = sst, # temperatura przy powierzchni wody [°C]
    salinity = sal, # poziom zasolenia wody [Knudsen ppt]
    monthNr = xmonth, # miesiąc połowu [numer miesiąca]
    northAtlanticOscillation = nao # oscylacja północnoatlantycka [mb]
)

# clean data
dataCleaned <- dataRaw
dataCleaned$planktonCfin1 <- with(dataCleaned, impute(planktonCfin1, mean))
dataCleaned$planktonCfin2 <- with(dataCleaned, impute(planktonCfin2, mean))
dataCleaned$planktonChel1 <- with(dataCleaned, impute(planktonChel1, mean))
dataCleaned$planktonChel2 <- with(dataCleaned, impute(planktonChel2, mean))
dataCleaned$planktonLcop1 <- with(dataCleaned, impute(planktonLcop1, mean))
dataCleaned$planktonLcop2 <- with(dataCleaned, impute(planktonLcop2, mean))
dataCleaned$waterTemperature <- with(dataCleaned, impute(waterTemperature, mean))


### SUMMARIZE RAW DATA

# dim(dataRaw)
# summary(dataRaw) # summary 1


### SUMMARIZE CLEANED DATA

### no outliers (month: 1-12, numbers > 0)
### prc of NA is not significant - we can'not remove variables
# plot(dataRaw)



# summary(dataCleaned)
# dataCleanedCorr <- cor(select(dataCleaned, -monthNr)) # calculate correlation for numeric variables

# dataCleanedCorr
# corrplot(dataCleanedCorr, method = 'circle', insig = 'blank', order = 'alphabet', type = 'upper')

# d <- dim(dataCleanedCorr)[1]
# ???
# plot(dataCleaned)