using Swinx.APIEntities;
using Swinx.APIModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Swinx.APIRepositories
{
    public class UserRepository : IUsersRepository
    {
        ISwinxDbContext _ctx;

        public UserRepository(ISwinxDbContext context)
        {
            _ctx = context;

        }

        public void Add(User user)
        {
            throw new NotImplementedException();
        }

        public User Get(Guid userId)
        {
            return _ctx.Users.Find(userId);
        }

        public User Get(string userName, string password)
        {
            return _ctx.Users.Where(x => x.UserEmail == userName && x.UserPassword == password).SingleOrDefault();
        }
    }
}
