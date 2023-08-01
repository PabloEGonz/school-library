class Validator
    def boolean(input)
        /^[YyNn]$/.match?(input)
    end

    def number(input)
        /^\d+$/.match?(input)
    end

    def date(input)
        /^\d{4}-\d{2}-\d{2}$/.match?(input)
    end
end
 