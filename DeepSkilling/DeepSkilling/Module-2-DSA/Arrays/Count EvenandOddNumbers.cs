using System;

class Program
{
    static void Main()
    {
        int[] arr = { 1, 2, 3, 4, 5, 6 };

        int even = 0, odd = 0;

        foreach (int num in arr)
        {
            if (num % 2 == 0)
                even++;
            else
                odd++;
        }

        Console.WriteLine("Even = " + even);
        Console.WriteLine("Odd = " + odd);
    }
}