using Microsoft.EntityFrameworkCore.Update.Internal;
using Services.Models.Cart;
using Services.Models.Customers;
using Services.Models.Order;
using Services.Repository;

namespace Services.Services
{
	public class OrderService
	{
		private readonly MyDbContext _dbContext;
		private CustomerRepository customerRepository;
		private ProductRepository productRepository;

		public OrderService(MyDbContext db)
		{
			customerRepository = new CustomerRepository(db);
			productRepository = new ProductRepository(db);
			_dbContext = db;
		}
		// Create a new Order
		public void CreateOrder(Customer customer, List<CartDetail> CartDetails)
		{
			string refId = Guid.NewGuid().ToString();
			decimal sum = 0;

			Order order = new Order() {
				ReferenceId = refId,
				Customer = customer, 
				OrderDate = DateTime.Now 
			};

			foreach (var x in CartDetails)
			{
				sum += x.Product.Price * x.Quantity;
				_dbContext.OrderDetails.Add( new OrderDetail()
				{
					Order = order,
					Product = x.Product,
					Quantity = x.Quantity
				});
			}

			// order.TotalAmount = sum;
			
			// _dbContext.Orders.Add(order);
			_dbContext.SaveChanges();
		}

		public Order? GetOrder(int Id)
		{
			return _dbContext.Orders.FirstOrDefault(order => order.Id == Id);
		}

	}
}
