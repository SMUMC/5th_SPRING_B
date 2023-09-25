# 1주차 umc 스터디

### **서버란**?

서버는 OS에 의해 동작하는 프로세스이며 클라이언트의 역할을 하는 프로세스와 소켓을 통해 IPC를 수행하는 것

### **알아볼 것**

클라이언트의 요청 데이터가 어떻게 서버에 도착하고, 또 서버에서 만든 데이터가 어떻게 클라이언트에 도착하는가?

우리가 구현할 웹 서버의 http는  **TCP를 기반으로** 동작한다.

![Untitled](https://github.com/SMUMC/5th_SPRING_B/assets/89975936/2c49f86d-e21a-490d-b15c-85acdc7d6474)


출처:tcpschool

### **웹의 동작 방식** :

1. HTTP프로토콜을 사용, HTTP 요청 메세지 생성
2. TCP/IP 연결을 통해 HTTP요청이 서버로 전송
3. 서버는 HTTP프로토콜을 사용, HTTP 응답 메세지 생성
4. TCP/IP 연결을 통해 요청한 컴퓨터로 전송

**TCP :**

장점 : 연결형 프로토콜로 신뢰성 보장

단점 : UDP보다 느린 속도

**소켓** : 

네트워크 상의 다른 프로세스와 통신하는 엔드포인트

**서버 소켓의 시스템 콜**

socket() : 소켓 생성, 파일 디스크립터를 리턴값으로 가짐

bind() : 생성된 소켓에 IP주소와 포트번호 부여

listen() : 서버 소켓을 대기 시키고 대기 요청을 backlog queue에 저장

accept() : backlog queue의 요청 수락 및 새로운 소켓 생성

bind(), listen(), accept() 세 가지 함수를 순차적으로 호출함으로써 서버 측에서의 데이터 송수신 준비를 마칠 수 있다. 이후 write() , read()로 데이터 송수신한다.

이 과정에서 클라이언트의 요청을 받고 응답하는 것을 **멀티 프로세스**로 나눈다. (혹은 **멀티 쓰레드**)

**멀티 프로세스** : 

- 하나의 프로그램을 여러 프로세스로 구성하여 각 프로세스가 하나의 작업 처리
- 프로세스간 IPC를 사용해 데이터 주고받을 수 있음
- 부모 프로세스와 자식 프로세스
    - 하나의 프로세스가 다른 프로세스를 생성할 때, 생성한 프로세스를 부모 프로세스, 생성된 프로세스가 자식 프로세스
    - 부모 프로세스는 자식 프로세스에 대해서 종료 처리를 해주어야 함. (좀비 프로세스 생성 방지를 위해)

멀티 프로세스로 구현된 아파치(HTTP 웹 서버)의 코드에서 공부한 내용 확인 가능

```c
#include < stdio.h >
#include < stdlib.h >
#include < string.h >
#include < unistd.h >
#include < arpa / inet.h >
int main()
{
    const char *server_ip = "127.0.0.1";
    int server_port = 8080;
    int server_socket = socket(AF_INET, SOCK_STREAM, 0);
    if (server_socket == -1)
    {
        perror("Socket creation failed");
        return 1;
    }
    struct sockaddr_in server_addr, client_addr;
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(server_port);
    server_addr.sin_addr.s_addr = inet_addr(server_ip);
    if (bind(server_socket, (struct sockaddr *)&server_addr, sizeof(server_addr)) == -1)
    {
        perror("Binding failed");
        return 1;
    }
    if (listen(server_socket, 5) == -1)
    {
        perror("Listening failed");
        return 1;
    }
    printf("Server listening on %s:%d\n", server_ip, server_port);
    while (1)
    {
        socklen_t client_addr_len = sizeof(client_addr);
        int client_socket = accept(server_socket, (struct sockaddr *)&client_addr, &client_addr_len);
        if (client_socket == -1)
        {
            perror("Accepting client failed");
            continue;
        }
        printf("Accepted connection from %s:%d\n", inet_ntoa(client_addr.sin_addr), ntohs(client_addr.sin_port));
        char request[1024];
        recv(client_socket, request, sizeof(request), 0);
        printf("Received request:\n%s\n", request);
        char response[] = "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\nHello, World!";
        send(client_socket, response, sizeof(response), 0);
        close(client_socket);
    }
    close(server_socket);
    return 0;
}
```

**학습 중 ..**

<aside>
💡 TCP의 3-way-handshake 과정에 서버의 SYN+ACK 전송, ACK 수신과 listen(), accept() 시스템 콜이 일어나는 순서를 잘 이해하지 못하였었다.

</aside>

⇒ listen() 시스템 콜이 호출되고 나면, TCP 스택은 3-way-handshake를 수행한다. 이후 TCP handshake 이후 accept()가 발생하고 클라이언트로 부터 ACK를 받는다.

accept() 시스템 콜이 SYN+ACK를 보내는 것이라고 이해했던 것이 잘못되었음을 알았다.

출처: [https://stackoverflow.com/questions/34676972/about-listen-accept-in-network-socket-programming3-way-handshaking](https://stackoverflow.com/questions/34676972/about-listen-accept-in-network-socket-programming3-way-handshaking)

[https://stackoverflow.com/questions/18451462/does-accept-event-happens-after-the-three-way-handshake](https://stackoverflow.com/questions/18451462/does-accept-event-happens-after-the-three-way-handshake)
