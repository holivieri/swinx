using Microsoft.EntityFrameworkCore;
using Swinx.APIEntities;
using Swinx.APIModels;


namespace Swinx.APIRepositories
{
    public interface ISwinxDbContext
    {
        DbSet<User> Users { get; set; }



    }
}
