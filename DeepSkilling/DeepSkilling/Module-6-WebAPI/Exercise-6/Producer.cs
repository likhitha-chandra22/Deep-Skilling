using Confluent.Kafka;

namespace LibraryKafkaApplication
{
    public class Producer
    {
        public static async Task SendMessage(string message)
        {
            var config = new ProducerConfig
            {
                BootstrapServers = "localhost:9092"
            };

            using var producer =
                new ProducerBuilder<Null, string>(config).Build();

            try
            {
                var result = await producer.ProduceAsync(
                    "library-topic",
                    new Message<Null, string>
                    {
                        Value = message
                    });

                Console.WriteLine($"Library Notification Sent : {result.Value}");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}