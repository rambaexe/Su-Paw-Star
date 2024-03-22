using Postgrest.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Postgrest.Models;


namespace Mobile_Application.Models
{ 
    [Table("users")]
    public class UserSuperbase : BaseModel
    {
        [PrimaryKey("id",false)]
        public int Id { get; set; }

        [Column("email")]
        public string Email { get; set; }

        [Column("created_at")]
        public string CreatedAt { get; set; }

        [Column("name")]
        public string FirstandLastName { get; set; }
    }
}
