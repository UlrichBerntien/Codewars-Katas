using System;
using System.Collections.Generic;
using System.Linq;


internal class LetterCount
{
  private Dictionary<char,int> letters = new Dictionary<char,int>();

  public LetterCount (string text) {
    int tmp;
    foreach (char it in text.ToLower()) {
      letters.TryGetValue(it, out tmp);
      letters[it] = tmp + 1;
      }
    }
  
  public bool Equals (LetterCount rhs) {
    try
      {
      return letters.Count == rhs.letters.Count
          && letters.All( it => it.Value == rhs.letters[it.Key] );
      }
    catch
      {
      return false;
      }
    }
}


public static class Kata
{
  public static List<string> Anagrams(string word, List<string> words)
  {
    var word_letters = new LetterCount(word);
    return words.FindAll( it => word_letters.Equals(new LetterCount(it)) );
  }
}
