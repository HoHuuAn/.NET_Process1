﻿namespace Services.API.RequestEntities
{
	public class UserRequest
	{
		public required int Id { get; set; }
		public required string FullName { get; set; }
		public required string Email { get; set; }
		public required string Dob { get; set; }
		public required string Phone { get; set; }
		public required string Address { get; set; }
		public required int RoleId { get; set; }
		public required string Password { get; set; }
		public required string ConfirmPassword { get; set; }
	}
}
