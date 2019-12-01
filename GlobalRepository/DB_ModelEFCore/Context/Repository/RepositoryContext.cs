using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Configuration;

namespace DB_ModelEFCore.Models.Repository
{
    public partial class RepositoryContext : DbContext
    {
        public RepositoryContext()
        {
        }

        public RepositoryContext(DbContextOptions<RepositoryContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Accounts> Accounts { get; set; }
        public virtual DbSet<CountryRegion> CountryRegion { get; set; }
        public virtual DbSet<Servers> Servers { get; set; }
        public virtual DbSet<Systems> Systems { get; set; }
        public virtual DbSet<Users> Users { get; set; }

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

            modelBuilder.Entity<Accounts>(entity =>
            {
                entity.HasKey(e => e.AccountId)
                    .HasName("PK__Accounts__349DA5A6CE057CBE");

                entity.ToTable("Accounts", "repository");

                entity.Property(e => e.CreationDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DeleteDate).HasColumnType("datetime");

                entity.Property(e => e.Description).HasMaxLength(200);

                entity.Property(e => e.EditDate).HasColumnType("datetime");

                entity.Property(e => e.ExternalId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.PasswordExpires).HasColumnType("date");

                entity.Property(e => e.Type)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.HasOne(d => d.Country)
                    .WithMany(p => p.Accounts)
                    .HasForeignKey(d => d.CountryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Accounts__Countr__2116E6DF");

                entity.HasOne(d => d.Server)
                    .WithMany(p => p.Accounts)
                    .HasForeignKey(d => d.ServerId)
                    .HasConstraintName("FK__Accounts__Server__22FF2F51");

                entity.HasOne(d => d.System)
                    .WithMany(p => p.Accounts)
                    .HasForeignKey(d => d.SystemId)
                    .HasConstraintName("FK__Accounts__System__23F3538A");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Accounts)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK__Accounts__UserId__24E777C3");
            });

            modelBuilder.Entity<CountryRegion>(entity =>
            {
                entity.HasKey(e => e.CountryId)
                    .HasName("PK__CountryR__10D1609F2F385FF7");

                entity.ToTable("CountryRegion", "repository");

                entity.Property(e => e.CountryRegionCode)
                    .IsRequired()
                    .HasMaxLength(3);

                entity.Property(e => e.CreationDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DeleteDate).HasColumnType("datetime");

                entity.Property(e => e.EditDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Servers>(entity =>
            {
                entity.HasKey(e => e.ServerId)
                    .HasName("PK__Servers__C56AC8E62C570FCE");

                entity.ToTable("Servers", "repository");

                entity.Property(e => e.AntivirusSoftware)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.Cputype).HasColumnName("CPUType");

                entity.Property(e => e.CreationDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DeleteDate).HasColumnType("datetime");

                entity.Property(e => e.EditDate).HasColumnType("datetime");

                entity.Property(e => e.ExternalId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.HardDisk)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.Host)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Model)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Ram).HasColumnName("RAM");

                entity.Property(e => e.TechSupport).HasComputedColumnSql("([repository].[CheckDate]([WarrantyExpirationDate]))");

                entity.Property(e => e.Ups)
                    .IsRequired()
                    .HasColumnName("UPS")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.WarrantyExpirationDate).HasColumnType("date");

                entity.HasOne(d => d.Country)
                    .WithMany(p => p.Servers)
                    .HasForeignKey(d => d.CountryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Servers__Country__25DB9BFC");
            });

            modelBuilder.Entity<Systems>(entity =>
            {
                entity.HasKey(e => e.SystemId)
                    .HasName("PK__Systems__9394F68AD0B1AC26");

                entity.ToTable("Systems", "repository");

                entity.Property(e => e.CompanyName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.CreationDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DeleteDate).HasColumnType("datetime");

                entity.Property(e => e.EditDate).HasColumnType("datetime");

                entity.Property(e => e.ExternalId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.TechSupport).HasComputedColumnSql("([repository].[CheckDate]([TechSupportExpDate]))");

                entity.Property(e => e.TechSupportExpDate).HasColumnType("date");

                entity.Property(e => e.Version)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Users>(entity =>
            {
                entity.HasKey(e => e.UserId)
                    .HasName("PK__Users__1788CC4C86121283");

                entity.ToTable("Users", "gr_user");

                entity.Property(e => e.CreationDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DeleteDate).HasColumnType("datetime");

                entity.Property(e => e.Description).HasMaxLength(200);

                entity.Property(e => e.EditDate).HasColumnType("datetime");

                entity.Property(e => e.Type)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsUnicode(false);
            });
        }
    }
}
