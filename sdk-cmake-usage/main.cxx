#include <iostream>
#include <thread>
#include <chrono>
#include <mutex>

std::mutex g_pages_mutex;

void task1(std::string msg)
{
    std::lock_guard<std::mutex> guard(g_pages_mutex);
    std::cout << "Task1 says: " << std::endl;
    for (std::size_t x = 0, length = msg.length(); x != length; ++x) {
        std::cout << msg[x] << std::endl;
        std::this_thread::sleep_for(std::chrono::milliseconds(288));
    }
}

void task2(std::string msg)
{
    std::lock_guard<std::mutex> guard(g_pages_mutex);
    std::cout << "Task2 says: " << std::endl;
    for (std::size_t x = 0, length = msg.length(); x != length; ++x) {
        std::cout << msg[x] << std::endl;
        std::this_thread::sleep_for(std::chrono::milliseconds(344));
    }
}

int main() {
    std::cout << "Hello Poky World!" << std::endl;

    while(true) {
        std::thread t1(task1, "PING PINg PIng Ping ping");
        std::thread t2(task2, "Pong");
        t1.join();
        t2.join();
    }
    return 0;
}