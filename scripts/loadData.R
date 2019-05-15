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

# impute data
dataImputed <- dataRaw
dataImputed$planktonCfin1 <- with(dataImputed, impute(planktonCfin1, mean))
dataImputed$planktonCfin2 <- with(dataImputed, impute(planktonCfin2, mean))
dataImputed$planktonChel1 <- with(dataImputed, impute(planktonChel1, mean))
dataImputed$planktonChel2 <- with(dataImputed, impute(planktonChel2, mean))
dataImputed$planktonLcop1 <- with(dataImputed, impute(planktonLcop1, mean))
dataImputed$planktonLcop2 <- with(dataImputed, impute(planktonLcop2, mean))
dataImputed$waterTemperature <- with(dataImputed, impute(waterTemperature, mean))


# clean data
dataCleaned <- select(
  dataImputed,
  -c(fryLeftAnnualPrc, fryLeftPrc, fryAnnualSize, planktonLcop1, planktonLcop2, northAtlanticOscillation)
) # remove redundant variables
