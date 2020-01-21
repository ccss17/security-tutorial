
# crackme0x04

처음 과정은 이때까지랑 동일.

```
         ► 0x804854e <main+69>    call   scanf@plt <0x8048374>
         format: 0x8048682 ◂— 0x7325 /* '%s' */
         vararg: 0xffffd4b0 ◂— 0x0
```

scanf는 **%s** 스트링을 스캔한다.

밑의 check 함수에 **step in** 해본다.

```
         ► 0x804849e <check+26>    call   strlen@plt <0x8048384>
         s: 0xffffd4b0 ◂— '123456'
```
        
check+26에서 ***strlen***을 호출해 길이를 체크하는것으로 보임.
        
```     
         0x80484a3 <check+31>    cmp    dword ptr [ebp - 0xc], eax     
         ► 0x80484a6 <check+34>    jae    check+119 <0x80484fb>
```
 
 만약 cmp가 일치하거나 크면 check+119로 jump한다. -> ***반복문 탈출***
 

 ebp-0xc 1씩 증가
 이때, check 함수 안에서는 
 
 sscanf로 (%d int) 한숫자씩 짤라서 최종적으로는 **ebp-8에 +=** 해준다.
 
 strlen으로 길이를 체크하고 **ebp-0xc ++ **(count로 보임)

위의 과정을 사용자가 입력한 암호의 길이만큼 ***반복한다.***

```
         0x80484d4 <check+80>     add    dword ptr [eax], edx
         0x80484d6 <check+82>     cmp    dword ptr [ebp - 8], 0xf
         ► 0x80484da <check+86>     jne    check+112 <0x80484f4>
```
 
 해당 반복문을 나온 후 cmp에서 (ebp-8 이때까지의 합들이 저장되있음.)과 0xf(15)를 비교한다.


```
        pwndbg> x/d $ebp-8
        0xffffd480:	15
```

15면 계속 진행 not equal이면 112로 점프 -> 아마 Invalid Password 출력할것임.

```
         ► 0x80484e3 <check+95>     call   printf@plt <0x8048394>
         format: 0x804863b ◂— 'Password OK!\n'
         vararg: 0x8048638 ◂— and    eax, 0x61500064 /* '%d' */
```
        
나같은 경우에는 그냥 12345를 해놓고 했는데 맞아버렸다.

결론적으로, 암호의 길이는 상관없고 그냥 **총합이 15가 되면 정답이다.**

### 555 -> Password OK!
### 12345 -> Password OK!
### 96 -> Password OK!
---


# crackme0x05

```
        ► 0x8048585 <main+69>    call   scanf@plt <0x8048374>
        format: 0x80486b2 ◂— 0x7325 /* '%s' */
        vararg: 0xffffd480 ◂— 0x0
```
        
04와 마찬가지로 %s 입력받는다. 그리고 check 함수 진입.

```

        ► 0x80484e2 <check+26>    call   strlen@plt <0x8048384>
        s: 0xffffd480 ◂— '12345'
```

이것도 strlen을 호출한다.

```
        0x80484e7 <check+31>    cmp    dword ptr [ebp - 0xc], eax
        ► 0x80484ea <check+34>    jae    check+106 <0x8048532>
```
그리고 cmp로 비교. 0x04랑 같은 구조인것 같다.

마찬가지로 sscanf로 한글자를 읽음. %d int타입이다.

`       0x8048512 <check+74>     mov    edx, dword ptr [ebp - 4]`
   
위에서 읽은 수를 edx로 넣어준다.

`       ► 0x804851a <check+82>     cmp    dword ptr [ebp - 8], 0x10`
 

그 후에 ebp-8을 0x10 ( 16)과 비교한다. 그럼 4번처럼 합이 16??

Password: 444

Password Incorrect!

역시 똑같은 문제는 아닌가보다.

gdb로는 계속 시도해봤지만 발견하지 못해 r2 명령어로 돌려보았다.

![](https://postfiles.pstatic.net/MjAxOTA3MTJfMjc1/MDAxNTYyODcyOTUyNzAx.OUvas8RMBxgWE3ilOIbfD_mYdhLJ-_fpSRalKeMZtK8g.r9iuRpULSmx3rQ74hyHOMHrWIQaJM59JarDEgLlcnxkg.PNG.potenpanda/SE-65f61afc-2b3e-413d-9fdd-fafaf216c894.png?type=w773)

04와 달리 sscanf 반복을 마친 뒤 cmp 후에 결과값이 16이면 parell 이라는 함수를 call하고 아니면 Incorrect를 출력하고
leave를 호출하는것을 찾을 수 있다.

parell 함수 또한 살펴보니

`        0x080484ae      c704246b8604.  mov dword [esp], str.Password_OK`
  
  라는 반가운 문구를 발견.
  
  
```
         0x80484a4 <parell+32>          mov    eax, dword ptr [ebp - 4]
         0x080484a7      83e001         and    eax, 1
         0x080484aa      85c0           test   eax, eax
         0x080484ac      7518           jne    0x80484c6
```
        
 ebp-4를 eax에 옮겨준 뒤,      
        
 eax와 1을 and시켜주고, eax와 eax를 test시켜준다.
 
```
         pwndbg> x/d $ebp-4
         0xffffd424:     5542
```

ebp-4에는 내가 입력한 전체 패스워드가 들어가있는 것을 알 수 있다.
 
 
*jne의 다음명령어가 Pass이고 not equal시 leave로 점프하기 떄문에, test의 결과가 0이여야한다.*
 
그렇다면 and의 의미가 뭘까,,?
  
->2진수를 1과 logical AND 를 하면 홀수면 1이나오고 짝수면 0이 나온다 !! (맞는 해석인지 모름)
  
그 후 **test를 하면 무조건 0이**기 때문에 ZF = true가 되고 jne이기 때문에 jump하지 않고
그다음 줄인 **Password_Ok**로 간다.

Password: 556
Password OK!

Password: 952
Password OK!
  
## 결국, 내가 입력한 패스워드의 합이 16이고 , 그 수는 짝수 여야한다.