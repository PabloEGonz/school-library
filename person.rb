class Person
    def initialize(age, name = 'Unknown', parent_permission = true)
        @id = Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    def id
        @id
    end

    def name
        @name
    end

    def age
        @age
    end

    def name=(name)
        @name = name
    end

    def age=(age)
        @age = age
    end

    private def of_age? 
        if @age >= 18 
            true
        else
            false
        end
    end

    public def can_use_services?
        if of_age? && @parent_permission
            true
        else
            false
        end
    end
end