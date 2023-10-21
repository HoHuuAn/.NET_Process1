using Microsoft.AspNetCore.Mvc;
using Services.Repository;
using Services.Services;

namespace WebApplication1.Controllers
{
	[Route("/Admin")]
	public class AdminController : Controller
	{
		private ProductService _productService;
		private CustomerService _customerService;	
		private OrderService _orderService;	
		private CategoryService _categoryService;

		public AdminController(MyDbContext db)
		{
			_productService = new ProductService(db);
			_customerService = new CustomerService(db);
			_orderService = new OrderService(db);
			_categoryService = new CategoryService(db);
		}

		[HttpGet]
		public ActionResult Index()
		{
			ViewBag.Products = _productService.GetAll();
			return View();
		}


        [HttpGet("product/edit/{id}")]
        public IActionResult Edit(int id)
        {
            return View();
        }

        [HttpPost("product/edit/{id}")]
        public IActionResult Edit(int id, string name)
        {
            return View();
        }

        [HttpGet("product/delete/{id}")]
        public IActionResult Delete(int id)
        {
            _productService.DeleteProduct(id);
            return RedirectToAction("Index","Admin");
        }
    }
}
