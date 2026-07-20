using System;

class Program
{
    static void Main()
    {
        int[] arr = {10, 20, 30, 40, 50};

        int index = Array.BinarySearch(arr, 40);

        if (index >= 0)
            Console.WriteLine("Element found at index " + index);
        else
            Console.WriteLine("Element not found");
    }
}