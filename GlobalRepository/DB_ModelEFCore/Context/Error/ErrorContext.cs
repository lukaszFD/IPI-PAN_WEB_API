using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Configuration;

namespace DB_ModelEFCore.Models.Error
{
    public partial class ErrorContext : DbContext
    {
        public ErrorContext()
        {
        }

        public ErrorContext(DbContextOptions<ErrorContext> options)
            : base(options)
        {
        }

        public virtual DbSet<ErrorMessages> ErrorMessages { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                IConfigurationRoot configuration = new ConfigurationBuilder().SetBasePath(AppDomain.CurrentDomain.BaseDirectory).AddJsonFile("appsettings.json").Build();
                optionsBuilder.UseSqlServer(configuration.GetConnectionString("GlobalRepositoryDatabase"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.6-servicing-10079");

            modelBuilder.Entity<ErrorMessages>(entity =>
            {
                entity.HasKey(e => e.ErrorId)
                    .HasName("PK__ErrorMes__358565CAB3C924C4");

                entity.ToTable("ErrorMessages", "error");

                entity.Property(e => e.ErrorId).HasColumnName("ErrorID");

                entity.Property(e => e.ColumnName).HasMaxLength(100);

                entity.Property(e => e.ErrorDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.SchemaName).HasMaxLength(100);

                entity.Property(e => e.TableName).HasMaxLength(100);

                entity.Property(e => e.UserName)
                    .IsRequired()
                    .HasMaxLength(100)
                    .HasDefaultValueSql("(stuff(suser_sname(),(1),charindex('\\',suser_sname()),''))");
            });
        }
    }
}
