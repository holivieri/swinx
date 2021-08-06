using System;

namespace Swinx.APIModels
{
    public class UserToken
    {
        public string userName { get; set; }
        public string Token { get; set; }
        public DateTime Expiration { get; set; }
    }
}
