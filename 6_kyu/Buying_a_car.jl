module Car
    export nb_months

    function nb_months(startPriceOld, startPriceNew, savingperMonth, percentLossByMonth)
        priceDelta = startPriceNew-startPriceOld
        lossFactor = 1 - percentLossByMonth/100
        saving = 0
        month = 0
        while saving < priceDelta
            month += 1
            saving += savingperMonth
            priceDelta *= lossFactor
            if isodd(month)
                lossFactor -= 0.5/100
            end
        end
        [month, round(Int,saving-priceDelta)]
    end

end