using System;

class Program
{
    static void Main()
    {
        int[] arr = {29, 10, 14, 37, 13};

        for (int i = 0; i < arr.Length - 1; i++)
        {
            int minIndex = i;

            for (int j = i + 1; j < arr.Length; j++)
            {
                if (arr[j] < arr[minIndex])
                    minIndex = j;
            }

            int temp = arr[i];
            arr[i] = arr[minIndex];
            arr[minIndex] = temp;
        }

        foreach (int num in arr)
            Console.Write(num + " ");
    }
}