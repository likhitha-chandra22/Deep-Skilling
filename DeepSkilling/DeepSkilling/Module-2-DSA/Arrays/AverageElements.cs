using System;

class Program
{
    static void Main()
    {
        int[] arr = { 10, 20, 30, 40, 50 };
        int sum = 0;

        foreach (int num in arr)
            sum += num;

        double average = (double)sum / arr.Length;

        Console.WriteLine("Average = " + average);
    }
}