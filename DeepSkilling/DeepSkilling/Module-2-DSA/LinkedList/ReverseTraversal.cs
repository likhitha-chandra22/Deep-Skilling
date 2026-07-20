using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        LinkedList<int> list = new LinkedList<int>();

        list.AddLast(10);
        list.AddLast(20);
        list.AddLast(30);

        LinkedListNode<int> node = list.Last;

        while (node != null)
        {
            Console.Write(node.Value + " ");
            node = node.Previous;
        }
    }
}