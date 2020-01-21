# GBC Security_04

## HW #4

### 리버싱 문제

#### 1. crackme0x04
 
main에서 check함수로 넘어가길래, check에 breakpoint를 걸어서 살펴보았다.  

gdb와 radare2로 열어서, 코드를 비교하면 비교적 쉽게 이해할 수 있다.   

gdb에서 < check+31> cmp를 보면, 유저의 input(string으로 입력받음)이 담긴 eax와 0을 비교하는 것을 볼 수 있다. r2 코드를 보면, eax가 0보다 작거나 같을 경우, label_0을 실행.

그런데 < check+26> 에서 strlen을 부르는 것을 보면, input의 길이를 비교한다는 것 또한 알 수 있다.

![h4-1](https://user-images.githubusercontent.com/47182864/61100593-b4b59600-a4a1-11e9-89b3-6c7758c06abc.png)

> `sscanf` : 문자열에서 형식화 된 데이터를 읽어온다. str에서 데이터를 형식 문자열(format)에서 지정하는 바에 따라 읽어와 그 데이터를 뒤에 부수적인 인자들이 가리키는 메모리 공간에 저장하게 된다. 이 때, 데이터가 저장되는 방식 역시 형식 문자열에 의해 결정된다.  

> * 입력한 string을 %d로 읽어오고 있어서 int형 이외의 input은 incorrect

![hw4-1-0](https://user-images.githubusercontent.com/47182864/61102537-33fa9800-a4a9-11e9-92e7-db2dc90aff26.png)

> 두번째 cmp에서 ebp-8을 0xf랑 비교하고 있다. 

> 0xf는 15인데, ebp-8이 담고 있는 것이 무엇인지 알아야한다.  

> `74` ebp-4의 값을 edx로 move 

> `77` eax가 ebp-8가리키도록 

> `80` eax(ebp-4)를 eax에 add  

> __[Conclusion]__  : user로부터 입력받은 input을 string으로 처리하여 길이를 비교하고, string의 byte를 __숫자로 변환__한 후 더해서 ebp-8에 합을 저장한다. 합과 0xf가 같을 경우 true이다.

> 따라서, 암호가 여러개다.

![h4-2](https://user-images.githubusercontent.com/47182864/61100594-b54e2c80-a4a1-11e9-9ece-c403eb264c3b.png)

![h4-3](https://user-images.githubusercontent.com/47182864/61100595-b54e2c80-a4a1-11e9-90e5-af98c30a665c.png)

> __[Result]__ 

![h4-1](https://user-images.githubusercontent.com/47182864/61101596-52f72b00-a4a5-11e9-948d-2a3987a10e52.png)

#### 2. crackme0x05

> 0x10을 10진수로 바꿔보니 16이였다. 코드가 04번과 유사하길래 더해서 16이 되는 수를 입력해보니 pw였다.

![hw4-2](https://user-images.githubusercontent.com/47182864/61102282-2db7ec00-a4a8-11e9-8f16-cc7d1ab9325c.png)

> 합쳐서 16맞는데 답이 아니네 .. 아-숩 

![hw4-2](https://user-images.githubusercontent.com/47182864/61103397-c3ee1100-a4ac-11e9-98ef-434ac4c31ef6.png)

> 다시 코드를 보니 parell이라는 함수를 또 호출한다. 

> > `and` : 2개의 비트가 모두 참(1)일 경우 참(1), 다르면 거짓 (0)  

> > `test` : `<op1>` 과 `<op2>` 의 AND 연산 결과가 0 일 때 FLAG 레지스터의 Zero Flag, 즉 ZF 를 True 로 세팅한다. (찬솔님이 알려주신거)

> > 주로, test a, 0x02라고 하면 a에 0x02가 있나 없나 확인하는 명령이라고 한다.

> and 연산의 결과가 1이면 홀수, 0이면 짝수.

> test eax eax 하면, 리턴값이 0인지 1인지 알 수 있다.

![hw5-1](https://user-images.githubusercontent.com/47182864/61103727-2267bf00-a4ae-11e9-8236-5e51a855009f.png)

![hw5-2](https://user-images.githubusercontent.com/47182864/61103728-23005580-a4ae-11e9-8aa2-68594177eef8.png)

> r2 pdd로 확인해보니, 리턴값이 0이여야 암호가 맞다고 나온다.

> 따라서, input에서 마지막 자리에 짝수가 저장되어있어야 맞는 루틴이 된다.

![hw5-3](https://user-images.githubusercontent.com/47182864/61104007-8c349880-a4af-11e9-8abc-cff98141bf81.png)

> __[Conclusion]__ : 04번과 유사한데, 암호가 짝수인지 체크하는 부분이 있다.