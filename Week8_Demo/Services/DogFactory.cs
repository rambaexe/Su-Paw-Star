using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mobile_Application.Models;

namespace Mobile_Application.Services
{
    public class DogFactory
    {
        public static Dog CreateSmallDog(string name, string breed, float age, string colour)
        {
            return new DogBuilder()
                .WithSize("Small")
                .WithName(name)
                .WithBreed(breed)
                .WithAge(age)
                .WithColour(colour)
                .Build();
        }

        public static Dog CreateMediumDog(string name, string breed, float age, string colour)
        {
            return new DogBuilder()
                .WithSize("Medium")
                .WithName(name)
                .WithBreed(breed)
                .WithAge(age)
                .WithColour(colour)
                .Build();
        }

        public static Dog CreateLargeDog(string name, string breed, float age, string colour)
        {
            return new DogBuilder()
                .WithSize("Large")
                .WithName(name)
                .WithBreed(breed)
                .WithAge(age)
                .WithColour(colour)
                .Build();
        }

        public static Dog CreateGiantDog(string name, string breed, float age, string colour)
        {
            return new DogBuilder()
                 .WithSize("Giant")
                 .WithName(name)
                 .WithBreed(breed)
                 .WithAge(age)
                 .WithColour(colour)
                 .Build();
        }
    }
}
