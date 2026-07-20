using Microsoft.EntityFrameworkCore;
using LibraryManagement.Data;

namespace LibraryManagement
{
    internal class Program
    {
        static async Task Main(string[] args)
        {
            using var context = new LibraryDbContext();

            Console.WriteLine("=====================================");
            Console.WriteLine(" Lab 15 - Optimistic Concurrency ");
            Console.WriteLine("=====================================\n");

            try
            {
                var book = await context.Books
                    .FirstOrDefaultAsync();

                if (book != null)
                {
                    book.Price += 100;

                    await context.SaveChangesAsync();

                    Console.WriteLine("Book updated successfully.");
                }
                else
                {
                    Console.WriteLine("No book found.");
                }
            }
            catch (DbUpdateConcurrencyException)
            {
                Console.WriteLine("Concurrency conflict detected.");
            }

            Console.WriteLine();
            Console.WriteLine("Lab 15 Completed Successfully.");
        }
    }
}