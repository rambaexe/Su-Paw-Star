using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mobile_Application.Models
{
    public class Dog
    {
        public string DogName { get; set; }
        public string DogColour { get; set; }
        public string DogBreed { get; set; }
        public float DogAge { get; set; }
        public string DogSize { get; set; }

        // create builder and factory to create dog model for UserDogsSuperbase
    }
}
