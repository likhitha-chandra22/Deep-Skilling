using System;
using System.Linq;

class Program
{
    static void Main()
    {
        int[] arr = { 1, 2, 2, 3, 4, 4, 5 };

        int[] unique = arr.Distinct().ToArray();

        foreach (int num in unique)
        {
            Console.Write(num + " ");
        }
    }
}