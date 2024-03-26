using Postgrest.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Postgrest.Models;


namespace Mobile_Application.Models
{
    [Table("user_dogs")]
    public class UsersDogsSuperbase : BaseModel
    {
        [PrimaryKey("id", false)]
        public int Id { get; set; }

        [Column("user_id")]
        public int User_Id { get; set; }

        [Column("dog_name")]
        public string Dog_Name { get; set; }

        [Column("dog_colour")]
        public string Dog_Colour { get; set; }

        [Column("dog_age")]
        public float Dog_Age { get; set; }

        [Column("dog_breed")]
        public string Dog_Breed { get; set; }

        [Column("dog_size")]
        public string Dog_Size { get; set; }
    }
}
