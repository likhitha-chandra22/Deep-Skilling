using System;

public interface IDocument
{
    void Open();
}

public class ExcelDocument : IDocument
{
    public void Open()
    {
        Console.WriteLine("Excel Document Opened");
    }
}

public class TextDocument : IDocument
{
    public void Open()
    {
        Console.WriteLine("Text Document Opened");
    }
}

public abstract class DocumentFactory
{
    public abstract IDocument CreateDocument();
}

public class ExcelFactory : DocumentFactory
{
    public override IDocument CreateDocument()
    {
        return new ExcelDocument();
    }
}

public class TextFactory : DocumentFactory
{
    public override IDocument CreateDocument()
    {
        return new TextDocument();
    }
}

class Program
{
    static void Main()
    {
        DocumentFactory factory = new ExcelFactory();
        IDocument doc1 = factory.CreateDocument();
        doc1.Open();

        factory = new TextFactory();
        IDocument doc2 = factory.CreateDocument();
        doc2.Open();
    }
}