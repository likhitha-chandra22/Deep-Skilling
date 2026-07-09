using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        LinkedList<int> list = new LinkedList<int>();

        list.AddFirst(20);
        list.AddFirst(10);

        foreach (int item in list)
            Console.Write(item + " ");
    }
}