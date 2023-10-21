using Microsoft.AspNetCore.Mvc;
using Services.Repository;
using Services.Services;

namespace WebApplication1.Controllers
{
	public class HomeController : Controller
	{
		private ProductService _productService;

		public HomeController(MyDbContext db)
		{
			_productService = new ProductService(db);
		}

		public IActionResult Index()
		{
			string s1 = HttpContext.Session.GetString("customerID");
			string s2 = HttpContext.Session.GetString("Name");

            ViewData["username"] = HttpContext.Session.GetString("username");
			ViewData["Name"] = HttpContext.Session.GetString("Name");

			ViewBag.Products = _productService.GetAll();
			return View();
		}

		public IActionResult Privacy()
		{
			return View();
		}
	}
}