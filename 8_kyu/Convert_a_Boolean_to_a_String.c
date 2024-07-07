#include <stdbool.h>

/**
 *  Converts boolean to word true or false.
 *  Return: a static string constant.
 */
const char *boolean_to_string(bool b)
{
    return b ? "true" : "false";
}