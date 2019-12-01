using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Configuration;

namespace DB_ModelEFCore.Models.Documentation
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

        public virtual DbSet<GrTables> GrTables { get; set; }

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

            modelBuilder.Entity<GrTables>(entity =>
            {
                entity.HasKey(e => e.TableId)
                    .HasName("PK__gr_table__7D5F01EEB45EBB17");

                entity.ToTable("gr_tables", "documentation");

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
        }
    }
}
