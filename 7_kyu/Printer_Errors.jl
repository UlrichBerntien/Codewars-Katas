module Printer
    export printer_error

    function printer_error(s)
        totals = length(s)
        errors = count( c -> c < 'a' || 'm' < c ,s )
        "$errors/$totals"
    end

end