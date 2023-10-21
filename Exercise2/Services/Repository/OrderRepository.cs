using Services.Models.Order;

namespace Services.Repository
{
    public class OrderRepository
    {
        private MyDbContext _db;
        public OrderRepository(MyDbContext db) {
            _db =  db;
        }

        public void CreateOrder(Order order)
        {
            _db.Orders.Add(order);
        }

        public Order GetByReferenceId(string refId)
        {
            return (from order in _db.Orders where order.ReferenceId.Equals(refId) select order).First();
        }

        public List<Order> GetAllOrderByCustomrerPhone(string phone)
        {
            var customer = _db.Customers.First(c => c.Phone.Equals(phone));

            var res = from order in _db.Orders where order.Customer.Phone.Equals(customer.Phone) select order;

            return res.ToList();
        }
    }
}
