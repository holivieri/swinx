using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

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

        [StringLength(350)]
        public string PhotoUrl { get; set; }

    }
}
