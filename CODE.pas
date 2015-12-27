program codeBreaker;

uses crt;

var code,attempt : array [1..4] of integer;
guess:string;
current,guesses,check:integer;
broken:boolean;

procedure main;
begin
    
    repeat;

        check := 0;
        guess := '****';

        repeat
            
            if length(guess) <> 4 then writeln('Attempt is not 4 digits! Try again.');
            writeln;
            readln(guess);
            writeln;
        
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
    
    for current := 1 to 4 do
    begin
        if attempt[current] = code[current] then
        begin
            writeln('Position ', current, ' Correct!');
            writeln;
        end
        else
        begin
            writeln('Position ', current, ' Incorrect.');
            writeln;
            broken := false;
        end;
    end;
            
    if broken = true then writeln('Well done, you have cracked the code!')
    else writeln('You guessed the code incorrectly, try again!');
    
    writeln;

end;

begin

    randomize;
    
    clrscr;

    for current := 1 to 4 do
    begin
        code[current] := random(9);
        write(code[current]);
    end;
    
    writeln;

    TextColor(White);

    writeln('Welcome To CodeBreaker');
    writeln;
    writeln('A random 4 digit code has been generated.');
    writeln('Your job is to crack this code.');
    writeln('You have 12 guesses or you lose!');
    writeln('Write your guess below, good luck...');
    
    guesses := 0;
    
    repeat
        main;
        guesses := guesses + 1;
        if guesses < 13 then
        begin
            writeln('You have ', 12 - guesses, ' attempts remaining.');
            writeln;
            writeln('Write your next attempt...');
        end
        else
        begin
            writeln('You ran out of attempts. Sorry you lost!');
            readln;
        end;
    until (broken = true) xor (guesses > 11);

end.