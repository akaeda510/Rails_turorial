class User < ApplicationRecord
    validates :name , presence: true 
    validates :age, numericality: { only_integer: true}, presence: true
    def self.hello_world
        'Hello, World!!'
    end

    def say_hello
        'Hello!!'
    end
end
