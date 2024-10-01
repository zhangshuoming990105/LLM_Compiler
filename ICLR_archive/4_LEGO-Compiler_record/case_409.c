int ft_tolower(int c)
{
 if (c >= 'A' && c <= 'Z')
  c -= 'A' + 'a';
 return (c);
}