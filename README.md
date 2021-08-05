# README
* PARTE II

1 - Primero se debe crear la app a través de un nuevo proyecto, que puede ser por ejemplo rails new animal_app

2- Se define como la clase Padre a Animal y como clases hijas a Cat, Dog y Cow.

3- Por lo tanto, utilizando la poliformidad, en la terminal creamos los modelos para Animal, Dog, Cat y Cow de la siguiente manera

*   3.1- rails g name animaleable:references{polymorphic}
*    3.2- rails g model Dog , rails g model Cat y rails g model Cow
*    3.3- En modelos Dog, Cat y Cow debemos agregar has_many :animals, as: :animaleable para crear la relación.
*    3.4- Verificar en modelo Animal que la relación quede belongs_to :animaleable, polymorphic: true

4- Correr migraciones rails db:migrate

5- Probar las relaciones en consola mediante rails c : 

*    5.1- Dog.create
*    5.2- Animal.create(specie_id: 1, specie_type: "Dog")
*    5.3- Verificamos si relación está creada con Dog.last.animals

6 - Ejemplos de como implementar poliformismo con patrones de diseño: 

*    6.1- Usando Herencia

*        class Animal < ApplicationRecord 
*            def move 
*                puts 'I can walk cause I am an animal' 
*            end 
*        end

*        class Dog < Animal 
*            def talk 
*                puts 'I can walk cause I am a dog' 
*            end 
*        end
*            
*        Luego instanciamos cada una de ellas y llamamos al método move
*            animal = Animal.new 
*            animal.move   --> respuesta sería "I can walk cause I am an animal"

*            animal = Dog.new 
*            animal.move    --> respuesta sería "I can walk cause I am a dog"


*    6.2- Usando Duck Typing (Duck Typing es cuando un objeto que es pasado como parámetro a una función, soporta todos los métodos y atributos que se esperan que ese objeto pueda ejecutar. De esta manera, se puede implementar polimorfismo sin tener que recurrir a la herencia)

*        class Animal 
*            def move(animal) 
*                animal.move 
*            end
*        end

*        class Dog 
*            def move 
*                puts 'I can walk cause I am a dog' 
*            end 
*        end

*        Instanciando:
*            animal = Animal.new 
*            animal.move(Dog.new) --> respuesta sería "I can walk cause I am a dog"

*    6.3- Usando Decorador (Este patrón de diseño nos permite que cierto comportamiento sea agregado dinámicamente a un objeto sin afectar el comportamiento de otros objetos de la misma clase)

*        class Animal 
*            def move
*                puts 'I can walk cause I am an animal' 
*            end
*        end

*        class Dog 
*            def initialize(animal) 
*                @animal = animal
*            end

*            def move 
*                @animal.move puts 'I can walk cause I am a dog' 
*            end 
*        end

*       animal = Animal.new  --> 'I can walk cause I am an animal' 
*       Dog.new(animal).move  --> 'I can walk cause I am a dog' 