using Confluent.Kafka;

namespace LibraryKafkaApplication
{
    public class Consumer
    {
        public static void ReceiveMessages()
        {
            var config = new ConsumerConfig
            {
                BootstrapServers = "localhost:9092",
                GroupId = "library-group",
                AutoOffsetReset = AutoOffsetReset.Earliest
            };

            using var consumer =
                new ConsumerBuilder<Ignore, string>(config).Build();

            consumer.Subscribe("library-topic");

            Console.WriteLine("Waiting for library notifications...");

            try
            {
                while (true)
                {
                    var result = consumer.Consume();

                    Console.WriteLine($"Notification Received : {result.Message.Value}");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                consumer.Close();
            }
        }
    }
}