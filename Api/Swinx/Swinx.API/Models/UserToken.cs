using System;
using System.Collections.Generic;

namespace Swinx.APIModels
{
    public class UserToken
    {
        public string UserId { get; set; }
        public List<string> Roles { get; set; }
        public string UserName { get; set; }
        public string Token { get; set; }
        public DateTime Expiration { get; set; }
        public string PhotoUrl { get; set; }
    }
}
