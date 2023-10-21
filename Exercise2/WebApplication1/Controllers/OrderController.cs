using Microsoft.AspNetCore.Mvc;
using Services.Repository;
using Services.Services;

namespace WebApplication1.Controllers
{
	[Route("/order")]
	public class OrderController : Controller
	{
		private string callBackUrl = "https://localhost:7222/order/call-back";
		private string _orderId;
		private OrderService _orderService;
		public OrderController(MyDbContext db)
		{
            _orderService = new OrderService(db);
        }

		[HttpGet("payment")]
		public IActionResult GetPayment([FromQuery] decimal total)
		{
			ViewBag.Total = total;
            ViewData["username"] = HttpContext.Session.GetString("username");
            ViewData["Name"] = HttpContext.Session.GetString("Name");

            return View();
		}

		[HttpPost("payment")]
		public IActionResult SubmitPayment([FromForm] decimal total, [FromForm] string bankcode)
		{
			var vnp_url = VNPayService.GeneratePaymentUrl(total, bankcode, "Thanhtoanhoadon" ,callBackUrl);            
			return Redirect(vnp_url);
		}


		[HttpGet("call-back")]
		public IActionResult CallBack()
		{
			var Request = HttpContext.Request;

            string vnpResponseCode = Request.Query["vnp_ResponseCode"];
            string vnpTransactionNo = Request.Query["vnp_TransactionNo"];

            if (vnpResponseCode == "00")
            {
                // Thanh toán thành công - cập nhật trạng thái đơn hàng hoặc thực hiện các hành động khác

                // Chuyển hướng đến trang Success
                return RedirectToAction("Success");
            }
            else
            {
                // Thanh toán thất bại - có thể ghi log hoặc thực hiện các hành động khác

                // Chuyển hướng đến trang Failed
                return RedirectToAction("Failed");
            }
        }

		[HttpGet]
		public IActionResult Succes() {
			return View(); 
		}
		
		[HttpGet]
        public IActionResult Failed() { 
			return View(); 
		}
	}
}
