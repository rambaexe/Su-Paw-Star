using Postgrest.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Postgrest.Models;

namespace Mobile_Application.Models
{
    [Table("walks")]
    public class WalksSupabase : BaseModel
    {
        [PrimaryKey("walk_id", false)]
        public int Walk_Id { get; set; }

        [Column("user_id")]
        public int User_Id { get; set; }

        [Column("dog_id")]
        public int Dog_Id { get; set; }

        [Column("walk_date")]
        public string Walk_Date { get; set; }

        [Column("walk_time")]
        public string Walk_Time { get; set; }

        [Column("walk_description")]
        public string Walk_Description { get; set; }

        [Column("dog_rating")]
        public int Dog_Rating { get; set; }

        [Column("walk_title")]
        public string Walk_Title { get; set; }

    }
}
