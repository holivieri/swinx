using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;

#nullable disable

namespace Swinx.APIEntities
{
    public partial class User: IdentityUser
    {
        public User()
        {
       
        }

        public string UserEmail { get; set; }
        public string UserPassword { get; set; }

       
    }
}
