using System;

class Program
{
    static void Main()
    {
        int[] arr = {5, 2, 5, 7, 5, 8};

        int key = 5;
        int count = 0;

        foreach (int num in arr)
        {
            if (num == key)
                count++;
        }

        Console.WriteLine("Occurrences = " + count);
    }
}