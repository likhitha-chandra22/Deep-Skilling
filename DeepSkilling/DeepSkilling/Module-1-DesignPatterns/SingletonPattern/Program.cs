using System;

public sealed class ConfigurationManager
{
    private static ConfigurationManager instance;

    private ConfigurationManager()
    {
    }

    public static ConfigurationManager GetInstance()
    {
        if (instance == null)
        {
            instance = new ConfigurationManager();
        }

        return instance;
    }

    public void ShowSettings()
    {
        Console.WriteLine("Application Configuration Loaded");
    }
}

class Program
{
    static void Main()
    {
        ConfigurationManager config1 = ConfigurationManager.GetInstance();
        ConfigurationManager config2 = ConfigurationManager.GetInstance();

        config1.ShowSettings();

        Console.WriteLine("Same Object: " +
                          ReferenceEquals(config1, config2));
    }
}