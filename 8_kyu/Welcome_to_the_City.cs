using System;

public class Kata
{
  public static string SayHello(string[] name, string city, string state)
    => $"Hello, {String.Join(' ',name)}! Welcome to {city}, {state}!";
}