using System;

class Program
{
    static void Main()
    {
        int[] arr = { 12, 45, 67, 23, 89 };

        int min = arr[0];

        foreach (int num in arr)
        {
            if (num < min)
                min = num;
        }

        Console.WriteLine("Minimum = " + min);
    }
}