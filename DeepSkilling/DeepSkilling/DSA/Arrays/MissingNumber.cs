using System;

class Program
{
    static void Main()
    {
        int[] arr = { 1, 2, 3, 5 };

        int n = 5;
        int expected = n * (n + 1) / 2;

        int actual = 0;

        foreach (int num in arr)
            actual += num;

        Console.WriteLine("Missing Number = " + (expected - actual));
    }
}