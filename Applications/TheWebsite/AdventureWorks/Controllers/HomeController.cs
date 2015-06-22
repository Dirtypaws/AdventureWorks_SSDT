using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AdventureWorks.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            using (var db = new AdventureWorksEntities())
            {
                var model = db.People.ToList();

                return View(model);
            }
        }
    }
}