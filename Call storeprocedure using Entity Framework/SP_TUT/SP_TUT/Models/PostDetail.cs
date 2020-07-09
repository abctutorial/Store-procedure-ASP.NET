using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace SP_TUT.Models
{
    public class PostDetail
    {
        public int PostId { get; set; }
        public Nullable<int> PostWeight { get; set; }
        public string PostName { get; set; }
        public Nullable<int> catId { get; set; }
        [NotMapped]
        public string catName { get; set; }
    }
}