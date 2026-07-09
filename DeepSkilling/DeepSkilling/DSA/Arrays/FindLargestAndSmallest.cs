using System;

class Program
{
    static void Main()
    {
        int[] arr = { 15, 8, 30, 2, 18 };

        int max = arr[0];
        int min = arr[0];

        foreach (int num in arr)
        {
            if (num > max)
                max = num;

            if (num < min)
                min = num;
        }

        Console.WriteLine("Largest = " + max);
        Console.WriteLine("Smallest = " + min);
    }
}