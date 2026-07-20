namespace LibraryManagement.Models
{
    public class Borrow
    {
        public int Id { get; set; }

        public int MemberId { get; set; }

        public int BookId { get; set; }

        public DateTime BorrowDate { get; set; }
    }
}