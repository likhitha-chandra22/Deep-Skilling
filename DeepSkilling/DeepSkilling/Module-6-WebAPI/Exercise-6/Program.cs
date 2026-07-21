namespace LibraryKafkaApplication
{
    internal class Program
    {
        static async Task Main(string[] args)
        {
            Console.WriteLine("=====================================");
            Console.WriteLine(" Library Kafka Application");
            Console.WriteLine("=====================================");

            Console.Write("Enter Library Notification : ");

            string message = Console.ReadLine()!;

            await Producer.SendMessage(message);

            Console.WriteLine();

            Console.WriteLine("Starting Library Consumer...");

            Consumer.ReceiveMessages();
        }
    }
}