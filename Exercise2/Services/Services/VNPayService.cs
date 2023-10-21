using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Web;
using System.Security.Cryptography;

public class VNPayService
{
    private static string url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
    private static string vnp_TmnCode = "NIO44LD1";
    private static string vnp_HashSecret = "ZJAITHQTQNRPOMZSPCTYUTQDXYWJAENT";
    private static string vnp_Version = "2.1.0";
    private static string vnp_Command = "pay";
    private static string vnp_OrderType = "billpayment";
    private static string returnUrl = "https://sandbox.vnpayment.vn/merchant_webapi/merchant.html";

    public static Dictionary<string, string> Config()
    {
        var res = new Dictionary<string, string>()
        {
            { "vnp_TmnCode" ,vnp_TmnCode},
            {"vnp_HashSecret", vnp_HashSecret },
            {"vnp_Command", vnp_Command },
            {"vnp_Version", vnp_Version },
            {"return_Url", returnUrl },
        };
        return res;
    }


    public static string GeneratePaymentUrl(decimal vnp_Amount, string vnp_BankCode = "", string vnp_OrderInfo = "", string vnp_ReturnUrl = "")
    {
        TimeZoneInfo timeZone = TimeZoneInfo.Local;
        DateTime now = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, timeZone);

        string vnp_CreateDate = now.ToString("yyyyMMddHHmmss");

        Dictionary<string, string> vnp_Params = new Dictionary<string, string>
    {
        { "vnp_Version", vnp_Version },
        { "vnp_Command", vnp_Command },
        { "vnp_TmnCode", vnp_TmnCode },
        { "vnp_Amount", vnp_Amount.ToString("F0") },
        { "vnp_BankCode", vnp_BankCode },
        { "vnp_CreateDate", vnp_CreateDate },
        { "vnp_CurrCode", "VND" },
        { "vnp_Locale", "vn" },
        { "vnp_OrderInfo", vnp_OrderInfo },
        { "vnp_IpAddr", GetClientIpAddress() },
        { "vnp_OrderType", vnp_OrderType },
        { "vnp_ReturnUrl", returnUrl },
        { "vnp_TxnRef", 2.ToString()}
    };

        DateTime expireTime = now.AddMinutes(15);
        string vnp_ExpireDate = expireTime.ToString("yyyyMMddHHmmss");
        vnp_Params.Add("vnp_ExpireDate", vnp_ExpireDate);

        List<string> fieldNames = new List<string>(vnp_Params.Keys);
        fieldNames.Sort();

        StringBuilder query = new StringBuilder();

        foreach (string fieldName in fieldNames)
        {
            string fieldValue = vnp_Params[fieldName];
            if (!string.IsNullOrEmpty(fieldValue))
            {
                query.Append($"{fieldName}={HttpUtility.UrlEncode(fieldValue, Encoding.ASCII)}&");
            }
        }

        string queryUrl = query.ToString().TrimEnd('&');
        string vnp_SecureHash = CalculateHmacSHA512(vnp_HashSecret, queryUrl);

        string paymentUrl = $"{url}?{queryUrl}&vnp_SecureHash={vnp_SecureHash}";

        return paymentUrl;
    }

    public static string GetClientIpAddress()
    {
        string ipAddress = string.Empty;
        string hostName = Dns.GetHostName();
        IPAddress[] addresses = Dns.GetHostAddresses(hostName);

        foreach (IPAddress address in addresses)
        {
            if (address.AddressFamily == AddressFamily.InterNetwork)
            {
                ipAddress = address.ToString();
                break;
            }
        }
        return ipAddress;
    }

    public static string CalculateHmacSHA512(string secret, string data)
    {
        byte[] secretBytes = Encoding.ASCII.GetBytes(secret);
        byte[] dataBytes = Encoding.ASCII.GetBytes(data);

        using (var hmac = new HMACSHA512(secretBytes))
        {
            byte[] hashBytes = hmac.ComputeHash(dataBytes);
            return BitConverter.ToString(hashBytes).Replace("-", "").ToLower();
        }
    }
}
