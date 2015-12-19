program codeBreaker;

uses crt;

var code,attempt : array [1..4] of integer;
guess:string;
current,guesses,check:integer;
broken:boolean;

begin

randomize;

for current := 1 to 4 do
begin
code[current] := random(9);
end;

crlscr;

TextColor(White);

writeln('Welcome To CodeBreaker');
writeln;
writeln('A random 4 digit code has been generated.');
writeln('Your job is to crack this code.');
writeln('You have 12 guesses or you lose!');
writeln('Write your guess below, good luck...');

repeat;

check := 0;

guess := '****';

repeat
if length(guess) <> 4 then writeln('Attempt is not 4 digits! Try again.');
writeln;
readln(guess);
until length(guess) = 4;

for current := 1 to 4 do
begin
val(guess[current],attempt[current],check);
if check = 1 then
begin
writeln('The value in position ', current, ' is not a number! Try again.');
break;
end;
end;

until check = 0;



