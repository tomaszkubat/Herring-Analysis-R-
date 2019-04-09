# load raw data
dataRaw <- read.table('data/raw/herringDataRaw.csv', header = TRUE, sep = ',')

# rename column (add human-readable labels)
dataRawCleaned01 <- rename(dataRaw, 
    id = X,
    planktonCfin1 = cfin1, # dostępność planktonu [zagęszczenie Calanus finmarchicus gat. 1]
    planktonCfin2 = cfin2, # dostępność planktonu [zagęszczenie Calanus finmarchicus gat. 2]
    planktonChel1 = chel1, # dostępność planktonu [zagęszczenie Calanus helgolandicus gat. 1]
    planktonChel2 = chel2, # dostępność planktonu [zagęszczenie Calanus helgolandicus gat. 2]
    planktonLcop1 = lcop1, # dostępność planktonu [zagęszczenie widłonogów gat. 1]
    planktonLcop2 = lcop2, # dostępność planktonu [zagęszczenie widłonogów gat. 2]
    fryLeftPrc = fbar, # natężenie połowów w regionie [ułamek pozostawionego narybku]
    fryAnnual = recr, # roczny narybek [liczba śledzi]
    fryLeftAnnualPrc = cumf, #łączne roczne natężenie połowów w regionie [ułamek pozostawionego narybku];
    herringsNumber = totaln, # łączna liczba ryb złowionych w ramach połowu [liczba śledzi]
    waterTemperature = sst, # temperatura przy powierzchni wody [°C]
    salinity = sal, # poziom zasolenia wody [Knudsen ppt]
    monthnr = xmonth, # miesiąc połowu [numer miesiąca]
    nothAtlanticOscillation = nao # oscylacja północnoatlantycka [mb]
)
