using System;
using System.Linq;
using System.Collections.Generic;

public static class Kata
{
  public static string StringifyDict<TKey, TValue>(Dictionary<TKey, TValue> hash) =>
      String.Join(",", hash.Select( kv => $"{kv.Key} = {kv.Value}" ) );
}