using Swinx.APIEntities;
using Swinx.APIModels;
using System;
using System.Collections.Generic;
using System.Linq;


namespace Swinx.APIRepositories
{
    public interface IUsersRepository
    {
        void Add(User user);
        User Get(Guid userId);
        User Get(string userName, string password);


    }
}
