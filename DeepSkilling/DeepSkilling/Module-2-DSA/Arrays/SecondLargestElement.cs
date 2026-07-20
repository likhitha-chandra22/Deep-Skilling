using System;

class Program
{
    static void Main()
    {
        int[] arr = { 10, 40, 20, 90, 70 };

        Array.Sort(arr);

        Console.WriteLine("Second Largest = " + arr[arr.Length - 2]);
    }
}