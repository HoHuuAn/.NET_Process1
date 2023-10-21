using Services.Models.Cart;
using Services.Models.Customers;

namespace Services.Repository
{
	public class CartRepository
	{
		private readonly MyDbContext _db;
		private readonly ProductRepository _productRepository;
		public CartRepository(MyDbContext db)
		{
			_db = db;
			_productRepository = new ProductRepository(db);
		}

		// get infor from cart by phone of customer
		public Cart? GetCartByCustomerId(int customerId)
		{
			return _db.Carts.FirstOrDefault(c => c.Customer.Id == customerId);
		}

		// get by cart id
		public Cart? GetById(int Id)
		{
			return _db.Carts.FirstOrDefault(c => c.Id == Id);
		}

		// create the cart not cart detail
		public void Create(Customer c)
		{
			_db.Carts.Add(new Cart() { Customer = c, CreatedAt = DateTime.Now});
			_db.SaveChanges();
		}
		// updating product exist in cart
		public void UpdateItem(int cartId, int productId, int quan)
		{
			var item = _db.CartDetails.FirstOrDefault(cd => cd.Product.Id == productId && cd.CartId == cartId);
			if (item != null)
			{
				item.Quantity = quan;
				_db.SaveChanges();
			}
		}

		// get all product from a cart
		public List<CartDetail> GetCartDetails(int cartId)
		{
			var res = _db.CartDetails.Where(c => c.CartId == cartId).ToList();
			return res;
		}

		public void AddToCart(int cartId, int productId)
		{
			var product = _productRepository.GetProductById(productId);

			if (product != null)
			{
				var detail = new CartDetail() { CartId = cartId, Product = product, Quantity = 1 };
				_db.CartDetails.Add(detail);
				_db.SaveChanges();
			}
		}

		public void RemoveFromCart(int cartId, int productId)
		{
			var cartDetail = _db.CartDetails.FirstOrDefault(cd => cd.CartId == cartId && cd.Product.Id == productId);
			if (cartDetail != null)
			{
				_db.CartDetails.Remove(cartDetail);
				_db.SaveChanges();
			}
		}
	}
}
