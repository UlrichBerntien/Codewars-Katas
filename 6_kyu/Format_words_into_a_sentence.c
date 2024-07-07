#include <stdlib.h>
#include <string.h>

/**
 *  Format words into a sentence.
 *  need_before: Numer of chars needed before the sentence in the string.
 *  word: NULL terminated list of words.
 *  Return: "<EMPTY>word1, word2 and word". Caller must free the string.
 */
static char *add_to_sentence(const size_t need_before,
                             const char *const words[]) {
    // exit on no more words or no word list
    if (!words || !words[0]) {
        char *const buffer = malloc(need_before + 1);
        buffer[need_before] = '\0';
        return buffer;
    }
    // add this word to the sentence
    const char *const the_word = words[0];
    const size_t word_len = strlen(the_word);
    // index of next, not empty word
    int next_word = 1;
    while (words[next_word] && words[next_word][0] == 0) ++next_word;
    // separator to use
    const char *sep;
    int sep_len;
    if (need_before == 0) {
        // no separator before first word
        sep = "";
        sep_len = 0;
    } else if (words[next_word] == NULL) {
        // separator before last word
        sep = " and ";
        sep_len = strlen(sep);
    } else {
        // separator inside the list
        sep = ", ";
        sep_len = strlen(sep);
    }
    // add the other word recursive
    char *const buffer =
        add_to_sentence(need_before + word_len + sep_len, words + next_word);
    // error exit
    if (!buffer) return buffer;
    // now add the word
    memcpy(buffer + need_before, sep, sep_len);
    memcpy(buffer + need_before + sep_len, the_word, word_len);
    return buffer;
}

/**
 *  Format words into a sentence.
 *  word: NULL terminated list of words.
 *  Return: "word1, word2 and word". Caller must free the string.
 */
char *words_to_sentence(const char *const words[]) {
    // recursive implementation
    return add_to_sentence(0, words);
}
