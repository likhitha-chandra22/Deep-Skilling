using System;

class Program
{
    static void Main()
    {
        int[] arr = { 45, 12, 67, 10, 89 };

        Array.Sort(arr);

        Console.WriteLine("Sorted Array:");

        foreach (int num in arr)
        {
            Console.Write(num + " ");
        }
    }
}