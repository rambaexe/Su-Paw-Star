using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mobile_Application.Models
{
    public class CurrentWalk
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Date { get; set; }
        public string Time { get; set; }
        public string Description { get; set; }
        public int Rating { get; set; }

        // do singleton pattern
        private static CurrentWalk instance = null;

        public static CurrentWalk Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new CurrentWalk();
                }
                return instance;
            }
        }
        //clear function
        public void Clear()
        {
            Id = 0;
            Title = "";
            Date = "";
            Time = "";
            Description = "";
            Rating = 0;
        }
    }
}
