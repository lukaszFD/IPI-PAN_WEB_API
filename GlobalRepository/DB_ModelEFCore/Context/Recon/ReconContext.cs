using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Configuration;

namespace DB_ModelEFCore.Models.Recon
{
    public partial class ReconContext : DbContext
    {
        public ReconContext()
        {
        }

        public ReconContext(DbContextOptions<ReconContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Accounts> Accounts { get; set; }
        public virtual DbSet<Servers> Servers { get; set; }
        public virtual DbSet<Systems> Systems { get; set; }

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
                entity.HasKey(e => e.RecAccountId)
                    .HasName("PK__Accounts__C364A977971183EC");

                entity.ToTable("Accounts", "recon");

                entity.Property(e => e.CountryRegionCode).HasMaxLength(2);

                entity.Property(e => e.CreationDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Description).HasMaxLength(200);

                entity.Property(e => e.Name).HasMaxLength(50);

                entity.Property(e => e.PasswordExpires).HasColumnType("datetime");

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .HasDefaultValueSql("('I')");

                entity.Property(e => e.Type)
                    .HasMaxLength(1)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Servers>(entity =>
            {
                entity.HasKey(e => e.RecServerId)
                    .HasName("PK__Servers__81A6F43F0C8BED95");

                entity.ToTable("Servers", "recon");

                entity.Property(e => e.AntivirusSoftware)
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.CountryRegionCode).HasMaxLength(2);

                entity.Property(e => e.Cputype).HasColumnName("CPUType");

                entity.Property(e => e.CreationDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.HardDisk)
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.Host).HasMaxLength(50);

                entity.Property(e => e.Model).HasMaxLength(50);

                entity.Property(e => e.Name).HasMaxLength(50);

                entity.Property(e => e.Ram).HasColumnName("RAM");

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .HasDefaultValueSql("('I')");

                entity.Property(e => e.Ups)
                    .HasColumnName("UPS")
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.WarrantyExpirationDate).HasColumnType("date");
            });

            modelBuilder.Entity<Systems>(entity =>
            {
                entity.HasKey(e => e.RecSystemId)
                    .HasName("PK__Systems__BA13750BB8C1FF60");

                entity.ToTable("Systems", "recon");

                entity.Property(e => e.CompanyName).HasMaxLength(50);

                entity.Property(e => e.CreationDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name).HasMaxLength(50);

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .HasDefaultValueSql("('I')");

                entity.Property(e => e.TechSupportExpDate).HasColumnType("date");

                entity.Property(e => e.Version).HasMaxLength(50);
            });
        }
    }
}
