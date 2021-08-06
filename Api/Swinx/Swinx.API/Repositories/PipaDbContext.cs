using System;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Swinx.APIEntities;
using Swinx.APIModels;

#nullable disable

namespace Swinx.APIRepositories
{
    public class swinxDbContext : IdentityDbContext<User>, ISwinxDbContext
    {

        public swinxDbContext(DbContextOptions<swinxDbContext> options)
            : base(options)
        {
        }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Modern_Spanish_CI_AS");

            var adminRole = new IdentityRole()
            {
                Id = Guid.NewGuid().ToString(),
                Name = "admin",
                NormalizedName = "admin",
            };
            var patientRole = new IdentityRole()
            {
                Id = Guid.NewGuid().ToString(),
                Name = "couple",
                NormalizedName = "couple",
            };
            var userRole = new IdentityRole()
            {
                Id = Guid.NewGuid().ToString(),
                Name = "single",
                NormalizedName = "single",
            };

            modelBuilder.Entity<IdentityRole>().HasData(adminRole);
            modelBuilder.Entity<IdentityRole>().HasData(patientRole);
            modelBuilder.Entity<IdentityRole>().HasData(userRole);


            base.OnModelCreating(modelBuilder);
        }
    }
}
