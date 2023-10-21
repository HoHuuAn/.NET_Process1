using System.Security.Cryptography;
using System.Text;

namespace Services.Helpers
{
	public class Generated
	{
		public static string GeneratedSlug(string name)
		{
			string slug = name.ToLower().Replace(" ", "-");
			slug = new string(slug?.Where(c => char.IsLetterOrDigit(c) || c == '-').ToArray());
			slug = slug.Trim('-');
			return slug;
		}

		public static string GenerateHashedPassword(string password)
		{
			using (SHA256 sha256Hash = SHA256.Create())
			{
				byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));

				StringBuilder builder = new StringBuilder();
				for (int i = 0; i < bytes.Length; i++)
				{
					builder.Append(bytes[i].ToString("x2"));
				}
				return builder.ToString();
			}
		}
	}
}
