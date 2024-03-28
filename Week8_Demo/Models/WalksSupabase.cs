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
    public class WalksSupabase : BaseModel
    {
        [PrimaryKey("walk_id", false)]
        public int Walk_Id { get; set; }

        [Column("user_id")]
        public int User_Id { get; set; }

        [Column("dog_id")]
        public int Dog_Id { get; set; }

        [Column("walk_date")]
        public DateTime Walk_Date { get; set; }

        [Column("walk_time")]
        public string Walk_Time { get; set; }

        [Column("walk_description")]
        public string Walk_Description { get; set; }

        [Column("walk_duration")]
        public float Walk_Duration { get; set; }

        [Column("walk_distance")]
        public float Walk_Distance { get; set; }

        [Column("walk_weather")]
        public string Walk_Weather { get; set; }

        [Column("dog_rating")]
        public int Dog_Rating { get; set; }

    }
}
