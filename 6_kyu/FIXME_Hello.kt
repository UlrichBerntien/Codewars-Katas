class Dinglemouse {

    private var name: String = ""
    private var age: Int = 0
    private var sex: Char = ' '
    private var output: String = ""

    private fun addOutput(v: Char): Unit {
        if (!this.output.contains(v)) this.output += v
    }

    fun setAge(age: Int): Dinglemouse {
        this.addOutput('A')
        this.age = age
        return this
    }

    fun setSex(sex: Char): Dinglemouse {
        this.addOutput('S')
        this.sex = sex
        return this
    }

    fun setName(name: String): Dinglemouse {
        this.addOutput('N')
        this.name = name
        return this
    }

    fun hello(): String {
        var msg: String = "Hello."
        for (c in this.output.iterator()) when (c) {
            'N' -> msg += " My name is ${this.name}."
            'A' -> msg += " I am ${this.age}."
            'S' -> msg += if (this.sex == 'M') " I am male." else " I am female."
        }
        return msg
    }
}
