.model small
.stack 100h

.data
menu db 13, 10, "Voting System", 13, 10
     db "1. Cast Vote", 13, 10
     db "2. View Results", 13, 10
     db "3. Show Winner", 13, 10
     db "4. Exit", 13, 10
     db "Enter your choice: $"

candidates db 13, 10, "Candidates", 13, 10
           db "1. Candidate A", 13, 10
           db "2. Candidate B", 13, 10
           db "3. Candidate C", 13, 10
           db "Enter your vote: $"

vote_msg db 13, 10, "Vote recorded!", 13, 10, "$"
invalid db 13, 10, "Invalid input!", 13, 10, "$"

result_msg db 13, 10, "Election Results:", 13, 10, "$"
result_a_msg db "Candidate A: $"
result_b_msg db 13, 10, "Candidate B: $"
result_c_msg db 13, 10, "Candidate C: $"

winner_msg db 13, 10, "The winner is: $"
tie_msg db 13, 10, "It's a tie between: $"
no_votes_msg db 13, 10, "No votes recorded yet!", 13, 10, "$"

newline db 13, 10, "$"

vote_a db 0
vote_b db 0
vote_c db 0

.code
main:
    mov ax, @data
    mov ds, ax

start_menu:
    ; Show menu
    mov ah, 09h
    lea dx, menu
    int 21h

    ; Get user input
    mov ah, 01h
    int 21h
    sub al, '0'  ; Convert ASCII to number

    cmp al, 1
    je cast_vote
    cmp al, 2
    je show_results
    cmp al, 3
    je show_winner
    cmp al, 4
    je exit_program

    ; Invalid choice
    mov ah, 09h
    lea dx, invalid
    int 21h
    jmp start_menu

cast_vote:
    ; Show candidates
    mov ah, 09h
    lea dx, candidates
    int 21h

    ; Get vote input
    mov ah, 01h
    int 21h
    sub al, '0'

    cmp al, 1
    je vote_for_a
    cmp al, 2
    je vote_for_b
    cmp al, 3
    je vote_for_c

    ; Invalid input
    mov ah, 09h
    lea dx, invalid
    int 21h
    jmp start_menu

vote_for_a:
    inc vote_a
    jmp vote_success

vote_for_b:
    inc vote_b
    jmp vote_success

vote_for_c:
    inc vote_c
    jmp vote_success

vote_success:
    mov ah, 09h
    lea dx, vote_msg
    int 21h
    jmp start_menu

show_results:
    mov ah, 09h
    lea dx, result_msg
    int 21h

    ; Candidate A
    mov ah, 09h
    lea dx, result_a_msg
    int 21h
    mov al, vote_a
    call print_num

    ; Candidate B
    mov ah, 09h
    lea dx, result_b_msg
    int 21h
    mov al, vote_b
    call print_num

    ; Candidate C
    mov ah, 09h
    lea dx, result_c_msg
    int 21h
    mov al, vote_c
    call print_num

    ; New line
    mov ah, 09h
    lea dx, newline
    int 21h

    jmp start_menu

show_winner:
    ; Check if no votes
    mov al, vote_a
    add al, vote_b
    add al, vote_c
    cmp al, 0
    jne find_winner

    ; No votes recorded
    mov ah, 09h
    lea dx, no_votes_msg
    int 21h
    jmp start_menu

find_winner:
    ; Compare A and B
    mov al, vote_a
    cmp al, vote_b
    ja a_greater_b
    jb b_greater_a

    ; A == B, now compare with C
    cmp al, vote_c
    ja a_b_tie
    jb c_greater
    je all_tie

a_greater_b:
    cmp al, vote_c
    ja a_winner
    je a_c_tie
    jmp c_greater

b_greater_a:
    mov al, vote_b
    cmp al, vote_c
    ja b_winner
    je b_c_tie
    jmp c_greater

a_b_tie:
    mov ah, 09h
    lea dx, tie_msg
    int 21h
    mov dl, 'A'
    mov ah, 02h
    int 21h
    mov dl, ' '
    int 21h
    mov dl, 'B'
    int 21h
    jmp winner_done

a_c_tie:
    mov ah, 09h
    lea dx, tie_msg
    int 21h
    mov dl, 'A'
    mov ah, 02h
    int 21h
    mov dl, ' '
    int 21h
    mov dl, 'C'
    int 21h
    jmp winner_done

b_c_tie:
    mov ah, 09h
    lea dx, tie_msg
    int 21h
    mov dl, 'B'
    mov ah, 02h
    int 21h
    mov dl, ' '
    int 21h
    mov dl, 'C'
    int 21h
    jmp winner_done

all_tie:
    mov ah, 09h
    lea dx, tie_msg
    int 21h
    mov dl, 'A'
    mov ah, 02h
    int 21h
    mov dl, ' '
    int 21h
    mov dl, 'B'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, 'C'
    int 21h
    jmp winner_done

a_winner:
    mov ah, 09h
    lea dx, winner_msg
    int 21h
    mov dl, 'A'
    mov ah, 02h
    int 21h
    jmp winner_done

b_winner:
    mov ah, 09h
    lea dx, winner_msg
    int 21h
    mov dl, 'B'
    mov ah, 02h
    int 21h
    jmp winner_done

c_greater:
    mov ah, 09h
    lea dx, winner_msg
    int 21h
    mov dl, 'C'
    mov ah, 02h
    int 21h

winner_done:
    mov ah, 09h
    lea dx, newline
    int 21h
    jmp start_menu

exit_program:
    mov ah, 4Ch
    int 21h

; --------------- Print_num procedure ----------------
; AL = number to print (0–255)
print_num proc
    pusha
    xor cx, cx
    mov bl, 10

next_digit:
    xor ah, ah
    div bl
    push ax
    inc cx
    cmp al, 0
    jne next_digit

print_loop:
    pop ax
    mov dl, ah
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_loop
    popa
    ret
print_num endp

end main
