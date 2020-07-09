using SP_TUT.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SP_TUT.Controllers
{
    public class HomeController : Controller
    {
        TestDBEntities context = new TestDBEntities();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult List()
        {
            string name = null;
            int? id = null;
            SqlParameter[] param = new SqlParameter[]{
                new SqlParameter("@id",id??(object)DBNull.Value),
                new SqlParameter("@name",name??(object)DBNull.Value)
            };
            var data = context.Database.SqlQuery<PostDetail>("GetDataByIdName @id,@name", param).ToList();
            return View(data);
        }
    }
}