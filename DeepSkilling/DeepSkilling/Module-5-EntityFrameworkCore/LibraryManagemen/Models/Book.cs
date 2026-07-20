namespace LibraryManagement.Models
{
    public class Book
    {
        public int Id { get; set; }

        public string Title { get; set; } = string.Empty;

        public decimal Price { get; set; }

        public string Category { get; set; } = string.Empty;

        public int AuthorId { get; set; }

        public Author? Author { get; set; }
    }
}