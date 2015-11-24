/* 
 * File:   main.c
 * Author: Administrator
 *
 * Created on September 12, 2014, 6:08 AM
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/* scanf error catcher
int check = 1;
int var = 0;
while(check){
check = !scanf("%d", &var);
}
*/

void shuffle();
void scorekeeper();
void playhand();

int main(){
	int template [] = {2,3,4,5,6,7,8,9,10,10,10,10,11};
	int deck[52];
	int temp, netpoints;
        int win = 2;
        int playerscore = 100, dealerscore = 100, endgame = 0;
        
        for(int i = 0; i < 52; i++){
            deck[i] = template[i%13];
        }
        
        shuffle(deck);
        printf("You have %d points and the computer has %d points.\n",playerscore,dealerscore);
        
//        for(int i = 0; i < 52; i++){
//            printf("%d\n",deck[i]);
//        }
        
        while((playerscore >= 0) || (dealerscore >= 0)){
            printf("Play a hand of Blackjack? (1 = Hit, 0 = Stay)\n");
            scanf("%d",endgame);
            if (endgame == 1) break;
            
//            for(int i = 0; i < 52; i++){		
//                printf("%d\n",deck[i]);
//            }

            scorekeeper(win,playerscore,dealerscore);
            playhand(win,deck);
            shuffle(deck);
            
            }        
            if (playerscore >= dealerscore){
                netpoints = playerscore - dealerscore;
                printf("You won a total of %d points\n",netpoints);
            }
            if (playerscore == dealerscore){
                printf("You broke even.\n");
            }
            else {
                netpoints = dealerscore - playerscore;
                printf("You lost a total of %d points\n",netpoints);
            }
        return 0;
    }
// shuffles the deck
void shuffle(int  * deck){
        unsigned long timenow = time(NULL);
        srand(timenow);
        for(int i = 0; i < 52; i++){
		timenow = time(NULL);
                int iRnd = rand() % 52;
		int temp = deck[i];
		deck[i] = deck[iRnd];
		deck[iRnd] = temp;

	}
	
}

// scorekeeper keeps track of bets, and determines winners/losers 
void scorekeeper(int win, int playerscore,int dealerscore){
    
    unsigned int bet;
    
    // win == 1 means player wins hand
    if (win == 1){
            playerscore = playerscore + bet;
            dealerscore = dealerscore - bet;
            printf("You won %d points.\n",bet);
            printf("You have %d points and the computer has %d points.\n",playerscore,dealerscore);
            bet = 0;
            win = 2;
    }
    // win == 0 means player loses hand
    if (win == 0){
            playerscore = playerscore - bet;
            dealerscore = dealerscore + bet;
            printf("You won %d points.\n",bet);
            printf("You have %d points and the computer has %d points.\n",playerscore,dealerscore);
            bet = 0;
            win = 2;
    }
    // win == 2 means a hand has not been started or nobody has won the hand yet
    if (win == 2){
        printf("Place your bet.\n");
        scanf("%d", &bet);
        printf("You bet %d.\n",bet);
    }
}
// plays a hand of blackjack
void playhand(int win, int deck[]){
    int playerhandscore, dealerhandscore;
    int endhand = 0;
    
    dealerhandscore = 0;
    playerhandscore = 0;
    
    for(int i = 0; i < 52; i++){
        if (endhand == 1){
            endhand = 0;
            break;
        }
        if (dealerhandscore <= 17){
            dealerhandscore = dealerhandscore + deck[i];
            if (i == 2 && deck[2] == 11){                                                           // This should make the value of a second ace == 1
                dealerhandscore = dealerhandscore - 10;                                             //
                printf("Dealer drew a second ace.");                                                //
                printf("Dealer got a %d, so their score is %d.\n",deck[i] - 10,dealerhandscore);    // this line might not give the correct output
            }
            if (dealerhandscore > 21){
                printf("Dealer got a %d, so their score is %d.\nDealer loses!\n",deck[i],dealerhandscore);
                win = 1;
                break;
            }
            else {
                printf("Dealer got a %d, so their score is %d.\n",deck[i],dealerhandscore);
            }
            i++;                                                          // increases the index so player does not get dealt the same card as dealer
        }
        playerhandscore = playerhandscore + deck[i];
        printf("You got a %d, so your score is %d.\n",deck[i],playerhandscore);
            
        if (playerhandscore > 21){
            printf("Player loses!\n");
            win = 0;
            break;
        }
        
            
        printf("Hit or stay? (1 = Hit, 0 = Stay)\n");
            scanf("%d",endhand);
        }
        
    if(win == 2){    
        if (playerhandscore >= dealerhandscore){
            win = 1;
            printf("Player wins %d to %d.\n",playerhandscore,dealerhandscore);
        }
        else {
            win = 0;
            printf("Player loses %d to %d.\n",playerhandscore,dealerhandscore);
        }
    }
}

