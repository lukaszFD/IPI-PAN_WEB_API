using System;
using DatabaseModelEFCore.Models.Documentation;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Configuration;

namespace DatabaseModelEFCore.Context
{
    public partial class DocumentationContext : DbContext
    {
        public DocumentationContext()
        {
        }

        public DocumentationContext(DbContextOptions<DocumentationContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Views> Views { get; set; }

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
            modelBuilder.Entity<Views>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("views", "documentation");

                entity.Property(e => e.ColumnId).HasColumnName("column_id");

                entity.Property(e => e.ColumnName)
                    .HasColumnName("column_name")
                    .HasMaxLength(128);

                entity.Property(e => e.DataType)
                    .HasColumnName("data_type")
                    .HasMaxLength(128);

                entity.Property(e => e.Description).HasColumnType("sql_variant");

                entity.Property(e => e.IsNullable).HasColumnName("is_nullable");

                entity.Property(e => e.MaxLength).HasColumnName("max_length");

                entity.Property(e => e.Precision).HasColumnName("precision");

                entity.Property(e => e.SchemaName)
                    .HasColumnName("schema_name")
                    .HasMaxLength(128);

                entity.Property(e => e.TableName)
                    .IsRequired()
                    .HasColumnName("table_name")
                    .HasMaxLength(128);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
