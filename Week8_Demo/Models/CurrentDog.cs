﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mobile_Application.Models
{
    public class CurrentDog
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Breed { get; set; }
        public string Colour { get; set; }
        public float Age { get; set; }
        public string Size { get; set; }
        

        // do singleton pattern
        private static CurrentDog instance = null;

        public static CurrentDog Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new CurrentDog();
                }
                return instance;
            }
        }
        //clear function
        public void Clear()
        {
            Id = 0;
            Name = "";
            Breed = "";
            Colour = "";
            Age = 0;
            Size = "";
        }
    }


}
