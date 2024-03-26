using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Mobile_Application.Models;

namespace Mobile_Application.Services
{
    public class DogBuilder
    {
        private Dog _dog;

        public DogBuilder()
        {
            _dog = new Dog();
        }

        public DogBuilder WithName(string name)
        {
            _dog.DogName = name;
            return this;
        }

        public DogBuilder WithColour(string colour)
        {
            _dog.DogColour = colour;
            return this;
        }

        public DogBuilder WithBreed(string breed)
        {
            _dog.DogBreed = breed;
            return this;
        }

        public DogBuilder WithAge(float age)
        {
            _dog.DogAge = age;
            return this;
        }

        public DogBuilder WithSize(string size)
        {
            _dog.DogSize = size;
            return this;
        }

        public Dog Build()
        {
            return _dog;
        }


    }
}
