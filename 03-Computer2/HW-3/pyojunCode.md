# 1. About SQL injection

앞서 조사했던 OWASP Top 10 에서는 1순위를 SQL injection으로 꼽았다. 대체 이게 뭐길래 이렇게 위험한걸까?

SQL Injection : 서버 보안 상의 허점을 의도적으로 이용하여 악의적인 명령문을 실행되게 함으로 DB를 조작하거나 파괴하는 공격 기법.

이해가 잘되는 간단한 예 :

```
$username = $_POST["username"];
$password = $_POST["password"];

$mysqli->query("SELECT * FROM users WHERE username='{$username}' AND password='{$password}'");
```

매우 허접한 로그인 플랫폼이 있다고 가정하자. password에  ' OR '1' = '1  를 넣으면 항상 true가 되어 패스가된다.

마찬가지의 예로 어떠한 정보 입력창에

```
INSERT INTO students (NAME) VALUES ('test');
DROP TABLE students;
--');
```

를 입력한다면 해당 데이터 테이블이 모두 삭제될 것이다.

이런식으로 공격이 쉬운데 비해 엄청나게 치명적일 수 있다.

결국 쿼리명령어에 능통하고 예상되는 허점을 많이 알수록 공격하기 쉽다. 국내 사이트의 대규모 정보 유출도 고도의 SQL인젝션으로 인해 발생했을 수도 있다.

**그렇다면 방어 방법은 ?**

일반적인 방어 방법으로는 사용자에게 받은 값을 직접 SQL로 바로 넘기지 않는것.

입력을 웹사이트 내에서 자바스크립트로 검사 -> 해당 값을 prepared statement로 sql에 넘겨주기 -> 쿼리의 출력값을 한번 더 컴파일 하고 유저에게 넘겨주기.

(prepared statement : 쿼리를 사전에 컴파일 하고 변수만 따로 넘겨줌)

이렇게하면 SQL Injection과 동시에 XSS도 방어할 수 있다.